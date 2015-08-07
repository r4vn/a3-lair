/**
 *
 */

private ["_unit", "_vehicleName"];

_unit = _this select 0;

_vehicleName = getText (configFile >> "CfgVehicles" >> (typeof _unit) >>
        "displayName");

[["VehicleRespawn", [_vehicleName]], "BIS_fnc_showNotification",
        west, false] call BIS_fnc_MP;

_unit setDir (markerDir (format ["respawn_%1", vehicleVarName _unit]));
