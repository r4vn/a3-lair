SAD_fnc_createInsurgents = {
    private ["_cache", "_cachePosition", "_groupCount", "_group",
            "_groupPosition"];

    _cache = _this select 0;

    _cachePosition = position _cache;
    _groupCount = random SAD_MAX_INS_GROUP_COUNT;

    for "_i" from 0 to _groupCount do {
        _group = SAD_INS_GROUPS call BIS_fnc_selectRandom;

        _groupPosition = [_cachePosition, SAD_MIN_CACHE_MARKER_OFFSET,
                SAD_MAX_CACHE_MARKER_OFFSET] call SAD_fnc_randomizePosition2D;

        [_groupPosition, east, _group] call SAD_fnc_spawnGroup;
    };
};

SAD_fnc_spawnGroup = {
    private ["_position", "_side", "_group", "_groupConfig"];

    _position = _this select 0;
    _side = _this select 1;
    _groupConfig = _this select 2;

    _position = _position findEmptyPosition [0, 100];

    _group = [_position, _side, _groupConfig] call BIS_fnc_spawnGroup;

    [_group, _position] call SAD_fnc_createGroupWaypoint;
};

SAD_fnc_createGroupWaypoint = {
    private ["_group", "_position", "_waypoint"];

    _group = _this select 0;
    _position = _this select 1;

    _waypoint = _group addWaypoint [_position, 50];
    _waypoint setWaypointType "LOITER";
    _waypoint setWaypointLoiterType "CIRCLE_L";
};
