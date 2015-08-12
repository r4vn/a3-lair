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
    "_markerPosition",
    "_markerSize",
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

// Get the base marker and its dimensions
_markerName = getText (MCFG >> "markerName");
_markerPosition = getMarkerPos _markerName;
_markerSize = getMarkerSize _markerName;

// Select the larger of both axis as we can only use circles for the search
// radius
if (_markerSize select 0 < _markerSize select 1) then {
    _radius = _markerSize select 1;
} else {
    _radius = _markerSize select 0;
};

// Get all vehicles of the specified types
_vehicles = nearestObjects [_markerPosition, _types, _radius];

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

    addToRemainsCollector [_x];
} forEach _vehicles;
