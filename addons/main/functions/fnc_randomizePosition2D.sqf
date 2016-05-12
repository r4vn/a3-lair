/*
 * Author: r4vn
 *
 * Description:
 * Randomizes a two dimensional location.
 *
 * TODO: Use distance for maximum offset check
 *
 * Parameter(s):
 *     0: <array> The position to randomize (equals the origin)
 *     1: <number> Minimum offset from the origin
 *     2: <number> Maximumoffset from the origin
 *
 * Returns:
 * <array> Randomized position of origin
 */

#include "..\script_component.hpp"

private  [
    "_originalPosition",
    "_newPosition",
    "_minOffset",
    "_maxOffset",
    "_offsetX",
    "_offsetY"
];

_originalPosition = _this select 0;
_minOffset = _this select 1;
_maxOffset = _this select 2;

// Set the new position to origin as we need to initialize the variable for the
// while loop
_newPosition = _originalPosition;

// Keep randomizing the position if offset requirements are not met
while {(_originalPosition distance _newPosition) < _minOffset} do {
    // Randomize the x and y coordinates of origin
    _offsetX = _maxOffset - random 2 * _maxOffset;
    _offsetY = _maxOffset - random 2 * _maxOffset;

    // Add the offset to the origin and save it in the new position
    _newPosition = [
        (_originalPosition select 0) + _offsetX,
        (_originalPosition select 1) + _offsetY
    ];
};

// Return the randomized position
_newPosition;
