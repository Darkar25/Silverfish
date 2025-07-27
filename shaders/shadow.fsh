#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"

varying flat int entityID;

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
}