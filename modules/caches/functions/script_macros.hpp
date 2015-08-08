#define MODULE "caches"

#include "\mpmissions\ace_rhs_dusty_lair.kunduz\modules\main\functions\script_macros.hpp"

#define NEEDED_CACHES_COUNT ("NeededCaches" call BIS_fnc_getParamValue)
#define SAD_MAX_INS_GROUP_COUNT ("MaxCacheGroups" call BIS_fnc_getParamValue)

#define GROUP_CFG(category, group) (configFile >> "CfgGroups" >>  "Indep" >>\
        "rhs_faction_insurgents" >> category >> group)
