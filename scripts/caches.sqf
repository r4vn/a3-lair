#include "defines.sqf"
#include "util.sqf"
#include "tasks.sqf"
#include "insurgents.sqf"

SAD_previousCaches = [];
SAD_currentCache = nil;

SAD_fnc_init = {
    uiSleep 10;

    call SAD_fnc_createNewCache;
};

SAD_fnc_findRandomCacheBuilding = {
    private ["_cacheBuildings", "_posX", "_posY"];

    _cacheBuildings = [];

    while {count _cacheBuildings == 0} do {
        _posX = random SAD_mapSize;
        _posY = random SAD_mapSize;

        _cacheBuildings = nearestObjects [
            [_posX, _posY, 0],
            SAD_cacheBuildings,
            500
        ];
    };

    _cacheBuildings;
};

SAD_fnc_findNewCacheLocation = {
    private ["_buildings", "_buildingPosition", "_cachePosition",  "_isValidDistance"];

    _buildings = [];
    _buildingPosition = nil;

    while {isNil "_buildingPosition"} do {
        _buildings = call SAD_fnc_findRandomCacheBuilding;
        _buildingPosition = position (_buildings select 0);

        _isValidDistance = [_buildingPosition] call
                SAD_fnc_checkCacheDistance;

        if (not _isValidDistance) then {
            _buildingPosition = nil;
        } else {};
    };

    _cachePosition = _buildingPosition findEmptyPosition [0, 100,
            SAD_cacheVehicle];

    _cachePosition;
};

SAD_fnc_checkCacheDistance = {
    private ["_newCachePosition", "_result", "_previousCachePosition",
            "_distance", "_previousCachesCount"];

    _newCachePosition = _this select 0;
    _previousCachesCount = count SAD_previousCaches;

    _result = true;

    for "_i" from 0 to _previousCachesCount - 1 do {
        scopeName "for";

        _previousCachePosition = position (SAD_previousCaches select _i);
        _distance = _previousCachePosition distance _newCachePosition;

        if (_distance < SAD_minCacheDistance) then {
            _result = false;
            breakOut "for";
        } else {};
    };

    _result;
};

SAD_fnc_cacheDestroyed = {
    SAD_destroyedCachesCount = SAD_destroyedCachesCount + 1;

    [SAD_currentMarker] call SAD_fnc_setCacheMarkerDestroyed;
    [[SAD_currentTask], "SAD_fnc_setTaskSucceeded", true, true] spawn BIS_fnc_MP;

    if (SAD_destroyedCachesCount < SAD_maxCachesCount) then {
        call SAD_fnc_createNewCache;
    } else {
        [["end1", true, true], "BIS_fnc_endMission", true, true] spawn BIS_fnc_MP;
    };
};

SAD_fnc_createNewCache = {
    private ["_position"];

    if ((count SAD_previousCaches) < SAD_availableCachesCount) then {
        _position = call SAD_fnc_findNewCacheLocation;

        SAD_currentCache = SAD_cacheVehicle createVehicle _position;
        SAD_currentCache addEventHandler ["killed", "call SAD_fnc_cacheDestroyed"];

        SAD_previousCaches = SAD_previousCaches + [SAD_currentCache];

        [_position] call SAD_fnc_createCacheMarker;
        [[_position], "SAD_fnc_createNewTask", true, true] spawn BIS_fnc_MP;
    } else {
        hint "Maximum cache amount exceeded.";
    };
};
