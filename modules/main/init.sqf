/*
 * Author: r4vn
 *
 * Description:
 * This module offers essential and common functionalities used in other
 * modules.
 */

#define MODULE "main"

#include "functions\script_macros.hpp"

private [
    "_respawnInventoryConfig"
];

// Make public functions from this module accessible from other modules
SAD_fnc_randomizePosition2D = FUNC("randomizePosition2D");

// Get kit configurations
_respawnInventoryConfig = (missionConfigFile >> "CfgRespawnInventory");

// Add each kit to respawn dialog
for "_i" from 0 to (count _respawnInventoryConfig) - 1 do {
    [west, configName (_respawnInventoryConfig select _i)] call
            BIS_fnc_addRespawnInventory;
};

// Initialize DynamicGroups for both the server and client
if (isServer) then {
    ["Initialize"] call BIS_fnc_dynamicGroups;
} else {
    player addEventHandler ["Respawn", {
        ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
    }];
};
