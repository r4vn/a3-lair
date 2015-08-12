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

// ACE settings
ace_hearing_EnableCombatDeafness = true;
ace_hearing_EarplugsVolume = 0.9;
ace_hearing_UnconsciousnessVolume = 0.7;
ace_hearing_DisableEarRinging = true;

// Get kit configurations
_respawnInventoryConfig = (missionConfigFile >> "CfgRespawnInventory");

// Add each kit to respawn dialog
for "_i" from 0 to (count _respawnInventoryConfig) - 1 do {
    [west, configName (_respawnInventoryConfig select _i)] call
            BIS_fnc_addRespawnInventory;
};

if (isServer) then {
    // Initialize DynamicGroups on server side
    ["Initialize"] call BIS_fnc_dynamicGroups;
};

if(!isDedicated) then {
    // Initialize DynamicGroups on client side
    player addEventHandler ["Respawn", {
        ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
    }];

    // Check whether player is a medic on respawn
    player addEventHandler ["Respawn", {
        (_this select 0) execVM FUNC_FILE("checkUnitForMedicKit");
    }];
};
