/**
 *
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

_maxWaypointOffset = getNumber (MCFG >> "Marker" >> "minOffset");

_waypoint = _group addWaypoint [_position, _maxWaypointOffset];
_waypoint setWaypointType "Loiter";
_waypoint setWaypointLoiterType "Circle_L";
