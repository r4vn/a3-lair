#include "scripts\caches.sqf"

[west, "SQL"] call BIS_fnc_addRespawnInventory;
[west, "RFM"] call BIS_fnc_addRespawnInventory;
[west, "ENG"] call BIS_fnc_addRespawnInventory;
[west, "MED"] call BIS_fnc_addRespawnInventory;
[west, "LAT"] call BIS_fnc_addRespawnInventory;
[west, "MAM"] call BIS_fnc_addRespawnInventory;
[west, "PLT"] call BIS_fnc_addRespawnInventory;

call SAD_fnc_init;
