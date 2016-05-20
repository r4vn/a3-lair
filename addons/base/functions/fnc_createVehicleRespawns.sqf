/*
 * Author: r4vn
 *
 * Description:
 * Creates respawns for each vehicle inside the radius of the base marker.
 *
 * TODO: Move the retrival of base marker to its own function
 */

#include "..\script_component.hpp"

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

LOG("Creating vehicle respawns");

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
    // of the respawned vehicle and create a notification
    _x addMPEventHandler ["MPRespawn", {
        private [
            "_vehicle",
            "_vehicleName"
        ];

        _vehicle = _this select 0;

        LOG("Vehicle respawned");

        // Get the vehicle's display name from vehicles configuration
        _vehicleName = getText (configFile >> "CfgVehicles" >>
                (typeof _vehicle) >> "displayName");

        // Create respawn notification and send it to all players
        ["VehicleRespawn", [_vehicleName]] remoteExec [
                "BIS_fnc_showNotification", 0, false];

        // Set vehicle's direction to its initial one which is stored the
        // marker's direction
        _vehicle setDir (markerDir (format ["respawn_%1",
                vehicleVarName _vehicle]));
    }];
} forEach _vehicles;
