/**
 *
 */

private ["_group", "_position", "_waypoint"];

_group = _this select 0;
_position = _this select 1;

_waypoint = _group addWaypoint [_position, SAD_MIN_CACHE_MARKER_OFFSET];
_waypoint setWaypointType "LOITER";
_waypoint setWaypointLoiterType "CIRCLE_L";
