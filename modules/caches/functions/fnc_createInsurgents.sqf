/*
 * Author: r4vn
 *
 * Description:
 * Creates insurgents for a cache.
 *
 * TODO: Make the count of waypoints random once its available via parameters
 *
 * Parameter(s):
 *     0: <string> The position of the cache marker
 *     1: <object> The cache to which the insurgents should belong
 */

#include "script_macros.hpp"

private [
    "_cache",
    "_cachePosition",
    "_markerPosition",
    "_groupCount",
    "_group",
    "_groups",
    "_groupCfg",
    "_groupCfgInfo",
    "_groupPosition",
    "_minOffset",
    "_maxOffset"
];

_markerPosition = _this select 0;
_cache = _this select 1;

// Get the position of the cache
_cachePosition = getPos _cache;
// Get a random group count
_groupCount = random SAD_MAX_INS_GROUP_COUNT;
// Get group configuration and offsets from the module configuration
_groups = getArray (MCFG >> "Insurgents" >> "groups");
_minOffset = getNumber (MCFG >> "Marker" >> "minOffset");
_maxOffset = getNumber (MCFG >> "Marker" >> "maxOffset");

// Loop groups
for "_i" from 0 to _groupCount do {
    // Select a random group configuration
    _groupCfgInfo = _groups call BIS_fnc_selectRandom;
    // Get the group configuration
    _groupCfg = GROUP_CFG(_groupCfgInfo select 0, _groupCfgInfo select 1);

    if (_i == 0) then {
        // If its the first group, choose a location near the cache
        _groupPosition = [_cachePosition, _minOffset / 2, _minOffset / 2] call
                SAD_fnc_randomizePosition2D;
    } else {
        // For every other group choose a random location within the cache area
        _groupPosition = [_cachePosition, _minOffset, _maxOffset / 2] call
                SAD_fnc_randomizePosition2D;
    };

    // Spawn the insurgent group
    _group = [_groupPosition, east, _groupCfg] call
            FUNC("createInsurgentGroup");

    if (_i == 0) then {
        // For the first group use a smaller waypoint area
        [_group, _cachePosition, _minOffset, _minOffset] call
                FUNC("createInsurgentGroupWaypoints");
    } else {
        // All other groups can have waypoints in the whole cache marker area
        [_group, _markerPosition, _minOffset, _maxOffset] call
                FUNC("createInsurgentGroupWaypoints");
    };
};
