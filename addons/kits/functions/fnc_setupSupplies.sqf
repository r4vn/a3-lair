/*
 * Author: r4vn
 *
 * Description:
 * Make kits accessible at supplies.
 */

#include "..\script_component.hpp"

private [
    "_baseArea",
    "_position",
    "_radius"
];

// Get the base area
_baseArea = call lair_fnc_getBaseArea;
_position = _baseArea select 0;
_radius = _baseArea select 1;

LOG("Setting up supplies with kits");

// Set inventory for each supply crate
{
    [[_x, STRING_NAME("requestKit")], {
        private [
            "_supply",
            "_actionText",
            "_respawnInventoryConfig",
            "_kitName"
        ];

        _supply = _this select 0;
        _actionText = _this select 1;

        _respawnInventoryConfig = (missionConfigFile >> "CfgRespawnInventory");

        for "_i" from 0 to (count _respawnInventoryConfig) - 1 do {
            _kitName = getText ((_respawnInventoryConfig select _i) >>
                    "displayName");

            _supply addAction [
                format [localize _actionText, _kitName],
                {
                    [player, _this select 3] call BIS_fnc_loadInventory;

                    missionNamespace setvariable
                            ["BIS_fnc_respawnMenuInventory_selected",
                            configName (_this select 3)];
                    player setVariable [getText (missionConfigFile >> "CfgKits"
                            >> "kitVarName"), configName (_this select 3)];
                },
                _respawnInventoryConfig select _i,
                2,
                false,
                true,
                "",
                '(_target distance _this) <= 3;'
            ];
        };
    }] remoteExec ["call", -2, true];
} forEach (nearestObjects [_position, ["B_supplyCrate_F"], _radius]);
