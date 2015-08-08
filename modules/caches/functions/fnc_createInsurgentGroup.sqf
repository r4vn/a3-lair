/**
 *
 */

#include "script_macros.hpp"

private [
    "_position",
    "_side",
    "_group",
    "_groupConfig"
];

_position = _this select 0;
_side = _this select 1;
_groupConfig = _this select 2;

_position = _position findEmptyPosition [0, 50];

_group = [_position, _side, _groupConfig] call BIS_fnc_spawnGroup;

_group;
