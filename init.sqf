#include "scripts\base.sqf"
#include "scripts\caches.sqf"

[west, "SQL"] call BIS_fnc_addRespawnInventory;
[west, "RFM"] call BIS_fnc_addRespawnInventory;
[west, "ENG"] call BIS_fnc_addRespawnInventory;
[west, "MED"] call BIS_fnc_addRespawnInventory;
[west, "LAT"] call BIS_fnc_addRespawnInventory;
[west, "MAM"] call BIS_fnc_addRespawnInventory;
[west, "PLT"] call BIS_fnc_addRespawnInventory;

if (isServer) then {
    ["Initialize"] call BIS_fnc_dynamicGroups;
} else {
    addToRemainsCollector [player];
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};

call SAD_fnc_init_base;
call SAD_fnc_init_caches;
