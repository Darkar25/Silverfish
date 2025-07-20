#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"

/* DRAWBUFFERS:0 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
#else
    layout(location = 0) out vec4 color;
#endif

void main() {
    #ifndef FULLBRIGHT
	    color *= texture(lightmap, lmcoord);
    #endif

	if (color.a < alphaTestRef) {
		discard;
	}
}