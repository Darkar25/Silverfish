#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"

in float blockEntityID;
in flat int isEspEntity;
in vec4 viewPosition;

uniform float far;

/* DRAWBUFFERS:06 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
    #define tile_buffer gl_FragData[1]
#else
    layout(location = 0) out vec4 color;
	layout(location = 1) out vec4 tile_buffer;
#endif // IS_IRIS

void main() {
	color = texture(gtexture, texcoord) * glcolor;
	
	#ifndef FULLBRIGHT
		color *= texture(lightmap, lmcoord);
	#endif // FULLBRIGHT

	if (color.a < alphaTestRef) {
		discard;
	}

	if(isEspEntity == 1) {
		tile_buffer = vec4(-viewPosition.z / (far * 4.0), blockEntityID, 0.0, 1.0);
	}
}