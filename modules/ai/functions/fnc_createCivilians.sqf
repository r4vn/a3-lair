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

#include "script_macros.hpp"

private [
    "_cache",
    "_markerPosition",
    "_unitCount",
    "_unit",
    "_units",
    "_minUnitCount",
    "_unitName",
    "_unitPosition",
    "_minOffset",
    "_maxOffset",
    "_waypointCount",
    "_minWaypointCount",
    "_maxWaypointCount"
];

_cache = _this select 0;
_markerPosition = _this select 1;

// Base unit count on maximum insurgent groups, make it four times the amount
_unitCount = random (("MaxCacheGroups" call BIS_fnc_getParamValue) * 2.5);
// Get unit configurations
_units = getArray (MCFG >> "Civilians" >> "units");
// Base minimum unit count on insurgent minimum, make it twice the amount
_minUnitCount = ((getNumber (MCFG >> "Insurgents" >> "minGroupCount")) * 2) - 1;
// Get offsets from the marker position for spawning area
_minOffset = getNumber (EMCFG("caches") >> "Marker" >> "minOffset");
_maxOffset = getNumber (EMCFG("caches") >> "Marker" >> "maxOffset");
// Get limits for waypoint amount
_minWaypointCount = (getNumber (MCFG >> "minWaypointCount")) - 1;
_maxWaypointCount = getNumber (MCFG >> "maxWaypointCount");
// Get configuration name of collaborators
_collaborator = getText (MCFG >> "collaborator");

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
    _unitPosition = [_markerPosition, _minOffset, _maxOffset] call
            EFUNC("main", "randomizePosition2D");

    // Spawn the insurgent unit
    _unit = [_unitName, _unitPosition, createGroup civilian] call
            FUNC("createUnit");
    // Make sure the unit stops moving when told to get down
    [_unit] execVM FUNC_FILE("handleGetDown");
    // Add questioning at hq to the unit
    [_unit] execVM FUNC_FILE("handleQuestioning");

    // Register killed event handler
    _unit addEventHandler ["Killed", {
        [_this select 0] call FUNC("handleCivilianKilled");
    }];

    // Randomize waypoint amount
    _waypointCount =  random _maxWaypointCount;

    // Set lower limit of waypoint amount if below
    if (_waypointCount < _minWaypointCount) then {
        _waypointCount = _minWaypointCount;
    };

    // Create random waypoints in the whole cache marker area
    [group _unit, _waypointCount + 1, _markerPosition, _minOffset, _maxOffset]
            call FUNC("createWaypoints");
};
