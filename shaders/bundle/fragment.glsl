#ifndef INCLUDE_BUNDLE_FRAGMENT
#/**/define INCLUDE_BUNDLE_FRAGMENT

uniform float alphaTestRef = 0.1;

uniform sampler2D lightmap;
uniform sampler2D gtexture;

in vec2 lmcoord;
in vec2 texcoord;
in vec4 glcolor;

#endif