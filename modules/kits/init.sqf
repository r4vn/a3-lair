/*
 * Author: r4vn
 *
 * Description:
 * Initializes the kits module. This module is resposible for kit handling and
 * action limitations according to the unit's kit.
 */

#include "functions\script_macros.hpp"

// Get kit configurations
_respawnInventoryConfig = (missionConfigFile >> "CfgRespawnInventory");

// Add each kit to respawn dialog
for "_i" from 0 to (count _respawnInventoryConfig) - 1 do {
    [west, configName (_respawnInventoryConfig select _i)] call
            BIS_fnc_addRespawnInventory;
};

if(!isDedicated) then {
    // Check player for a specialized kit on respawn
    player addEventHandler ["Respawn", {
        (_this select 0) execVM FUNC_FILE("checkKit");
    }];
};
