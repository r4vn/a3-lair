/**
 *
 */

private ["_caller", "_callerGroup", "_position", "_marker", "_rally",
        "_rallyVarName"];

_caller = _this select 0;

_callerGroup = groupId (group _caller);
_rallyVarName = format ["%1%2", SAD_RALLY_VAR_PREFIX, _callerGroup];

if (!isNil _rallyVarName) then {
    deleteVehicle (missionNamespace getVariable [_rallyVarName, nil]);
    deleteMarker (format ["respawn_west_%1", _callerGroup]);
};

_position = (position _caller) findEmptyPosition [0, 50, SAD_RALLY_VEHICLE];

_marker = createMarker [format ["respawn_west_%1", _callerGroup],
        _position];
_marker setMarkerShape "Icon";
_marker setMarkerType "mil_join";
_marker setMarkerColor "ColorWEST";
_marker setMarkerText format ["%1 %2", localize "STR_SAD_rallyMarker",
        groupId (group _caller)];

_rally = SAD_RALLY_VEHICLE createVehicle _position;
_rally setDir direction _caller;

missionNamespace setVariable [_rallyVarName, _rally];

[["Rally", [localize "STR_SAD_rallyDeployNoteDesc"]],
        "BIS_fnc_showNotification", west, false] call BIS_fnc_MP;
