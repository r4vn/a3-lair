/*
 * Author: r4vn
 *
 * Description:
 * Handles the destruction of a cache. Updates the destroyed caches count and
 * schedules creation of a new cache or ends the mission if all needed caches
 * has been destroyed.
 *
 * Parameter(s):
 *     0: <object> The cache which was destroyed
 */

#include "..\script_component.hpp"

private [
    "_destroyedCachesCount",
    "_cacheId",
    "_cache",
    "_intelDuration"
];

_cache = _this select 0;

LOG("Cache destroyed");

// Get the name of the cache
_cacheId = vehicleVarName _cache;
// Hide the cache to prevent visual glitching
_cache hideObjectGlobal true;
// Increase the amount of destroyed caches
_destroyedCachesCount = missionNamespace getVariable [
        GVAR_NAME("destroyedCachesCount"), 0];
_destroyedCachesCount = _destroyedCachesCount + 1;
missionNamespace setVariable [GVAR_NAME("destroyedCachesCount"),
        _destroyedCachesCount, true];

LOG("Updating task state");
// Update the cache area marker and task state to reflect the destroyed cache
_cacheId setMarkerColor "ColorGrey";
[_cacheId, "Succeeded", true] remoteExec ["BIS_fnc_taskSetState", 0, true];

// Create a new custom event for cache destruction
["LairCacheKilled", [_cache, _destroyedCachesCount, NEEDED_CACHES_COUNT]]
        call CBA_fnc_globalEvent;

// Check whether all needed caches have been destroyed
if (_destroyedCachesCount >= NEEDED_CACHES_COUNT) then {
    // End the mission if all caches have been destroyed and set it as
    // successful
    ["end1", true, true] remoteExec ["BIS_fnc_endMission", 0, true];
};

[(15 + (random 30))] execVM FUNC_FILE("createNewCache");
