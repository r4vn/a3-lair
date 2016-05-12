/*
 * Author: r4vn
 *
 * Description:
 * Creates a new task which is synced between all clients.
 *
 * Parameter(s):
 *     0: <object> The cache to which the task belongs
 *     1: <array> The position where the task is located
 */

#include "..\script_component.hpp"

private [
    "_taskId",
    "_position",
    "_task",
    "_desc",
    "_descShort",
    "_descHUD"
];

_cache = _this select 0;
_position = _this select 1;

// Get localization of task title and description
_desc = localize "STR_SAD_taskDesc";
_descShort = localize "STR_SAD_taskDescShort";
_descHUD = localize "STR_SAD_taskTitle";

// Create a new notification
[
    west,
    vehicleVarName _cache,
    [_desc, _descHUD, vehicleVarName _cache],
    _position,
    true,
    0,
    true
] call BIS_fnc_taskCreate;
