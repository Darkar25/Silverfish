#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"
#include "/bundle/block.glsl"

in flat int isXrayBlock;
in flat int blockID;
in vec4 viewPosition;

uniform float far;

/* DRAWBUFFERS:01 */
#ifdef IS_IRIS
    #define color gl_FragData[0]
    #define shadow_info gl_FragData[1]
#else
    layout(location = 0) out vec4 color;
    layout(location = 1) out vec4 shadow_info;
#endif // IS_IRIS

void main() {
    color = texture(gtexture, texcoord) * glcolor;
	
	#ifndef FULLBRIGHT
		color *= texture(lightmap, lmcoord);
	#endif // FULLBRIGHT

    if (color.a < alphaTestRef) {
		discard;
	}

    if (isXrayBlock == 1) {
        shadow_info = vec4(-viewPosition.z / (far * 4.0), GET_MODID(blockID), 0.5, 1.0);
    } else {
        shadow_info = vec4(0.0, 0.0, -1.0, 1.0);
    }
}