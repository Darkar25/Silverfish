#include "/bundle/common.glsl"
#include "/bundle/vertex.glsl"

void main() {
	DEFAULT_VERTEX_IMPLEMENTATION();
    #ifdef IS_IRIS
        APPLY_SIMPLE_LIGHTING();
    #endif // IS_IRIS

    gl_Position = ftransform();
}