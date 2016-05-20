/*
 * Author: r4vn
 *
 * Description:
 * Checks whether a given location is far enogh from other cache locations and
 * the map border.
 *
 * Parameter(s):
 *     0: <array> The position to check
 *
 * Returns:
 * <boolean> Returns true if the position matches the spacing conditions,
 *           otherwise false.
 */

#include "..\script_component.hpp"

private [
    "_return",
    "_combatAreaSize",
    "_combatAreaSizeX",
    "_combatAreaSizeY",
    "_newCachePosition",
    "_newCachePositionX",
    "_newCachePositionY",
    "_distance",
    "_vehicleVarPrefix",
    "_cache",
    "_createdCachesCount",
    "_areaSize"
];

_newCachePosition = _this select 0;

_newCachePositionX = _newCachePosition select 0;
_newCachePositionY = _newCachePosition select 1;

// Get the combatArea size and the spacing from the module configuration
_combatAreaSize = getMarkerSize (getText (ADDON_CONFIG >>
        "combatAreaMarkerName"));
_combatAreaSizeX = _combatAreaSize select 0;
_combatAreaSizeY = _combatAreaSize select 1;
_areaSize = getNumber (MISSION_CONFIG >> "areaSize");
// Get the cache var prefix
_vehicleVarPrefix = getText (ADDON_CONFIG >> "vehicleVarPrefix");
// Get the count of already spawned caches
_createdCachesCount = missionNamespace getVariable [
        GVAR_NAME("createdCachesCount"), 0];

LOG("Checking distance to other caches and combat area border");

if (_newCachePositionX > _combatAreaSizeX - _areaSize ||
        _newCachePositionX < _areaSize ||
        _newCachePositionY > _combatAreaSizeY - _areaSize ||
        _newCachePositionY < _areaSize) then {
    // Return false if the psoition is near the map border and does not match
    // the spacing from it
    _return = false;
} else {
    // Return true if the following for loop iterates till its end
    _return = true;

    // Loop over all caches and check the distance to position
    for "_i" from 1 to _createdCachesCount do {
        // Get the current cache from this iteration
        _cache = missionNamespace getVariable [format ["%1 %2",
                _vehicleVarPrefix, _i], nil];

        if (isNil "_cache") exitWith {};

        // Get the distance between the iteration's cache location and position
        _distance = _cache distance _newCachePosition;

        // If the distance does not fulfill the spacing return false
        if (_distance < _areaSize) exitWith {
            _return = false;
        };
    };
};

LOG("Distance check result: " + str _return);

// The value to return from this function
_return;
