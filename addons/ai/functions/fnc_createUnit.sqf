/*
 * Author: r4vn
 *
 * Description:
 * Creates a unit at a given location.
 *
 * Parameter(s):
 *     0: <string> The configuration entry name of the unit to spawn
 *     1: <array> The position where the unit should spawn
 *     2: <group> The unit's group
 *
 * Returns:
 * <unit> Returns the created unit.
 */

#include "..\script_component.hpp"

private [
    "_position",
    "_unit",
    "_unitName",
    "_group"
];

_unitName = _this select 0;
_position = _this select 1;
_group = _this select 2;

// Find an empty position within a 50m radius around the desired location
_position = _position findEmptyPosition [0, 50, _unitName];

// Spawn the unit
_unit = _group createUnit [_unitName, _position, [], 0, "NONE"];

// Return the unit
_unit;
