/*
 * Author: r4vn
 *
 * Description:
 * Creates a insurgent group at a given location.
 *
 * Parameter(s):
 *     0: <array> The position where the group should spawn
 *     1: <side> The side to which the group belongs
 *     2: <config> The configuration entry of the group to spawn
 *
 * Returns:
 * <group> Returns the created group.
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

// Find an empty position within a 50m radius around the desired location
_position = _position findEmptyPosition [0, 50];

// Spawn the group
_group = [_position, _side, _groupConfig] call BIS_fnc_spawnGroup;

// Return the group
_group;
