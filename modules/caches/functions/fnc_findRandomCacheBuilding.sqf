/**
 *
 */

#include "script_macros.hpp"

private [
    "_return",
    "_buildings",
    "_buildingData",
    "_cacheBuildings",
    "_posX",
    "_posY",
    "_mapSize"
];

_cacheBuildings = [];

_mapSize = getNumber (MCFG >> "Map" >> "size");
_buildings = getArray (MCFG >> "buildings");
_buildingData = _buildings call BIS_fnc_selectRandom;

while {count _cacheBuildings == 0} do {
    _posX = random _mapSize;
    _posY = random _mapSize;

    _cacheBuildings = nearestObjects [
        [_posX, _posY, 0],
        [_buildingData select 0],
        1000
    ];
};

_return = [
    _cacheBuildings select 0,
    _buildingData select 1
];

_return;
