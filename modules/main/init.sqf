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
    "_kitConfigs"
];

// Make public functions from this module accessible from other modules
SAD_fnc_randomizePosition2D = FUNC("randomizePosition2D");

// Get kits from configuration
_kitConfigs = 'inheritsFrom _x == (missionConfigFile >> "CfgRespawnInventory")'
        configClasses missionConfigFile;
// Add each kit to respawn dialog
{
    [west, configName _x] call BIS_fnc_addRespawnInventory;
} forEach _kitConfigs;

// Initialize DynamicGroups for both the server and client
if (isServer) then {
    ["Initialize"] call BIS_fnc_dynamicGroups;
} else {
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};
