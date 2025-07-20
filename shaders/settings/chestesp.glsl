#ifndef INCLUDE_SETTINGS_CHESTESP
#/**/define INCLUDE_SETTINGS_CHESTESP

//#define CHESTESP_ENABLED // See chests through the walls
#define CHESTESP_SELECT_CHEST // Toggle regular chests
#define CHESTESP_SELECT_TRAPPED_CHEST // Toggle trapped chests
#define CHESTESP_SELECT_ENDER_CHEST // Toggle ender chests
//#define CHESTESP_SELECT_OTHER // Toggle all tile entities (including all of the options above)

#include "/settings/killswitch.glsl"

#ifdef KILLSWITCH
#undef CHESTESP_ENABLED
#endif

#endif