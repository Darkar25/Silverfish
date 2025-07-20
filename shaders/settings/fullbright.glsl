#ifndef INCLUDE_SETTINGS_FULLBRIGHT
#/**/define INCLUDE_SETTINGS_FULLBRIGHT

#define FULLBRIGHT // Toggle fullbright

#include "/settings/killswitch.glsl"

#ifdef KILLSWITCH
#undef FULLBRIGHT
#endif

#endif