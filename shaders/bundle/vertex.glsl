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

	//Calculate view space normal.
    vec3 normal = gl_NormalMatrix * gl_Normal;
    normal = (gbufferModelViewInverse * vec4(normal,0)).xyz;

    //Calculate simple lighting. Thanks to @PepperCode1
    float light = min(normal.x * normal.x * 0.6f + normal.y * normal.y * 0.25f * (3.0f + normal.y) + normal.z * normal.z * 0.8f, 1.0f);

	glcolor = vec4(gl_Color.rgb * light, gl_Color.a);
}

#endif