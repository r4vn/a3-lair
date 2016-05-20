/*
 * Author: r4vn
 *
 * Description:
 * Finds a new random building where a cache can spawn in.
 *
 * Returns:
 * <array> Array with the cache building and the cache location inside the
 * building.
 * 0: <object> The building
 * 1: <number> The buildingPos inside the building
 */

#include "..\script_component.hpp"

private [
    "_buildings",
    "_buildingData",
    "_building",
    "_buildingPos",
    "_cacheBuildings",
    "_posX",
    "_posY",
    "_combatAreaPos",
    "_combatAreaSize",
    "_return"
];

LOG("Searching a suitable building for cache");

// Initialize the cache buildings variable with an empty array
_cacheBuildings = [];
_return = nil;

// Get the combat area size and cache building types/class names plus the buildingPos
_combatAreaPos = getMarkerPos (getText (ADDON_CONFIG >>
        "combatAreaMarkerName"));
_combatAreaSize = getMarkerSize (getText (ADDON_CONFIG >>
        "combatAreaMarkerName"));
_posX = _combatAreaPos select 0;
_posY = _combatAreaPos select 1;
_radius = (_combatAreaSize select 0) max random (_combatAreaSize select 1);

LOG("Selecting random building class");
_buildings = getArray (MISSION_CONFIG >> "buildings");
_buildingData = _buildings call BIS_fnc_selectRandom;

_cacheBuildings = nearestObjects [
    [_posX, _posY, 0],
    [_buildingData select 0],
    _radius
];

_building = _cacheBuildings call BIS_fnc_selectRandom;
_buildingPos = _buildingData select 1;

if (count _cacheBuildings == 0) then {
    LOG("No building found");
} else {
    LOG("Building found");
    _return = [_building, _buildingPos];
};

// Return the building and the cache location inside it
_return;
