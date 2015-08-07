#include "modules\main\functions\script_macros.hpp"

[west, "SQL"] call BIS_fnc_addRespawnInventory;
[west, "RFM"] call BIS_fnc_addRespawnInventory;
[west, "LMG"] call BIS_fnc_addRespawnInventory;
[west, "ENG"] call BIS_fnc_addRespawnInventory;
[west, "MED"] call BIS_fnc_addRespawnInventory;
[west, "LAT"] call BIS_fnc_addRespawnInventory;
[west, "MAR"] call BIS_fnc_addRespawnInventory;
[west, "PLT"] call BIS_fnc_addRespawnInventory;

if (isServer) then {
    ["Initialize"] call BIS_fnc_dynamicGroups;
} else {
    addToRemainsCollector [player];
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
};

call INIT("main");
call INIT("base");
call INIT("map");
call INIT("rallies");
call INIT("caches");
