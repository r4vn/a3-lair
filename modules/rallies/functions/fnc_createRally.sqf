/**
 *
 */

#include "script_macros.hpp"

private [
    "_caller",
    "_callerGroup",
    "_vehicleClass",
    "_position",
    "_marker",
    "_rally",
    "_rallyVarPrefix",
    "_rallyVarName"
];

_caller = _this select 0;

_callerGroup = groupId (group _caller);
_vehicleClass = getText (MCFG >> "vehicle");
_rallyVarPrefix = getText (MCFG >> "vehicleVarPrefix");
_rallyVarName = format ["%1%2", _rallyVarPrefix, _callerGroup];

if (!isNil _rallyVarName) then {
    deleteVehicle (missionNamespace getVariable [_rallyVarName, nil]);
    deleteMarker (format ["respawn_west_%1", _callerGroup]);
};

_position = (getPos _caller) findEmptyPosition [0, 50, _vehicleClass];

_marker = createMarker [format ["respawn_west_%1", _callerGroup],
        _position];
_marker setMarkerShape "Icon";
_marker setMarkerType "mil_join";
_marker setMarkerColor "ColorWEST";
_marker setMarkerText format ["%1 %2", localize "STR_SAD_rallyMarker",
        groupId (group _caller)];

_rally = _vehicleClass createVehicle _position;
_rally setDir direction _caller;

missionNamespace setVariable [_rallyVarName, _rally];

[["Rally", [localize "STR_SAD_rallyDeployNoteDesc"]],
        "BIS_fnc_showNotification", west, false] call BIS_fnc_MP;
