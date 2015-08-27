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

#include "..\script_macros.hpp"

private [
    "_buildings",
    "_buildingData",
    "_cacheBuildings",
    "_posX",
    "_posY",
    "_mapSize"
];

// Initialize the cache buildings variable with an empty array
_cacheBuildings = [];

// Get the map size and cache building types/class names plus the buildingPos
_mapSize = getNumber (MCFG >> "Map" >> "size");
_buildings = getArray (MCFG >> "buildings");
// Select a random building type
_buildingData = _buildings call BIS_fnc_selectRandom;

// Keep searching if no buildings found
while {count _cacheBuildings == 0} do {
    // Randomize search location
    _posX = random _mapSize;
    _posY = random _mapSize;

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
