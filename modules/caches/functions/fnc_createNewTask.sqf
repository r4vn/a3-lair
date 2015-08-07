/**
 *
 */

#include "script_macros.hpp"

private [
    "_taskId",
    "_position",
    "_task",
    "_desc",
    "_descShort",
    "_descHUD"
];

_position = _this select 0;
_cache = _this select 1;

_desc = localize "STR_SAD_taskDesc";
_descShort = localize "STR_SAD_taskDescShort";
_descHUD = localize "STR_SAD_taskTitle";

[
    west,
    vehicleVarName _cache,
    [_desc, _descHUD, vehicleVarName _cache],
    _position,
    true,
    0,
    true
] call BIS_fnc_taskCreate;
