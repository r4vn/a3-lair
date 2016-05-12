#include "\x\lair\addons\main\script_component.hpp"

#define COMPONENT caches

// Defines the needed count of caches which is set by an admin in the
// mission parameters
#define NEEDED_CACHES_COUNT ("NeededCaches" call BIS_fnc_getParamValue)
