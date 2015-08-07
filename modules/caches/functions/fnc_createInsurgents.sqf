/**
 *
 */

#include "script_macros.hpp"

private [
    "_cache",
    "_cachePosition",
    "_groupCount",
    "_group",
    "_groups",
    "_groupCfgInfo",
    "_groupPosition",
    "_minOffset",
    "_maxOffset"
];

_cache = _this select 0;

_cachePosition = position _cache;
_groupCount = random SAD_MAX_INS_GROUP_COUNT;
_groups = getArray (MCFG >> "Insurgents" >> "groups");
_minOffset = getNumber (MCFG >> "Marker" >> "minOffset");
_maxOffset = getNumber (MCFG >> "Marker" >> "maxOffset");

for "_i" from 0 to _groupCount do {
    _groupCfgInfo = _groups call BIS_fnc_selectRandom;
    _group = GROUP_CFG(_groupCfgInfo select 0, _groupCfgInfo select 1);

    _groupPosition = [_cachePosition, _minOffset, _maxOffset / 2] call
            SAD_fnc_randomizePosition2D;

    [_groupPosition, east, _group] call FUNC("createInsurgentGroup");
};
