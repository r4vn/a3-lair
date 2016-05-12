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
    "_cacheBuildings",
    "_posX",
    "_posY",
    "_combatAreaPos",
    "_combatAreaSize"
];

// Initialize the cache buildings variable with an empty array
_cacheBuildings = [];

// Get the combat area size and cache building types/class names plus the buildingPos
_combatAreaPos = getMarkerPos (getText (COMPONENT_CONFIG >>
        "combatAreaMarkerName"));
_combatAreaSize = getMarkerSize (getText (COMPONENT_CONFIG >>
        "combatAreaMarkerName"));

_buildings = getArray (COMPONENT_CONFIG >> "buildings");
_buildingData = _buildings call BIS_fnc_selectRandom;

// Keep searching if no buildings found
while {count _cacheBuildings == 0} do {
    // Randomize search location
    _posX = (_combatAreaPos select 0) + random (_combatAreaSize select 0);
    _posY = (_combatAreaPos select 1) + random (_combatAreaSize select 1);

    // Get cache buildings around the random location within a 1000m radius
    _cacheBuildings = nearestObjects [
        [_posX, _posY, 0],
        [_buildingData select 0],
        1000
    ];
};

// Return the building and the cache location inside it
[
    _cacheBuildings select 0,
    _buildingData select 1
];
