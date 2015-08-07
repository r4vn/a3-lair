/**
 *
 */

#include "script_macros.hpp"

private [
    "_vehicle",
    "_marker"
];

_vehicle = _this select 0;

if (isNil "_vehicle") exitWith {};

_marker = createMarker [format ["respawn_%1", vehicleVarName _vehicle],
        position _vehicle];
_marker setMarkerDir (getDir _vehicle);
_marker setMarkerShape "Icon";

_vehicle respawnVehicle [-1];
_vehicle addMPEventHandler ["MPRespawn", {
    call FUNC("vehicleRespawnHandler");
}];
addToRemainsCollector [_vehicle];
