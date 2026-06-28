#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

attribute float mc_Entity;
out flat int blockID;
out vec4 viewPosition;

void main()
{
	blockID = int(mc_Entity.x);
	
	DEFAULT_VERTEX_IMPLEMENTATION();
	#ifdef IS_IRIS
        APPLY_SIMPLE_LIGHTING();
    #endif // IS_IRIS

	viewPosition = gl_ModelViewMatrix * gl_Vertex;
}