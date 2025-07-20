#ifndef INCLUDE_BUNDLE_VERTEX
#/**/define INCLUDE_BUNDLE_VERTEX

out vec2 lmcoord;
out vec2 texcoord;
out vec4 glcolor;

uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferPreviousModelView;
uniform mat4 gbufferPreviousProjection;

void drawVertexOnTop() {
	gl_Position.z = mix(-gl_Position.w, gl_Position.z, 0.75);
}

void DEFAULT_VERTEX_IMPLEMENTATION() {
	// Intentional 1-frame lag to compensate for shadow-pass
	gl_Position = gbufferPreviousProjection * gbufferPreviousModelView * gbufferModelViewInverse * gl_ModelViewMatrix * gl_Vertex;
	texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
	lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
	glcolor = gl_Color;
}

#endif