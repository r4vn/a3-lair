/*
 * Author: r4vn
 *
 * Description:
 * Sets the waypoint to the unit's current location if the unit got told
 * to get down.
 *
 * Parameter(s):
 *     0: <object> The unit
 *
 * Returns:
 * <unit> Returns the created unit.
 */

#include "script_macros.hpp"

private [
    "_position",
    "_waypoint",
    "_unit",
    "_group"
];

_unit = _this select 0;

_group = group _unit;

waitUntil {unitPos _unit == "DOWN"};

_waypoint = _group addWaypoint [getPos _unit, 0];
_waypoint setWaypointType "HOLD";
_group setCurrentWaypoint _waypoint;
