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
    "_group",
    "_vehicleClass",
    "_position",
    "_marker",
    "_vehicle",
    "_rallyVarPrefix",
    "_rallyVarName",
    "_animation",
    "_respawn"
];

_caller = _this select 0;

LOG("Rally requested by " + str (name _caller));

_rallyVarName = getText (ADDON_CONFIG >> "rallyVarName");
_vehicleClass = getText (MISSION_CONFIG >> "vehicle");
_animation = getText (MISSION_CONFIG >> "animation");
_group = group _caller;

_rallyData = _group getVariable ["rally", nil];

// Check whether the group already has a rally point and delete it if so
if (!isNil "_rallyData") then {
    // Delete respawn location
    (_rallyData select 0) call BIS_fnc_removeRespawnPosition;
    // Delete the old rally point marker
    deleteMarker (_rallyData select 1);
    // Delete the old rally point vehicle
    deleteVehicle (_rallyData select 2);
};

// Find an empty position near the squad leader
_position = (getPos _caller) vectorAdd ((vectorDir _caller) vectorMultiply 2);
_position = _position findEmptyPosition [0, 3, _vehicleClass];

if (count _position < 1) then {
    LOG("No empty position for rally found");

    [[STRING_NAME("noEmptyPosition")], {
        private ["_layer"];

        _layer = (_this select 0) cutText [localize (_this select 0),
                "PLAIN DOWN", 0.3, false];
        layer cutFadeOut 0.3
    }] remoteExec ["call", _caller, false];
} else {
    _respawn = [_group, _position] call BIS_fnc_addRespawnPosition;

    // Create respawn marker at the position of the rally point vehicle
    _marker = createMarker [format ["%1_west_%2", _rallyVarName,
            groupId _group], _position];
    // Set the visuals for the marker
    _marker setMarkerShape "Icon";
    _marker setMarkerType "mil_marker";
    _marker setMarkerColor "ColorWEST";
    _marker setMarkerText groupId _group;

    // Spawn rally point vehicle and set its direction to caller's one
    _vehicle = _vehicleClass createVehicle _position;
    _vehicle setDir direction _caller;

    if (!isNil "_animation") then {
        [_vehicle] call compile(_animation);
    };

    // Save the rally point in its variable
    _group setVariable ["rally", [_respawn, _marker, _vehicle]];

    // Notify other players that a new rally point is available
    [[STRING_NAME("rallyDeployNoteDesc")], {
        ["Rally", [localize (_this select 0)]] call BIS_fnc_showNotification;
    }] remoteExec ["call", _group, false];
};
