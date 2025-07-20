#include "/bundle/common.glsl"
#include "/bundle/fragment.glsl"

#include "/settings/fullbright.glsl"

varying flat int entityID;

void main() {
    gl_FragColor = texture(gtexture, texcoord) * glcolor;
	
	#ifndef FULLBRIGHT
		gl_FragColor *= texture(lightmap, lmcoord);
	#endif // FULLBRIGHT

    if (gl_FragColor.a < alphaTestRef) {
		discard;
	}
}