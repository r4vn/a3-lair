/**
 *
 */

#include "script_macros.hpp"

private [
    "_cache",
    "_cachePosition",
    "_markerPosition",
    "_groupCount",
    "_group",
    "_groups",
    "_groupCfg",
    "_groupCfgInfo",
    "_groupPosition",
    "_minOffset",
    "_maxOffset"
];

_markerPosition = _this select 0;
_cache = _this select 1;

_cachePosition = position _cache;
_groupCount = random SAD_MAX_INS_GROUP_COUNT;
_groups = getArray (MCFG >> "Insurgents" >> "groups");
_minOffset = getNumber (MCFG >> "Marker" >> "minOffset");
_maxOffset = getNumber (MCFG >> "Marker" >> "maxOffset");

for "_i" from 0 to _groupCount do {
    _groupCfgInfo = _groups call BIS_fnc_selectRandom;
    _groupCfg = GROUP_CFG(_groupCfgInfo select 0, _groupCfgInfo select 1);

    if (_i == 0) then {
        _groupPosition = [_cachePosition, _minOffset, _minOffset] call
                SAD_fnc_randomizePosition2D;
    } else {
        _groupPosition = [_cachePosition, _minOffset, _maxOffset / 2] call
                SAD_fnc_randomizePosition2D;
    };

    _group = [_groupPosition, east, _groupCfg] call
            FUNC("createInsurgentGroup");

    if (_i == 0) then {
        [_group, _cachePosition, _minOffset, _minOffset] call
                FUNC("createInsurgentGroupWaypoints");
    } else {
        [_group, _markerPosition, _minOffset, _maxOffset] call
                FUNC("createInsurgentGroupWaypoints");
    };
};
