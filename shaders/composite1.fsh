#include "/bundle/common.glsl"

#include "/enum/color.glsl"
#include "/settings/render/common.glsl"
#include "/settings/render/cavefinder.glsl"
#include "/settings/cavefinder.glsl"

const bool colortex2MipmapEnabled = true;

uniform sampler2D gcolor;
uniform sampler2D colortex2;

uniform float viewWidth;
uniform float viewHeight;

/* DRAWBUFFERS:0 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
#else
    layout(location = 0) out vec4 color;
#endif // IS_IRIS

void main() {
	vec2 screenCoord = gl_FragCoord.xy / vec2(viewWidth, viewHeight);
    vec4 originalSceneColor = texture(gcolor, screenCoord);
    
    // Use textureLod with a bias of 0.0 for a sharp, unbiased sample.
    float isCenterEntity = textureLod(colortex2, screenCoord, 0.0).a;

    // Use texture() with a bias to get a blurred version of the mask.
    // The GPU automatically selects the base mip level and we add our bias.
    float glowAmount = texture(colortex2, screenCoord, RENDER_GLOW_RADIUS).a;

    glowAmount = pow(glowAmount, 2.0);

    // Prevents the entity from glowing on top of itself
    glowAmount *= (1.0 - isCenterEntity);

    // Additively blend the glow on top of the original scene.
    vec3 glowCol = texture(colortex2, screenCoord, RENDER_GLOW_RADIUS).rgb;
    if(glowCol == COLOR_BLACK)
        glowCol = vec3(-1, -1, -1);
    vec3 finalGlow = glowCol * glowAmount * RENDER_GLOW_INTENSITY;
    vec3 col = originalSceneColor.rgb + finalGlow;

    color = vec4(col, originalSceneColor.a);
}