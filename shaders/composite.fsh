#include "/bundle/common.glsl"

#include "/enum/modid.glsl"
#include "/enum/entity_category.glsl"
#include "/enum/tileentity.glsl"
#include "/settings/render/xray.glsl"
#include "/settings/render/esp.glsl"
#include "/settings/render/chestesp.glsl"
#include "/settings/render/cavefinder.glsl"
#include "/settings/xray.glsl"
#include "/settings/esp.glsl"
#include "/settings/chestesp.glsl"
#include "/settings/cavefinder.glsl"

uniform sampler2D gcolor;
uniform sampler2D colortex3; // Hand
uniform sampler2D colortex5; // Entities
uniform sampler2D colortex6; // TileEntities

uniform float near;
uniform float far;
uniform mat4 gbufferProjectionInverse;
uniform sampler2D shadowtex0;
uniform sampler2D depthtex0;
uniform sampler2D shadowcolor0;
uniform sampler2D shadowcolor1;

uniform float viewWidth;
uniform float viewHeight;

/* DRAWBUFFERS:02 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
    #define glowColor gl_FragData[1]
#else
    layout(location = 0) out vec4 color;
    layout(location = 1) out vec4 glowColor;
#endif // IS_IRIS

vec3 getGlowXrayColor(int modId);
vec3 getGlowESPColor(int modId);
vec3 getGlowChestESPColor(int modId);

float linearizeDepthFast(float depth) {
    float trueFar = far * 4.0;
    return (near * trueFar) / (depth * (near - trueFar) + trueFar);
}

void main() {
    vec2 screenCoord = gl_FragCoord.xy / vec2(viewWidth, viewHeight);
    
    float depthShadow = texture(shadowtex0, screenCoord).x;
    vec3 ndcShadow = vec3(screenCoord * 2.0 - 1.0, depthShadow * 2.0 - 1.0);
    vec4 viewPosShadow = gbufferProjectionInverse * vec4(ndcShadow, 1.0);
    float sceneDepthShadow = -(viewPosShadow.z / viewPosShadow.w) / (far * 4.0);

    float depthHW = texture(depthtex0, screenCoord).x;
    vec3 ndcHW = vec3(screenCoord * 2.0 - 1.0, depthHW * 2.0 - 1.0);
    vec4 viewPosHW = gbufferProjectionInverse * vec4(ndcHW, 1.0);
    float sceneDepthHW = -(viewPosHW.z / viewPosHW.w) / (far * 4.0);

	color = texture(gcolor, screenCoord); 
    bool cfOverride = false;
    
    #if XRAY_ENABLED != STATE_DISABLED
        vec4 shadowInfo = texture(shadowcolor1, screenCoord);
        if (abs(shadowInfo.b - 0.5) < 0.05) {
            vec4 xrayColor = texture(shadowcolor0, screenCoord);
            float xrayDepth = shadowInfo.r;
            
            #ifdef XRAY_RENDER_ONTOP
                if(xrayColor.a > EPSILON) {
                    color = xrayColor;
                    cfOverride = true;
                }
            #endif // XRAY_RENDER_ONTOP
            #ifdef XRAY_RENDER_OCCLUSION
                if(xrayColor.a > EPSILON) {
                    if(xrayDepth - sceneDepthHW < EPSILON)
                        color = vec4(XRAY_RENDER_OCCLUSION_COLOR_VISIBLE, 1.0);
                    else
                        color = vec4(XRAY_RENDER_OCCLUSION_COLOR_OCCLUDED, 1.0);
                }
            #endif // XRAY_RENDER_OCCLUSION
            #ifdef XRAY_RENDER_GLOW
                if(xrayColor.a > EPSILON)
                    glowColor = vec4(getGlowXrayColor(int(shadowInfo.g)), 1.0);
            #endif // XRAY_RENDER_GLOW
        }
    #endif // XRAY_ENABLED
    #ifdef ESP_ENABLED
        vec4 espLayer = texture(colortex5, screenCoord);
        #ifndef ESP_RENDER_ONTOP
            if(espLayer.r > sceneDepthShadow)
                color = texture(shadowcolor0, screenCoord);
        #else
            if(espLayer.r > EPSILON)
                cfOverride = true;
        #endif // ESP_RENDER_ONTOP
        #ifdef ESP_RENDER_OCCLUSION
            if(espLayer.r > EPSILON) {
                if(espLayer.r - sceneDepthShadow < EPSILON)
                    color = vec4(ESP_RENDER_OCCLUSION_COLOR_VISIBLE, 1.0);
                else
                    color = vec4(ESP_RENDER_OCCLUSION_COLOR_OCCLUDED, 1.0);
            }
        #endif // ESP_RENDER_OCCLUSION
        #ifdef ESP_RENDER_GLOW
            if(espLayer.r > EPSILON)
                glowColor = vec4(getGlowESPColor(int(espLayer.g)), 1.0);
        #endif // ESP_RENDER_GLOW
    #endif // ESP_ENABLED
    #ifdef CHESTESP_ENABLED
        vec4 chestespLayer = texture(colortex6, screenCoord);
        #ifndef CHESTESP_RENDER_ONTOP
            if(chestespLayer.r > sceneDepthShadow)
                color = texture(shadowcolor0, screenCoord);
        #else
            if(chestespLayer.r > EPSILON)
                cfOverride = true;
        #endif // CHESTESP_RENDER_ONTOP
        #ifdef CHESTESP_RENDER_OCCLUSION
            if(chestespLayer.r > EPSILON) {
                if(chestespLayer.r - sceneDepthShadow < EPSILON)
                    color = vec4(CHESTESP_RENDER_OCCLUSION_COLOR_VISIBLE, 1.0);
                else
                    color = vec4(CHESTESP_RENDER_OCCLUSION_COLOR_OCCLUDED, 1.0);
            }
        #endif // CHESTESP_RENDER_OCCLUSION
        #ifdef CHESTESP_RENDER_GLOW
            if(chestespLayer.r > EPSILON)
                glowColor = vec4(getGlowChestESPColor(int(chestespLayer.g)), 1.0);
        #endif // CHESTESP_RENDER_GLOW
    #endif // CHESTESP_ENABLED
    #ifdef CAVEFINDER
        if(cfOverride)
            return;
        float hwDepth = 1 - ((texture(depthtex0, screenCoord).r - 0.75) * 4) * (far * 4 * near);
        if(hwDepth > sceneDepthShadow) {
            color = mix(color, texture(shadowcolor0, screenCoord), CAVEFINER_RENDER_TRANSPARENCY / 100.0);
        }
    #endif // CAVEFINDER
    // Fix up the hand depth
    if(texture(colortex3, screenCoord).r == 1.0) {
        color = texture(gcolor, screenCoord);
    }
}

vec3 getGlowXrayColor(int modId) {
	switch(modId) {
        case MINECRAFT:
            return XRAY_GLOW_COLOR_MINECRAFT;
        case INDUSTRIAL_CRAFT:
            return XRAY_GLOW_COLOR_INDUSTRIAL_CRAFT;
        case IMMERSIVE_ENGINEERING:
            return XRAY_GLOW_COLOR_IMMERSIVE_ENGINEERING;
        case MEKANISM:
            return XRAY_GLOW_COLOR_MEKANISM;
        case DRACONIC_EVOLUTION:
            return XRAY_GLOW_COLOR_DRACONIC_EVOLUTION;
        case THERMAL_FOUNDATION:
            return XRAY_GLOW_COLOR_THERMAL_FOUNDATION;
        case BIG_REACTORS:
            return XRAY_GLOW_COLOR_BIG_REACTORS;
        case FORESTRY:
            return XRAY_GLOW_COLOR_FORESTRY;
        case TINKERS_CONSTRUCT:
            return XRAY_GLOW_COLOR_TINKERS_CONSTRUCT;
        case RAILCRAFT:
            return XRAY_GLOW_COLOR_RAILCRAFT;
    }
    return XRAY_GLOW_COLOR_MINECRAFT;
}

vec3 getGlowESPColor(int entityCategory) {
    switch(entityCategory) {
        case PEACEFUL_MOBS:
            return ESP_GLOW_COLOR_PEACEFUL;
        case NEUTRAL_MOBS:
            return ESP_GLOW_COLOR_NEUTRAL;
        case AGRESSIVE_MOBS:
            return ESP_GLOW_COLOR_AGRESSIVE;
        case DROPS:
            return ESP_GLOW_COLOR_DROPS;
        case BLOCKS:
            return ESP_GLOW_COLOR_BLOCKS;
        case VEHICLES:
            return ESP_GLOW_COLOR_VEHICLES;
        case PROJECTILES:
            return ESP_GLOW_COLOR_PROJECTILES;
        case PLAYERS:
            return ESP_GLOW_COLOR_PLAYERS;
        case IMMOBILE:
            return ESP_GLOW_COLOR_IMMOBILE;
    }
    return ESP_GLOW_COLOR_OTHER;
}

vec3 getGlowChestESPColor(int blockId) {
    switch(blockId) {
        case BLOCK_MINECRAFT_CHEST:
            return CHESTESP_GLOW_COLOR_CHEST;
        case BLOCK_MINECRAFT_TRAPPED_CHEST:
            return CHESTESP_GLOW_COLOR_TRAPPED_CHEST;
        case BLOCK_MINECRAFT_ENDER_CHEST:
            return CHESTESP_GLOW_COLOR_ENDER_CHEST;
    }
    return CHESTESP_GLOW_COLOR_OTHER;
}