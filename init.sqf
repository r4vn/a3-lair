/*
 * Author: r4vn
 *
 * Description:
 * Initializes modules and scripts for the mission.
 *
 * TODO: Load kits to RespawnInventory automatically
 */

#include "modules\main\functions\script_macros.hpp"

// Add kits to RespawnInventory
[west, "SQL"] call BIS_fnc_addRespawnInventory;
[west, "RFM"] call BIS_fnc_addRespawnInventory;
[west, "LMG"] call BIS_fnc_addRespawnInventory;
[west, "ENG"] call BIS_fnc_addRespawnInventory;
[west, "MED"] call BIS_fnc_addRespawnInventory;
[west, "LAT"] call BIS_fnc_addRespawnInventory;
[west, "MAR"] call BIS_fnc_addRespawnInventory;
[west, "PLT"] call BIS_fnc_addRespawnInventory;

// Initialize DynamicGroups for both the server and client
if (isServer) then {
    ["Initialize"] call BIS_fnc_dynamicGroups;
} else {
    addToRemainsCollector [player];
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};

// Initialize modules
call INIT("main");
call INIT("base");
call INIT("map");
call INIT("rallies");
call INIT("caches");
