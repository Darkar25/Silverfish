#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/bundle/entity.glsl"
#include "/settings/fullbright.glsl"

in flat int entityID;
in flat int isEspEntity;
in vec4 viewPosition;

uniform float far;
uniform vec4 entityColor;

/* DRAWBUFFERS:05 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
    #define entities_buffer gl_FragData[1]
#else
    layout(location = 0) out vec4 color;
	layout(location = 1) out vec4 entities_buffer;
#endif

void main() {
	color = texture(gtexture, texcoord) * glcolor;
	
	#ifndef FULLBRIGHT
		color.rgb = mix(color.rgb, entityColor.rgb, entityColor.a);
		color *= texture(lightmap, lmcoord);
	#endif // FULLBRIGHT

	if (color.a < alphaTestRef) {
		discard;
	}

	if(isEspEntity == 1) {
		entities_buffer = vec4(-viewPosition.z / (far * 4.0), getEntityCategory(entityID), 0.0, 1.0);
	}
}