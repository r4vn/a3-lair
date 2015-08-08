/**
 *
 */

#include "script_macros.hpp"

private [
    "_cacheId",
    "_cache",
    "_intelDuration"
];

_cache = _this select 0;

_cacheId = vehicleVarName _cache;

_cache hideObjectGlobal true;

INCREASE(SAD_destroyedCachesCount);

_cacheId setMarkerColor "ColorGrey";
[_cacheId, "Succeeded", true] call BIS_fnc_taskSetState;

if (SAD_destroyedCachesCount < NEEDED_CACHES_COUNT) then {
    _intelDuration = random (getNumber (MCFG >> "intelDuration"));

    [_intelDuration] execVM FUNC_FILE("createNewCache");
} else {
    [["end1", true, true], "BIS_fnc_endMission", west, true] call BIS_fnc_MP;
};
