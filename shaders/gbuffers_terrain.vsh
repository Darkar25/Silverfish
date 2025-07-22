#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

#include "/bundle/xray.glsl"

attribute float mc_Entity;
out int blockID;
out int isXrayBlock;
out vec4 viewPosition;

void main()
{
	blockID = int(mc_Entity.x);
	
	DEFAULT_VERTEX_IMPLEMENTATION();
	#ifdef IS_IRIS
        APPLY_SIMPLE_LIGHTING();
    #endif // IS_IRIS

	viewPosition = gl_ModelViewMatrix * gl_Vertex;
	
	#if XRAY_ENABLED != STATE_DISABLED
		if(shouldXray(blockID)) {
			drawVertexOnTop();
			isXrayBlock = 1;
		}
	#endif // XRAY_ENABLED
}