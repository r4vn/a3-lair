/*
 * Author: r4vn
 *
 * Description:
 * Ensures that the vehicle doesn't face a random direction but its initial
 * direction. It also creates a notification for players.
 *
 * Parameter(s):
 *     0: <object> The vehicle
 */

#include "..\script_macros.hpp"

private [
    "_vehicle",
    "_vehicleName"
];

_vehicle = _this select 0;

// Get the vehicle's display name from vehicles configuration
_vehicleName = getText (configFile >> "CfgVehicles" >> (typeof _vehicle) >>
        "displayName");

// Create respawn notification and send it to all players
[["VehicleRespawn", [_vehicleName]], "BIS_fnc_showNotification",
        west, false] call BIS_fnc_MP;

// Set vehicle's direction to its initial one which is stored the marker's
// direction
_vehicle setDir (markerDir (format ["respawn_%1", vehicleVarName _vehicle]));
