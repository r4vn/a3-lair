/*
 * Author: r4vn
 *
 * Description:
 * Make kits accessible.
 */

#include "..\script_component.hpp"

// Get kit configurations
_respawnInventoryConfig = (missionConfigFile >> "CfgRespawnInventory");

// Add each kit to respawn dialog
for "_i" from 0 to (count _respawnInventoryConfig) - 1 do {
    [west, configName (_respawnInventoryConfig select _i)] call
            BIS_fnc_addRespawnInventory;
};
