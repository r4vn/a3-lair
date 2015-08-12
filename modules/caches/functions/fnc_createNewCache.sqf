/*
 * Author: r4vn
 *
 * Description:
 * Creates a new cache with its marker and insurgent groups after a given delay.
 *
 * Note: Since this a computation heavy task and uses uiSleep, it needs to be
 * executed in its own VM.
 *
 * TODO: Maybe move marker and insurgent creation out of this function to make
 *       it more modular
 *
 * Parameter(s):
 *     0: <number> (Optional) Delay after which the cache should be created.
 *                 When none is specified zero is used as delay.
 */

#include "script_macros.hpp"

private [
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

// Get the maximum count of caches spawnable on the map
_maxCacheCount = getNumber (MCFG >> "maxCount");

// Don't create a cache if there is no more space on the map aka maximum count
// of caches exceeded
if ((count SAD_caches) < _maxCacheCount) then {
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

    // Spawn the cache somewhere outside the map to prevent destruction on spawn
    // as position is ATL
    _cache = _vehicle createVehicle [-1000, -1000];
    // Move the cache to its actual location inside the cache building
    _cache setPosATL _positionTerrainLevel;
    // Set the variable name for the cache vehicles
    _cache setVehicleVarName (format ["%1 %2", localize "STR_SAD_cacheTitle",
            (count SAD_caches) + 1]);
    // Add destruction handler for the cache
    _cache addEventHandler ["killed", {
        call FUNC("handleCacheKilled");
    }];

    // Add the cache to the cache array
    ARR_ADD(SAD_caches, _cache);

    // Get the position of the cache (not ATL)
    _position = getPos _cache;

    // Randomize the cache area marker position
    _markerPosition = [_position, _minOffset, _maxOffset] call
            SAD_fnc_randomizePosition2D;

    // Create cache marker, cache task and insurgent groups
    [_markerPosition, _cache] call FUNC("createCacheMarker");
    [_markerPosition, _cache] call FUNC("createNewTask");
    [_markerPosition, _cache] call FUNC("createInsurgents");
} else {
    // If maximum cache amount is exceeded create a small hint
    hint "Maximum cache amount exceeded.";
};
