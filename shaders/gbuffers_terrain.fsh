#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"
#include "/settings/cavefinder.glsl"
#include "/settings/render/xray.glsl"

#include "/bundle/block.glsl"

in flat int blockID;

uniform float far;
uniform float near;
in vec4 viewPosition;
in flat int isXrayBlock;

uniform float viewWidth;
uniform float viewHeight;

/* DRAWBUFFERS:04 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
    #define terrain_buffer gl_FragData[1]
#else
    layout(location = 0) out vec4 color;
	layout(location = 1) out vec4 terrain_buffer;
#endif

void main() {
	color = texture(gtexture, texcoord) * glcolor;
	
	#ifndef FULLBRIGHT
		color *= texture(lightmap, lmcoord);
	#endif // FULLBRIGHT

    if (color.a < alphaTestRef) {
		discard;
	}

	if(isXrayBlock == 1) {
		terrain_buffer = vec4(-viewPosition.z / (far * 4.0), GET_MODID(blockID), 0.0, 1.0);
		gl_FragDepth = gl_FragCoord.z;
		return;
	}

	#ifdef CAVEFINDER
		gl_FragDepth = (1 - gl_FragCoord.z) / 4 + 0.75;
	#else
		gl_FragDepth = gl_FragCoord.z;
	#endif // CAVEFINDER
}