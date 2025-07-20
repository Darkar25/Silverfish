#ifndef INCLUDE_SETTINGS_CAVEFINDER
#/**/define INCLUDE_SETTINGS_CAVEFINDER

//#define CAVEFINDER // Toggle cave finder.

#include "/settings/killswitch.glsl"

#ifdef KILLSWITCH
#undef CAVEFINDER
#endif

#endif