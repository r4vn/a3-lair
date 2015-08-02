SAD_fnc_createInsurgents = {
    private ["_cache", "_cachePosition", "_groupCount", "_group",
            "_groupPosition"];

    _cache = _this select 0;

    _cachePosition = position _cache;
    _groupCount = 1 + random SAD_MAX_INS_GROUP_COUNT;

    for "_i" from 0 to _groupCount do {
        _group = SAD_INS_GROUPS select (random count SAD_INS_GROUPS);

        _groupPosition = [_cachePosition, SAD_MIN_CACHE_MARKER_OFFSET,
                SAD_MAX_CACHE_MARKER_OFFSET] call SAD_fnc_randomizePosition2D;

        [_groupPosition, east, _group] call SAD_fnc_spawnGroup;
    };
};

SAD_fnc_spawnGroup = {
    private["_position", "_side", "_group", "_groupConfig"];

    _position = _this select 0;
    _side = _this select 1;
    _group = _this select 2;

    _position = _position findEmptyPosition [0, 100];
    _groupConfig = SAD_GET_GROUP_CFG(_group);

    DEBUG_pos = _position;

    [_position, _side, _groupConfig] call BIS_fnc_spawnGroup;
};
