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

#include "..\script_component.hpp"

private [
    "_group",
    "_count",
    "_position",
    "_waypoint",
    "_areaSize",
    "_behaviour",
    "_combatMode"
];

_group = _this select 0;
_count = _this select 1;
_position = _this select 2;
_areaSize = _this select 3;
_behaviour = _this select 4;
_combatMode = _this select 5;

// Create waypoints
for "_i" from 1 to _count do {
    // Add the waypoint to the group and set speed
    _waypoint = _group addWaypoint [_position, _areaSize];
    _waypoint setWaypointBehaviour _behaviour;
    _waypoint setWaypointCombatMode _combatMode;
    _waypoint setWaypointSpeed "LIMITED";

    if (_i == _count) then {
        // When it's the last waypoint set its type to cycle
        _waypoint setWaypointType "CYCLE";
    } else {
        // For every other waypoint set the type to move
        _waypoint setWaypointType "MOVE";
    };
};
