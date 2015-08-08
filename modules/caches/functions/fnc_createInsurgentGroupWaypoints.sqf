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
_minOffset = _this select 2;
_maxOffset = _this select 3;

for "_i" from 0 to 3 do {
    _wpPosition = [_position, _minOffset, _maxOffset] call
            SAD_fnc_randomizePosition2D;

    _waypoint = _group addWaypoint [_wpPosition, 0];

    if (_i == 3) then {
        _waypoint setWaypointType "Cycle";
    } else {
        _waypoint setWaypointType "Move";
    };
};
