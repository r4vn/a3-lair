/**
 *
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

_maxCacheCount = getNumber (MCFG >> "maxCount");

if ((count SAD_caches) < _maxCacheCount) then {
    if (isNil "_delay") then {
        _delay = 0;
    };

    uiSleep _delay;

    _positionTerrainLevel = call FUNC("findNewCacheLocation");

    _minOffset = getNumber (MCFG >> "Marker" >> "minOffset");
    _maxOffset = getNumber (MCFG >> "Marker" >> "maxOffset");

    _vehicle = getText (MCFG >> "vehicle");
    _vehicleVarPrefix = getText (MCFG >> "vehicleVarPrefix");

    // Prevent destruction on spawn as position is ATL
    _cache = _vehicle createVehicle [-1000, -1000];
    _cache setPosATL _positionTerrainLevel;
    _cache setVehicleVarName (format ["%1 %2", localize "STR_SAD_cacheTitle",
            (count SAD_caches) + 1]);
    _cache addEventHandler ["killed", {
        call FUNC("cacheDestroyed");
    }];

    ARR_ADD(SAD_caches, _cache);

    _position = position _cache;

    _markerPosition = [_position, _minOffset, _maxOffset] call
            SAD_fnc_randomizePosition2D;

    [_markerPosition, _cache] call FUNC("createCacheMarker");
    [_markerPosition, _cache] call FUNC("createNewTask");

    [_markerPosition, _cache] call FUNC("createInsurgents");
} else {
    hint "Maximum cache amount exceeded.";
};
