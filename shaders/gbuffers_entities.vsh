#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

#include "/settings/esp.glsl"
#include "/bundle/esp.glsl"

uniform int entityId;
out int entityID;
out int isEspEntity;
out vec4 viewPosition;

void main() {
	entityID = entityId;
	
	DEFAULT_VERTEX_IMPLEMENTATION();

	viewPosition = gl_ModelViewMatrix * gl_Vertex;
	
	#ifdef ESP_ENABLED
		if (shouldEsp(entityID)) {
			drawVertexOnTop();
			isEspEntity = 1;
		}
	#endif // ESP_ENABLED
}