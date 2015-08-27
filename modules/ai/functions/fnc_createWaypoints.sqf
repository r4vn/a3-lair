/*
 * Author: r4vn
 *
 * Description:
 * Creates random waypoints of a insurgent group.
 *
 * Parameter(s):
 *     0: <group> The group to which the waypoints will be added
 *     1: <number> Maximum amount of waypoints to create
 *     2: <array> The position around which the waypoints should be located
 *     3: <number> Minimum offset for the random waypoint locations
 *     4: <number> Maximum offset for the random waypoint locations
 *
 * Returns:
 * <string> Returns the created marker.
 */

#include "..\script_macros.hpp"

private [
    "_group",
    "_count",
    "_position",
    "_waypoint",
    "_maxWaypointOffset"
];

_group = _this select 0;
_count = _this select 1;
_position = _this select 2;
_minOffset = _this select 3;
_maxOffset = _this select 4;

// Create waypoints
for "_i" from 0 to _count - 1 do {
    // Randomize the waypoint location
    _wpPosition = [_position, _minOffset, _maxOffset] call
            EFUNC("main", "randomizePosition2D");

    // Add the waypoint to the group and set speed
    _waypoint = _group addWaypoint [_wpPosition, 0];
    _waypoint setWaypointSpeed "LIMITED";

    if (_i == _count - 1) then {
        // When it's the last waypoint set its type to cycle
        _waypoint setWaypointType "Cycle";
    } else {
        // For every other waypoint set the type to move
        _waypoint setWaypointType "Move";
    };
};
