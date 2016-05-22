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

#include "..\script_component.hpp"

private [
    "_cache",
    "_position",
    "_groupCount",
    "_group",
    "_groups",
    "_minGroupCount",
    "_groupCfg",
    "_groupMissionCfg",
    "_groupPosition",
    "_areaSize",
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

// Get the position of the cache
_position = getPos _cache;
// Get a random group count
_groupCount = (random ("MaxCacheGroups" call BIS_fnc_getParamValue)) + 1;
// Get group configuration, minimum group count
_groups = getArray (MISSION_CONFIG >> "Insurgents" >> "groups");
_minGroupCount = ("MinCacheGroups" call BIS_fnc_getParamValue) - 1;
// Get offsets from the marker position for spawning area
_areaSize = getNumber (MISSION_CONFIG >> "areaSize");
// Get information for the configuration path of groups
_side = getText (MISSION_CONFIG >> "Insurgents" >> "side");
_faction = getText (MISSION_CONFIG >> "Insurgents" >> "faction");
// Get amount of guards spawning near the cache
_guardCount = getNumber (MISSION_CONFIG >> "Insurgents" >> "guardCount");
// Get limits for waypoint amount
_minWaypointCount = getNumber (ADDON_CONFIG >> "minWaypointCount");
_maxWaypointCount = getNumber (ADDON_CONFIG >> "maxWaypointCount");
_minOffset = _areaSize / 8;
_maxOffset = _areaSize / 2;

LOG("Creating insurgents " + str _side + ", " + str _faction);

if (_groupCount < _minGroupCount) then {
    _groupCount = _minGroupCount;
};

// Loop groups
for "_i" from 1 to _groupCount do {
    // Select a random group configuration
    _groupMissionCfg = _groups call BIS_fnc_selectRandom;
    // Get the group configuration
    _groupCfg = (configFile >> "CfgGroups" >> _side >> _faction >>
            (_groupMissionCfg select 0) >> (_groupMissionCfg select 1));

    if (_i < _guardCount) then {
        // If guards still need to be created, choose a location near the cache
        _groupPosition = [_position, _minOffset, _minOffset * 1.5] call
                lair_fnc_randomizePosition2D;
    } else {
        // For every other group choose a random location within the cache area
        _groupPosition = [_position, _minOffset, _maxOffset] call
                lair_fnc_randomizePosition2D;
    };

    // Spawn the insurgent group
    _group = [_groupCfg, _groupPosition, east] call FUNC("createGroup");

    // Randomize waypoint amount
    _waypointCount =  (random _maxWaypointCount) + 1;

    // Set lower limit of waypoint amount if below
    if (_waypointCount < _minWaypointCount) then {
        _waypointCount = _minWaypointCount;
    };

    if (_i < _guardCount) then {
        // For guard groups use a smaller waypoint area
        [_group, _waypointCount, _position, 10, "SAFE", "RED"]
                call FUNC("createWaypoints");
    } else {
        // All other groups can have waypoints in the whole cache marker area
        [_group, _waypointCount, _position, _areaSize, "SAFE", "RED"]
                call FUNC("createWaypoints");
    };
};

LOG("Insurgents created");
