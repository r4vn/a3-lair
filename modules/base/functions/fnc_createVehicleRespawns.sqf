/**
 *
 */

private ["_markerPosition", "_markerSize", "_radius", "_vehicles",
        "_types"];

_types = [
    "Car",
    "Motorcycle",
    "Tank",
    "Air",
    "Ship"
];

_markerPosition = getMarkerPos SAD_BASE_MARKER_NAME;
_markerSize = getMarkerSize SAD_BASE_MARKER_NAME;

if (_markerSize select 0 < _markerSize select 1) then {
    _radius = _markerSize select 1;
} else {
    _radius = _markerSize select 0;
};

_vehicles = nearestObjects [_markerPosition, _types, _radius];

{[_x] call SAD_fnc_createVehiclesRespawnMarker;} forEach _vehicles;
