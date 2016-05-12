/*
 * Author: r4vn
 *
 * Description:
 * Registers event handlers which influence the ticket system and are server
 * side.
 */

#include "..\script_component.hpp"

private [
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
_baseArea = call EFUNC("base", "getBaseArea");
_position = _baseArea select 0;
_radius = _baseArea select 1;

// Get all vehicles of the specified types
_vehicles = nearestObjects [_position, _types, _radius];

// Register handlers for vehicles ticket loss
{
    _x addEventHandler ["Killed", {
        [getNumber (MCFG >> "ticketLossVehicleDestruction")] call FUNC("createTicketLoss");
    }];
} forEach _vehicles;
