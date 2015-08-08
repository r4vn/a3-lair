/**
 *
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

_types = [
    "Car",
    "Motorcycle",
    "Tank",
    "Air",
    "Ship"
];

_markerName = getText (MCFG >> "markerName");

_markerPosition = getMarkerPos _markerName;
_markerSize = getMarkerSize _markerName;

if (_markerSize select 0 < _markerSize select 1) then {
    _radius = _markerSize select 1;
} else {
    _radius = _markerSize select 0;
};

_vehicles = nearestObjects [_markerPosition, _types, _radius];

{
    _marker = createMarker [format ["respawn_%1", vehicleVarName _x],
            getPos _x];
    _marker setMarkerDir (getDir _x);
    _marker setMarkerShape "Icon";

    _x respawnVehicle [-1];
    _x addMPEventHandler ["MPRespawn", {
        call FUNC("handlevehicleRespawn");
    }];
addToRemainsCollector [_x];
} forEach _vehicles;
