#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

/* DRAWBUFFERS:03 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
    #define hand_marker gl_FragData[1]
#else
    layout(location = 0) out vec4 color;
	layout(location = 1) out vec4 hand_marker;
#endif // IS_IRIS

void main() {
	color = texture(gtexture, texcoord) * glcolor;

	if (color.a < alphaTestRef) {
		discard;
	}

	hand_marker = vec4(1.0, 0.0, 0.0, 1.0);
}