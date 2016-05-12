/*
 * Author: r4vn
 *
 * Description:
 * Creates a new rally point. This means creating the vehicles and the
 * corresponding respawn marker. The label of the marker starts with a prefix
 * defined the module configuration file and is followed by the group name.
 *
 * Note: With the current implementation the rally point can be used by
 * the whole team.
 *
 * TODO: Make rally point only spawnable by its group and show the creation
 * notification only to its group
 *
 * Parameter(s):
 *     0: <object> Caller of the action
 */

#include "..\script_component.hpp"

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

// Check whether the group already has a rally point and delete it if so
if (!isNil _rallyVarName) then {
    // Delete the old rally point vehicle
    deleteVehicle (missionNamespace getVariable [_rallyVarName, nil]);
    // Delete the old rally point marker
    deleteMarker (format ["respawn_west_%1", _callerGroup]);
};

// Find an empty position near the squadleader aka the caller which have to
// be in a 50m radius and have enough space for the vehicle to spawn
_position = (getPos _caller) findEmptyPosition [0, 50, _vehicleClass];

// Create respawn marker at the position of the rally point vehicle
_marker = createMarker [format ["respawn_west_%1", _callerGroup],
        _position];
// Set the visuals for the marker
_marker setMarkerShape "Icon";
_marker setMarkerType "mil_join";
_marker setMarkerColor "ColorWEST";
_marker setMarkerText format ["%1 %2", localize "STR_SAD_rallyMarker",
        groupId (group _caller)];

// Spawn the actual rally point vehicle and set its direction to caller's one
_rally = _vehicleClass createVehicle _position;
_rally setDir direction _caller;

// Save the rally point in its variable
missionNamespace setVariable [_rallyVarName, _rally];

// Notify other players that a new rally point is available
[["Rally", [localize "STR_SAD_rallyDeployNoteDesc"]],
        "BIS_fnc_showNotification", west, false] call BIS_fnc_MP;
