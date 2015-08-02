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
            500
        ];
    };

    _cacheBuildings;
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
        } else {};
    };

    _result;
};

SAD_fnc_findNewCacheLocation = {
    private ["_buildings", "_buildingPosition", "_cachePosition",
            "_isValidDistance"];

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
            SAD_CACHE_VEHICLE];

    _cachePosition;
};

SAD_fnc_cacheDestroyed = {
    private ["_cacheId", "_cache", "_marker"];

    _cache = _this select 0;

    DEBUG_this = _this;
    DEBUG_cache = _cache;

    _cacheId = SAD_activeCaches find _cache;
    _marker = GET_MARKER_ID(_cacheId);

    DEBUG_marker = _marker;

    SAD_destroyedCaches = SAD_destroyedCaches + [_cache];

    [_marker] call SAD_fnc_setCacheMarkerDestroyed;

    if (isServer) then {
        [[_cacheId], "SAD_fnc_setTaskSucceeded", west, true] call BIS_fnc_MP;
    };

    if (count SAD_destroyedCaches < SAD_NEEDED_CACHES) then {
        call SAD_fnc_createNewCache;
    } else {
        [["end1", true, true], "BIS_fnc_endMission", true, false] call
                BIS_fnc_MP;
    };
};

SAD_fnc_createNewCache = {
    private ["_position", "_cache", "_markerPosition"];

    if ((count SAD_activeCaches) < SAD_MAX_CACHES) then {
        _position = call SAD_fnc_findNewCacheLocation;

        _cache = SAD_CACHE_VEHICLE createVehicle _position;
        _cache addEventHandler ["killed", "call SAD_fnc_cacheDestroyed"];
        SAD_activeCaches = SAD_activeCaches + [_cache];

        [_cache] call SAD_fnc_createInsurgents;

        _markerPosition = [_position, SAD_MIN_CACHE_MARKER_OFFSET,
                SAD_MAX_CACHE_MARKER_OFFSET] call SAD_fnc_randomizePosition2D;
        _marker = [_markerPosition] call SAD_fnc_createCacheMarker;

        if (isServer) then {
            [[_markerPosition], "SAD_fnc_createNewTask", west, true] call
                BIS_fnc_MP;
        };
    } else {
        hint "Maximum cache amount exceeded.";
    };
};

SAD_fnc_init = {
    if (isServer) then {
        uiSleep 10;

        call SAD_fnc_createNewCache;
    };
};
