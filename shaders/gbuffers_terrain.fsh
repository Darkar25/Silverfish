#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"
#include "/settings/cavefinder.glsl"

in flat int blockID;
in vec4 viewPosition;

/* DRAWBUFFERS:0 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
#else
    layout(location = 0) out vec4 color;
#endif // IS_IRIS

void main() {
	color = texture(gtexture, texcoord) * glcolor;
	
	#ifndef FULLBRIGHT
		color *= texture(lightmap, lmcoord);
	#endif // FULLBRIGHT

    if (color.a < alphaTestRef) {
		discard;
	}

	#ifdef CAVEFINDER
		gl_FragDepth = (1 - gl_FragCoord.z) / 4 + 0.75;
	#else
		gl_FragDepth = gl_FragCoord.z;
	#endif // CAVEFINDER
}