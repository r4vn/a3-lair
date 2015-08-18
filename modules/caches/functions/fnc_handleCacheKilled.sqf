/*
 * Author: r4vn
 *
 * Description:
 * Handles the destruction of a cache. Updates the destroyed caches count and
 * schedules creation of a new cache or ends the mission if all needed caches
 * has been destroyed.
 *
 * TODO: Add mission failure if west runs out of tickets
 * TODO: Add a small amount of tickets to west side if cache is destroyed
 * TODO: Update cache indicator on client hud
 *
 * Parameter(s):
 *     0: <object> The cache which was destroyed
 */

#include "script_macros.hpp"

private [
    "_destroyedCachesCount",
    "_cacheId",
    "_cache",
    "_intelDuration"
];

_cache = _this select 0;

// Get the name of the cache
_cacheId = vehicleVarName _cache;
// Hide the cache to prevent visual glitching
_cache hideObjectGlobal true;
// Increase the amount of destroyed caches
_destroyedCachesCount = missionNamespace getVariable [
        GVAR_NAME("destroyedCachesCount"), 0];
INCREASE(_destroyedCachesCount);
missionNamespace setVariable [GVAR_NAME("destroyedCachesCount"),
        _destroyedCachesCount, true];

// Update the cache area marker and task state to reflect the destroyed cache
_cacheId setMarkerColor "ColorGrey";
[_cacheId, "Succeeded", true] call BIS_fnc_taskSetState;

// Create a new custom event for cache destruction
["CacheDestruction", [_cache, _destroyedCachesCount, NEEDED_CACHES_COUNT]] call
        CBA_fnc_globalEvent;

// Check whether all needed caches have been destroyed
if (_destroyedCachesCount < NEEDED_CACHES_COUNT) then {
    // If there are still caches remaining generate random intelligence duration
    // and schedule new cache creation
    _intelDuration = random (getNumber (MCFG >> "intelDuration"));
    [_intelDuration] execVM FUNC_FILE("createNewCache");
} else {
    // End the mission if all caches have been destroyed and set it as
    // successful
    [["end1", true, true], "BIS_fnc_endMission", west, true] call BIS_fnc_MP;
};
