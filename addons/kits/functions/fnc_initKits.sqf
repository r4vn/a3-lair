/*
 * Author: r4vn
 *
 * Description:
 * Initializes kits.
 */

#include "..\script_component.hpp"

["LairInit", {
    LOG("Initializing kits");

    addMissionEventHandler ["PlayerConnected", {
        private [
            "_kitVarName",
            "_defaultKit"
        ];

        if ((_this select 2)  == "__SERVER__") exitWith {};

        _kitVarName = getText (missionConfigFile >> "CfgKits" >> "kitVarName");
        _defaultKit = getText (missionConfigFile >> "CfgKits" >> "defaultKit");

        LOG("Setting inventory of player " + str (_this select 2) + " to " +
            str _defaultKit);

        [[_kitVarName, _defaultKit], {
            /*
            player setVariable [_this select 0, _this select 1];
            */

            missionNamespace setvariable
                    ["BIS_fnc_respawnMenuInventory_selected", _this select 1];

            [player, missionConfigFile >> "CfgRespawnInventory" >>
                    _this select 1] call BIS_fnc_loadInventory;
        }] remoteExec ["call", (_this select 4), false];
    }];

    call FUNC("addKits");
    call FUNC("setupSupplies");
}] call CBA_fnc_addEventHandler;


