#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

void main() {
	DEFAULT_VERTEX_IMPLEMENTATION();

    gl_Position = ftransform();
}