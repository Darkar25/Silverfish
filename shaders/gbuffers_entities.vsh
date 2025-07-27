#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

#include "/settings/esp.glsl"
#include "/settings/toggleableui.glsl"
#include "/bundle/esp.glsl"

uniform int entityId;
out int entityID;
out int isEspEntity;
out vec4 viewPosition;

void main() {
	entityID = entityId;
	
	DEFAULT_VERTEX_IMPLEMENTATION();
	APPLY_SIMPLE_LIGHTING(0.6);

	viewPosition = gl_ModelViewMatrix * gl_Vertex;
	
	#ifdef ESP_ENABLED
		if (shouldEsp(entityID) && (
		#ifdef TOGGLEABLE_UI_ENABLED
			hideGUI == 1 &&
		#endif
		true)) {
			drawVertexOnTop();
			isEspEntity = 1;
		}
	#endif // ESP_ENABLED
}