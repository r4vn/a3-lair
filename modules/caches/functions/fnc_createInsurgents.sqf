private ["_cache", "_cachePosition", "_groupCount", "_group",
        "_groupPosition"];

_cache = _this select 0;

_cachePosition = position _cache;
_groupCount = random SAD_MAX_INS_GROUP_COUNT;

for "_i" from 0 to _groupCount do {
    _group = SAD_INS_GROUPS call BIS_fnc_selectRandom;

    _groupPosition = [_cachePosition, SAD_MIN_CACHE_MARKER_OFFSET,
            SAD_MAX_CACHE_MARKER_OFFSET / 2] call
            SAD_fnc_randomizePosition2D;

    [_groupPosition, east, _group] call SAD_fnc_spawnGroup;
};
