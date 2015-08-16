/*
 * Author: r4vn
 *
 * Description:
 * Creates respawns for each vehicle inside the radius of the base marker.
 *
 * TODO: Move the retrival of base marker to its own function
 */

#include "script_macros.hpp"

private [
    "_marker",
    "_baseArea",
    "_position",
    "_radius",
    "_vehicles",
    "_types"
];

// Vehicles types for which respawns should be created
_types = [
    "Car",
    "Motorcycle",
    "Tank",
    "Air",
    "Ship"
];

// Get the base area
_baseArea = call FUNC("getBaseArea");
_position = _baseArea select 0;
_radius = _baseArea select 1;

// Get all vehicles of the specified types
_vehicles = nearestObjects [_position, _types, _radius];

// Loop each vehicle
{
    // Create respawn marker and set the direction to the initial one from the
    // vehicle
    _marker = createMarker [format ["respawn_%1", vehicleVarName _x],
            getPos _x];
    _marker setMarkerDir (getDir _x);
    _marker setMarkerShape "Icon";

    // Use respawn delay defined in CfgSettings
    _x respawnVehicle [-1];
    // Register vehicle respawn event handler which will ensure the direction
    // of th erespawned vehicle and create a notification
    _x addMPEventHandler ["MPRespawn", {
        call FUNC("handlevehicleRespawn");
    }];
} forEach _vehicles;
