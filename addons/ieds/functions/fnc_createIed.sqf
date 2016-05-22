/*
 * Author: r4vn
 *
 * Description:
 * Creates a ied on a random road near the given position.
 *
 * Parameter(s):
 *     0: <array> Position to look for nearby roads
 *     1: <boolean> If true, no actual ied will be created
 */

#include "..\script_component.hpp"

private [
    "_position",
    "_isFake",
    "_vehicle",
    "_indicatorVehicle",
    "_magazine",
    "_trigger",
    "_ied",
    "_indicator"
];

_position = _this select 0;
_isFake = _this select 1;

if (isNil "_isFake") then {
    _isFake = false;
};

_vehicle = getText (MISSION_CONFIG >> "vehicle");
_magazine = getText (MISSION_CONFIG >> "magazine");
_trigger = getText (MISSION_CONFIG >> "trigger");
_indicatorVehicle = getText (MISSION_CONFIG >> "indicatorVehicle");

if (!_isFake) then {
    createMine [_vehicle, _position, [], 0];
};

_indicator = _indicatorVehicle createVehicle _position;
