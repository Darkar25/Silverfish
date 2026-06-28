#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

#include "/bundle/xray.glsl"
#include "/settings/toggleableui.glsl"

attribute vec4 mc_Entity;
out flat int isXrayBlock;
out flat int blockID;
out vec4 viewPosition;

uniform mat4 shadowModelViewInverse;
uniform mat4 gbufferPreviousModelViewInverse;

void main() {
    blockID = int(mc_Entity.x);

    // Entity culling purely mapped to Vanilla Player ID (0)
    if (blockID == 0) {
        vec4 playerSpaceVertex = shadowModelViewInverse * gl_ModelViewMatrix * gl_Vertex;

        if (length(playerSpaceVertex.xyz) < 2.0) {
            float cameraOffset = length(gbufferPreviousModelViewInverse[3].xyz);
            bool isFirstPerson = cameraOffset < 0.1;

            if (isFirstPerson) {
                vec3 cameraPlayerSpacePos = gbufferPreviousModelViewInverse[3].xyz;
                vec3 vertexRelativeToCamera = playerSpaceVertex.xyz - cameraPlayerSpacePos;
                float horizontalDistance = length(vertexRelativeToCamera.xz);
                bool insideY = vertexRelativeToCamera.y > -1.8 && vertexRelativeToCamera.y < 0.4;

                if (horizontalDistance < 0.72 && insideY) {
                    gl_Position = vec4(0.0, 0.0, 0.0, 0.0);
                    return;
                }
            }
        }
    }

    gl_Position = gbufferProjection * gbufferPreviousModelView * shadowModelViewInverse * gl_ModelViewMatrix * gl_Vertex;
    viewPosition = gbufferPreviousModelView * shadowModelViewInverse * gl_ModelViewMatrix * gl_Vertex;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;

    if (blockID == 0) {
        APPLY_SIMPLE_LIGHTING(0.6);
    }
    #ifdef IS_IRIS
        else {
            APPLY_SIMPLE_LIGHTING();
        }
    #endif // IS_IRIS

    isXrayBlock = 0;
	#if XRAY_ENABLED != STATE_DISABLED
		if(blockID > 1000 && shouldXray(blockID) && (
		#ifdef TOGGLEABLE_UI_ENABLED
			hideGUI == 1 &&
		#endif
		true)) {
            gl_Position.z = mix(-gl_Position.w, gl_Position.z, 0.75);
			isXrayBlock = 1;
		}
	#endif // XRAY_ENABLED
}