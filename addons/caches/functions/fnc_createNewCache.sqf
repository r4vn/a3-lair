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

#include "..\script_component.hpp"

private [
    "_createdCachesCount",
    "_positionTerrainLevel",
    "_position",
    "_cache",
    "_markerPosition",
    "_areaSize",
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
_maxCacheCount = getNumber (MISSION_CONFIG >> "maxCount");

// Don't create a cache if there is no more space on the map aka maximum count
// of caches exceeded
if (_createdCachesCount < _maxCacheCount) then {
    LOG("Creating new cache");

    if (isNil "_delay") then {
        // If no delay given set it to zero
        _delay = 0;
    };

    // Delay the cache spawn
    uiSleep _delay;

    _areaSize = getNumber (MISSION_CONFIG >> "areaSize");

    // Get vehicle class and its variable prefix
    _vehicle = getText (ADDON_CONFIG >> "vehicle");
    _vehicleVarPrefix = getText (ADDON_CONFIG >> "vehicleVarPrefix");

    // Get a new cache location
    _positionTerrainLevel = call FUNC("findNewCacheLocation");
    // Increase created caches count by one
    _createdCachesCount = _createdCachesCount + 1;
    missionNamespace setVariable [GVAR_NAME("createdCachesCount"),
            _createdCachesCount, true];

    // Spawn the cache somewhere outside the map to prevent destruction on spawn
    // as position is ATL
    _cache = _vehicle createVehicle [-1000, -1000];

    // Clear the contents of the cache
    clearWeaponCargo _cache;
    clearMagazineCargo _cache;

    // Move the cache to its actual location inside the cache building
    _cache setPosATL _positionTerrainLevel;
    // Set the variable name for the cache vehicles
    _cache setVehicleVarName (format ["%1 %2", localize
            STRING_NAME("cacheTitle"), _createdCachesCount]);
    // Add destruction handler for the cache
    _cache addEventHandler ["Killed", {
        call FUNC("handleCacheKilled");
    }];

    // Get the position of the cache (not ATL)
    _position = getPos _cache;

    // Randomize the cache area marker position
    _markerPosition = [_position, _areaSize / 4, _areaSize] call
            lair_fnc_randomizePosition2D;

    // Create a new custom event for cache creation
    ["LairCacheCreated", [_cache, _markerPosition]] call CBA_fnc_globalEvent;
} else {
    LOG("Creating new cache");
    // If maximum cache amount is exceeded create a small hint
    hint "Maximum cache amount exceeded.";
};
