/*
 * Author: r4vn
 *
 * Description:
 * Creates random waypoints of a insurgent group.
 *
 * TODO: Make the count of waypoints a parameter
 *
 * Parameter(s):
 *     0: <group> The group to which the waypoints will be added
 *     1: <array> The position around which the waypoints should be located
 *     2: <number> Minimum offset for the random waypoint locations
 *     3: <number> Maximum offset for the random waypoint locations
 *
 * Returns:
 * <string> Returns the created marker.
 */

#include "script_macros.hpp"

private [
    "_group",
    "_position",
    "_waypoint",
    "_maxWaypointOffset"
];

_group = _this select 0;
_position = _this select 1;
_minOffset = _this select 2;
_maxOffset = _this select 3;

// Create three waypoints
for "_i" from 0 to 3 do {
    // Randomize the waypoint location
    _wpPosition = [_position, _minOffset, _maxOffset] call
            EFUNC("main", "randomizePosition2D");

    // Add the waypoint to the group
    _waypoint = _group addWaypoint [_wpPosition, 0];

    if (_i == 3) then {
        // When it's the last waypoint set its type to cycle
        _waypoint setWaypointType "Cycle";
    } else {
        // For every other waypoint set the type to move
        _waypoint setWaypointType "Move";
    };
};
