#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

attribute vec4 mc_Entity;
out flat int entityID;

uniform mat4 shadowModelViewInverse;
uniform mat4 gbufferPreviousModelViewInverse;

void main() {
	entityID = int(mc_Entity.x);

    // We only care about culling entities, not terrain.
    if (entityID == 0) {
        vec4 playerSpaceVertex = shadowModelViewInverse * gl_ModelViewMatrix * gl_Vertex;

        // Initial coarse check, only try to filter out verticies at least 2 blocks away from the origin.
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

    // If the vertex was not culled, transform it normally.
    gl_Position = gbufferProjection * gbufferPreviousModelView * shadowModelViewInverse * gl_ModelViewMatrix * gl_Vertex;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;

    if (entityID == 0) {
        APPLY_SIMPLE_LIGHTING(0.6);
    }
    #ifdef IS_IRIS
        else {
            APPLY_SIMPLE_LIGHTING();
        }
    #endif // IS_IRIS
}