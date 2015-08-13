/*
 * Author: Achluophobia with a lot of help from r4vn :P
 *
 * Description:
 * Pushes a unit out of an air vehicle if it does not have a pilot kit.
 *
 * Parameter(s):
 *     0: <object> The entered vehicle
 *     1: <string> Position inside the vehicle
 *     2: <object> The unit which entered the vehicle
 */

#include "script_macros.hpp"

private [
    "_vehicle",
    "_position",
    "_unit"
];

_vehicle = _this select 0;
_position = _this select 1;
_unit = _this select 2;

// Do nothing when vehicle is not an air unit
if (!(_vehicle isKindOf "Air")) exitWith {};

if (_position == "gunner" || _position == "driver") then {
    if (!(_unit getVariable ["SAD_kits_isPilot", false])) then {
        // Push unit out vehicle if it tries to enter the driver or gunner seat
        // and does not have a pilot kit
        moveOut _unit;
        hint localize "STR_SAD_canNotUseVehicle";
    };
};
