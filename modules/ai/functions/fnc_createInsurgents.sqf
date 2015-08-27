/*
 * Author: r4vn
 *
 * Description:
 * Creates insurgents for a cache.
 *
 * Parameter(s):
 *     0: <object> The cache to which the insurgents should belong
 *     1: <array> The position of the cache marker
 */

#include "..\script_macros.hpp"

private [
    "_cache",
    "_cachePosition",
    "_markerPosition",
    "_groupCount",
    "_group",
    "_groups",
    "_minGroupCount",
    "_groupCfg",
    "_groupMCfg",
    "_groupPosition",
    "_minOffset",
    "_maxOffset",
    "_side",
    "_faction",
    "_guardCount",
    "_waypointCount",
    "_minWaypointCount",
    "_maxWaypointCount"
];

_cache = _this select 0;
_markerPosition = _this select 1;

// Get the position of the cache
_cachePosition = getPos _cache;
// Get a random group count
_groupCount = random ("MaxCacheGroups" call BIS_fnc_getParamValue);
// Get group configuration, minimum group count
_groups = getArray (MCFG >> "Insurgents" >> "groups");
_minGroupCount = (getNumber (MCFG >> "Insurgents" >> "minGroupCount")) - 1;
// Get offsets from the marker position for spawning area
_minOffset = getNumber (EMCFG("caches") >> "Marker" >> "minOffset");
_maxOffset = getNumber (EMCFG("caches") >> "Marker" >> "maxOffset");
// Get information for the configuration path of groups
_side = getText (MCFG >> "Insurgents" >> "side");
_faction = getText (MCFG >> "Insurgents" >> "faction");
// Get amount of guards spawning near the cache
_guardCount = getNumber (MCFG >> "Insurgents" >> "guardCount");
// Get limits for waypoint amount
_minWaypointCount = (getNumber (MCFG >> "minWaypointCount")) - 1;
_maxWaypointCount = getNumber (MCFG >> "maxWaypointCount");

if (_groupCount < _minGroupCount) then {
    _groupCount = _minGroupCount;
};

// Loop groups
for "_i" from 0 to _groupCount do {
    // Select a random group configuration
    _groupMCfg = _groups call BIS_fnc_selectRandom;
    // Get the group configuration
    _groupCfg = (configFile >> "CfgGroups" >> _side >> _faction >>
            (_groupMCfg select 0) >> (_groupMCfg select 1));

    if (_i < _guardCount) then {
        // If guards still need to be created, choose a location near the cache
        _groupPosition = [_cachePosition, _minOffset / 4, _minOffset / 2] call
                EFUNC("main", "randomizePosition2D");
    } else {
        // For every other group choose a random location within the cache area
        _groupPosition = [_markerPosition, _minOffset, _maxOffset] call
                EFUNC("main", "randomizePosition2D");
    };

    // Spawn the insurgent group
    _group = [_groupCfg, _groupPosition, east] call FUNC("createGroup");

    // Randomize waypoint amount
    _waypointCount =  random _maxWaypointCount;

    // Set lower limit of waypoint amount if below
    if (_waypointCount < _minWaypointCount) then {
        _waypointCount = _minWaypointCount;
    };

    if (_i < _guardCount) then {
        // For guard groups use a smaller waypoint area
        [_group, _waypointCount + 1, _cachePosition, _minOffset, _minOffset]
                call FUNC("createWaypoints");
    } else {
        // All other groups can have waypoints in the whole cache marker area
        [_group, _waypointCount + 1, _markerPosition, _minOffset, _maxOffset]
                call FUNC("createWaypoints");
    };
};
