/*
 * Author: r4vn
 *
 * Description:
 * Creates civilians for a cache.
 *
 * Parameter(s):
 *     0: <object> The cache to which the insurgents should belong
 *     1: <array> The position of the cache marker
 */

#include "..\script_component.hpp"

private [
    "_cache",
    "_position",
    "_unitCount",
    "_unit",
    "_units",
    "_minUnitCount",
    "_unitName",
    "_unitPosition",
    "_areaSize",
    "_minOffset",
    "_maxOffset",
    "_waypointCount",
    "_minWaypointCount",
    "_maxWaypointCount"
];

_cache = _this select 0;

LOG("Creating civilians");

// Get the position of the cache
_position = getPos _cache;
// Base unit count on maximum insurgent groups, make it four times the amount
_unitCount = (random (("MaxCacheGroups" call BIS_fnc_getParamValue) * 2.5)) + 1;
// Get unit configurations
_units = getArray (MISSION_CONFIG >> "Civilians" >> "units");
// Base minimum unit count on insurgent minimum, make it twice the amount
_minUnitCount = ((getNumber (MISSION_CONFIG >> "Insurgents" >> "minGroupCount"))
        * 2) - 1;
// Get offsets from the marker position for spawning area
_areaSize = getNumber (MISSION_CONFIG >> "areaSize");
// Get limits for waypoint amount
_minWaypointCount = getNumber (ADDON_CONFIG >> "minWaypointCount");
_maxWaypointCount = getNumber (ADDON_CONFIG >> "maxWaypointCount");
_minOffset = _areaSize / 8;
_maxOffset = _areaSize / 2;

// Ensure minimum unit count
if (_unitCount < _minUnitCount) then {
    _unitCount = _minUnitCount;
};

// Expose civilian amount
missionNamespace setVariable [GVAR_NAME("intelligenceSources"), floor
        _unitCount + 1, true];

// Loop units
for "_i" from 0 to _unitCount do {
    // Select a random unit configuration
    _unitName = _units call BIS_fnc_selectRandom;

    // Choose a random location within the cache area
    _unitPosition = [_position, _minOffset, _maxOffset] call
            lair_fnc_randomizePosition2D;

    // Spawn the insurgent unit
    _unit = [_unitName, _unitPosition, createGroup civilian] call
            FUNC("createUnit");
    // Make sure the unit stops moving when told to get down
    // [_unit] execVM FUNC_PATH("handleGetDown");
    // Add questioning at hq to the unit
    // [_unit] execVM FUNC_PATH("handleQuestioning");

    // Register killed event handler
    _unit addEventHandler ["Killed", {
        [_this select 0] call FUNC("handleCivilianKilled");
    }];

    // Randomize waypoint amount
    _waypointCount =  (random _maxWaypointCount) + 1;

    // Set lower limit of waypoint amount if below
    if (_waypointCount < _minWaypointCount) then {
        _waypointCount = _minWaypointCount;
    };

    // Create random waypoints in the whole cache marker area
    [group _unit, _waypointCount, _position, _areaSize, "CARELESS",
            "BLUE"] call FUNC("createWaypoints");
};

LOG("Civilians created");
