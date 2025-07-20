#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

#include "/settings/chestesp.glsl"

#include "/enum/tileentity.glsl"

uniform int blockEntityId;
out float blockEntityID;
out int isEspEntity;
out vec4 viewPosition;

void main()
{
	blockEntityID = blockEntityId;

	DEFAULT_VERTEX_IMPLEMENTATION();

	viewPosition = gl_ModelViewMatrix * gl_Vertex;
	
	#ifdef CHESTESP_ENABLED
		if(
		#ifdef CHESTESP_SELECT_CHEST
			blockEntityID == BLOCK_MINECRAFT_CHEST ||
		#endif // CHESTESP_SELECT_CHEST
		#ifdef CHESTESP_SELECT_TRAPPED_CHEST
			blockEntityID == BLOCK_MINECRAFT_TRAPPED_CHEST ||
		#endif // CHESTESP_SELECT_TRAPPED_CHEST
		#ifdef CHESTESP_SELECT_ENDER_CHEST
			blockEntityID == BLOCK_MINECRAFT_ENDER_CHEST ||
		#endif // CHESTESP_SELECT_ENDER_CHEST
		#ifdef CHESTESP_SELECT_OTHER
			blockEntityID > 0 ||
		#endif // CHESTESP_SELECT_OTHER
		false)
		{
			drawVertexOnTop();
			isEspEntity = 1;
		}
	#endif // CHESTESP_ENABLED
}