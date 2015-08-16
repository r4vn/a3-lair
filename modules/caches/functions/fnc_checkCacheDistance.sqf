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

#include "script_macros.hpp"

private [
    "_return",
    "_mapSize",
    "_newCachePosition",
    "_distance",
    "_vehicleVarPrefix",
    "_cache",
    "_createdCachesCount",
    "_minSpacing"
];

_newCachePosition = _this select 0;

// Get the map size and the spacing from the module configuration
_mapSize = getNumber (MCFG >> "Map" >> "size");
_minSpacing = getNumber (MCFG >> "minSpacing");
// Get the cache var prefix
_vehicleVarPrefix = getText (MCFG >> "vehicleVarPrefix");
// Get the count of already spawned caches
_createdCachesCount = missionNamespace getVariable [
        GVAR_NAME("createdCachesCount"), 0];

if (_newCachePosition select 0 > _mapSize - _minSpacing ||
        _newCachePosition select 0 < _minSpacing ||
        _newCachePosition select 1 > _mapSize - _minSpacing ||
        _newCachePosition select 1 < _minSpacing) then {
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
        if (_distance < _minSpacing) exitWith {
            _return = false;
        };
    };
};

// The value to return from this function
_return;
