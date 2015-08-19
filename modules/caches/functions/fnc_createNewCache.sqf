/*
 * Author: r4vn
 *
 * Description:
 * Creates a new cache with its marker and insurgent groups after a given delay.
 *
 * Note: Since this a computation heavy task and uses uiSleep, it needs to be
 * executed in its own VM.
 *
 * Parameter(s):
 *     0: <number> (Optional) Delay after which the cache should be created.
 *                 When none is specified zero is used as delay.
 */

#include "script_macros.hpp"

private [
    "_createdCachesCount",
    "_positionTerrainLevel",
    "_position",
    "_cache",
    "_markerPosition",
    "_minOffset",
    "_maxOffset",
    "_vehicle",
    "_vehicleVarPrefix",
    "_maxCacheCount",
    "_delay"
];

_delay = _this select 0;

// Get the currently created caches count
_createdCachesCount = missionNamespace getVariable [
        GVAR_NAME("createdCachesCount"), 0];
// Get the maximum count of caches spawnable on the map
_maxCacheCount = getNumber (MCFG >> "maxCount");

// Don't create a cache if there is no more space on the map aka maximum count
// of caches exceeded
if (_createdCachesCount < _maxCacheCount) then {
    if (isNil "_delay") then {
        // If no delay given set it to zero
        _delay = 0;
    };

    // Delay the cache spawn
    uiSleep _delay;

    // Get the offset for the marker
    _minOffset = getNumber (MCFG >> "Marker" >> "minOffset");
    _maxOffset = getNumber (MCFG >> "Marker" >> "maxOffset");

    // Get vehicle class and its variable prefix
    _vehicle = getText (MCFG >> "vehicle");
    _vehicleVarPrefix = getText (MCFG >> "vehicleVarPrefix");

    // Get a new cache location
    _positionTerrainLevel = call FUNC("findNewCacheLocation");
    // Increase created caches count by one
    INCREASE(_createdCachesCount);
    missionNamespace setVariable [GVAR_NAME("createdCachesCount"),
            _createdCachesCount, true];

    // Spawn the cache somewhere outside the map to prevent destruction on spawn
    // as position is ATL
    _cache = _vehicle createVehicle [-1000, -1000];
    // Move the cache to its actual location inside the cache building
    _cache setPosATL _positionTerrainLevel;
    // Set the variable name for the cache vehicles
    _cache setVehicleVarName (format ["%1 %2", localize "STR_SAD_cacheTitle",
            _createdCachesCount]);
    // Add destruction handler for the cache
    _cache addEventHandler ["killed", {
        call FUNC("handleCacheKilled");
    }];
    // Create a new custom event for cache creation
    ["CacheCreated", [_cache]] call CBA_fnc_globalEvent;

    // Get the position of the cache (not ATL)
    _position = getPos _cache;

    // Randomize the cache area marker position
    _markerPosition = [_position, _minOffset, _maxOffset] call
            EFUNC("main", "randomizePosition2D");

    // Create cache marker, cache task and insurgent groups
    [_markerPosition, _cache] call FUNC("createCacheMarker");
    [_markerPosition, _cache] call FUNC("createNewTask");
    [_markerPosition, _cache] call FUNC("createInsurgents");
} else {
    // If maximum cache amount is exceeded create a small hint
    hint "Maximum cache amount exceeded.";
};
