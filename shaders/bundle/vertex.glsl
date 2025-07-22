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

void APPLY_SIMPLE_LIGHTING(float aoMult) {
	const vec3 sunDirection = normalize(vec3(1.0, 1.0, 0.6));
	const float ambientStrength = 0.9;
	const float diffuseStrength = 1 - ambientStrength;

	vec3 viewNormal = normalize(gl_NormalMatrix * gl_Normal);
    vec3 worldNormal = normalize((gbufferModelViewInverse * vec4(viewNormal, 0.0)).xyz);
    float diffuseFactor = max(dot(worldNormal, sunDirection), 0.0);
    float light = ambientStrength + (diffuseStrength * diffuseFactor);
    float upFacingFactor = (worldNormal.y * 0.5 + 0.5);
    float aoFactor = mix(aoMult, 1.0, upFacingFactor);
    glcolor.rgb *= light * aoFactor;
}

void APPLY_SIMPLE_LIGHTING() {
	APPLY_SIMPLE_LIGHTING(0.9);
}

#endif