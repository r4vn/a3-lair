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

#include "..\script_component.hpp"

private [
    "_position",
    "_waypoint",
    "_unit",
    "_group",
    "_isAlive"
];

_unit = _this select 0;

_group = group _unit;
_isAlive = true;

// Wait until unit is prone or dead/deleted
waitUntil {
    if (isNil "_unit" || !alive _unit) exitWith {
        _isAlive = false;
    };

    unitPos _unit == "DOWN";
};

// Only add waypoint if unit is alive
if (!_isAlive) exitWith {};

// Add hold waypoint at the unit's current location, so it doesn't move
_waypoint = _group addWaypoint [getPos _unit, 0];
_waypoint setWaypointType "HOLD";
_group setCurrentWaypoint _waypoint;
