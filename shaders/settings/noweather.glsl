#ifndef INCLUDE_SETTINGS_NOWEATHER
#/**/define INCLUDE_SETTINGS_NOWEATHER

// #define NOWEATHER_ENABLED // Toggle no-weather

#include "/settings/killswitch.glsl"

#ifdef KILLSWITCH
#undef NOWEATHER_ENABLED
#endif

#endif