/**
 *
 */

#include "script_macros.hpp"

private [
    "_building",
    "_buildingData",
    "_buildingPos",
    "_position",
    "_cachePosition",
    "_isValidDistance"
];

_building = nil;

while {isNil "_building"} do {
    _buildingData = call FUNC("findRandomCacheBuilding");
    _building = _buildingData select 0;
    _buildingPos = _buildingData select 1;
    _position = position _building;

    _isValidDistance = [_position] call FUNC("checkCacheDistance");

    if (!_isValidDistance) then {
        _building = nil;
    };
};

_cachePosition = _building buildingPos _buildingPos;

_cachePosition;
