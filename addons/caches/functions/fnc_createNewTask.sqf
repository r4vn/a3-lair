/*
 * Author: r4vn
 *
 * Description:
 * Creates a new task which is synced between all clients.
 *
 * Parameter(s):
 *     0: <object> The cache to which the task belongs
 *     1: <array> The position where the task is located
 */

#include "..\script_component.hpp"

private [
    "_cache",
    "_position",
    "_buildingName",
    "_localeDesc",
    "_localeTitle",
    "_localeBuilding",
    "_vehicleName"
];

_cache = _this select 0;
_position = _this select 1;
_buildingName = _this select 2;

LOG("Creating new task at " + (str (_position select 0)) + " " +
    (str (_position select 1)));

_vehicleName = vehicleVarName _cache;
_localeDesc = STRING_NAME("taskDesc");
_localeTitle = STRING_NAME("taskTitle");
_localeBuilding = STRING_NAME(_buildingName);

// Create a new task on every client
[
    [
        _vehicleName,
        _localeDesc,
        _localeTitle,
        _position,
        _localeBuilding
    ],
    {
        [
            west,
            _this select 0,
            [
                format[localize (_this select 1), localize (_this select 4)],
                localize (_this select 2),
                _this select 0
            ],
            _this select 3,
            true,
            0,
            true,
            "destroy",
            true
        ] call BIS_fnc_taskCreate;
    }
] remoteExec ["call", -2, true];
