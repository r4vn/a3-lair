/**
 *
 */
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
_vehicle addMPEventHandler ["MPRespawn",
        "call SAD_fnc_vehicleRespawnHandler"];
addToRemainsCollector [_vehicle];

SAD_vehicleRespawns = SAD_vehicleRespawns + [_marker];
