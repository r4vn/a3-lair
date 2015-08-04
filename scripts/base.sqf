#include "defines.hpp"

SAD_vehicleRespawns = [];

// check for locality
SAD_fnc_vehicleRespawnHandler = {
    private ["_unit", "_vehicleName"];

    _unit = _this select 0;

    _vehicleName = getText (configFile >> "CfgVehicles" >> (typeof _unit) >>
            "displayName");

    [["VehicleRespawn", [_vehicleName]], "BIS_fnc_showNotification",
            west, false] call BIS_fnc_MP;

    _unit setDir (markerDir (format ["respawn_%1", vehicleVarName _unit]));
};

SAD_fnc_createVehiclesRespawnMarker = {
    private ["_vehicle", "_marker"];
    scopeName "SAD_fnc_createVehiclesRespawnMarker";

    _vehicle = _this select 0;

    if (isNil "_vehicle") then {
        breakOut "SAD_fnc_createVehiclesRespawnMarker";
    };

    _marker = createMarker [format ["respawn_%1", vehicleVarName _vehicle],
            position _vehicle];
    _marker setMarkerDir (getDir _vehicle);
    _marker setMarkerShape "Icon";

    _vehicle respawnVehicle [-1];
    _vehicle addMPEventHandler ["mprespawn",
            "call SAD_fnc_vehicleRespawnHandler"];
    addToRemainsCollector [_vehicle];

    SAD_vehicleRespawns = SAD_vehicleRespawns + [_marker];
};

SAD_fnc_createVehicleRespawns = {
    private ["_markerPosition", "_markerSize", "_radius", "_vehicles", "_types"];

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
};

SAD_fnc_init_base = {
    if (isServer) then {
        call SAD_fnc_createVehicleRespawns;
    };
};
