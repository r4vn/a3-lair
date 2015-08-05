#include "defines.hpp"
#include "util.sqf"
#include "tasks.sqf"
#include "insurgents.sqf"

SAD_destroyedCaches = [];
SAD_activeCaches = [];

SAD_fnc_findRandomCacheBuilding = {
    private ["_cacheBuildings", "_posX", "_posY"];

    _cacheBuildings = [];

    while {count _cacheBuildings == 0} do {
        _posX = random SAD_MAP_SIZE;
        _posY = random SAD_MAP_SIZE;

        _cacheBuildings = nearestObjects [
            [_posX, _posY, 0],
            SAD_CACHE_BUILDINGS,
            1000
        ];
    };

    _cacheBuildings select 0;
};

SAD_fnc_checkCacheDistance = {
    private ["_newCachePosition", "_result", "_activeCachePosition",
            "_distance", "_activeCachesCount"];

    _newCachePosition = _this select 0;
    _activeCachesCount = count SAD_activeCaches;

    _result = true;

    for "_i" from 0 to _activeCachesCount - 1 do {
        scopeName "for";

        _activeCachePosition = position (SAD_activeCaches select _i);
        _distance = _activeCachePosition distance _newCachePosition;

        if (_distance < SAD_MIN_CACHE_DISTANCE) then {
            _result = false;
            breakOut "for";
        };
    };

    _result;
};

SAD_fnc_findNewCacheLocation = {
    private ["_building", "_buildingId", "_buildings", "_buildingPosition",
            "_cachePosition", "_isValidDistance"];

    _building = nil;

    while {isNil "_building"} do {
        _building = call SAD_fnc_findRandomCacheBuilding;
        _buildingPosition = position _building;

        _isValidDistance = [_buildingPosition] call
                SAD_fnc_checkCacheDistance;

        if (!_isValidDistance) then {
            _building = nil;
        };
    };

    _buildingId = SAD_CACHE_BUILDINGS find (typeOf _building);
    _cachePosition = _building buildingPos (SAD_CACHE_BUILDING_POSITIONS select
            _buildingId);

    _cachePosition;
};

SAD_fnc_cacheDestroyed = {
    private ["_cacheId", "_cache", "_marker"];

    _cache = _this select 0;

    _cacheId = SAD_activeCaches find _cache;
    _marker = GET_MARKER_ID(_cacheId);

    _cache hideObjectGlobal true;

    SAD_destroyedCaches = SAD_destroyedCaches + [_cache];

    [_marker] call SAD_fnc_setCacheMarkerDestroyed;

    [[_cacheId], "SAD_fnc_setTaskSucceeded", west, true] call BIS_fnc_MP;
    [[], "SAD_fnc_createTaskSucceededNotification", west, false] call
            BIS_fnc_MP;

    if (count SAD_destroyedCaches < SAD_NEEDED_CACHES) then {
        call SAD_fnc_createNewCache;
    } else {
        [["end1", true, true], "BIS_fnc_endMission", west, true] call
                BIS_fnc_MP;
    };
};

SAD_fnc_createNewCache = {
    private ["_positionTerrainLevel", "_position", "_cache", "_markerPosition"];

    if ((count SAD_activeCaches) < SAD_MAX_CACHES) then {
        _positionTerrainLevel = call SAD_fnc_findNewCacheLocation;

        // Prevent destruction on spawn as position is ATL
        _cache = SAD_CACHE_VEHICLE createVehicle [-1000, -1000];
        _cache setPosATL _positionTerrainLevel;
        _cache addEventHandler ["killed", "call SAD_fnc_cacheDestroyed"];
        SAD_activeCaches = SAD_activeCaches + [_cache];

        _position = position _cache;

        [_cache] call SAD_fnc_createInsurgents;

        _markerPosition = [_position, SAD_MIN_CACHE_MARKER_OFFSET,
                SAD_MAX_CACHE_MARKER_OFFSET] call SAD_fnc_randomizePosition2D;
        _marker = [_markerPosition] call SAD_fnc_createCacheMarker;

        [[_markerPosition], "SAD_fnc_createNewTask", west, true] call
            BIS_fnc_MP;
        [[], "SAD_fnc_createTaskAssignedNotification", west, false] call
            BIS_fnc_MP;
    } else {
        hint "Maximum cache amount exceeded.";
    };
};

SAD_fnc_init_caches = {
    if (isServer) then {
        uiSleep 10;

        call SAD_fnc_createNewCache;
    };
};
