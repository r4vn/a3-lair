/*
 * Author: r4vn
 *
 * Description:
 * Finds a new random location for a cache.
 *
 * Returns:
 * <array> Position of the cache inside a building above terrain level.
 */

#include "..\script_component.hpp"

private [
    "_building",
    "_buildingData",
    "_buildingPos",
    "_position",
    "_cachePosition"
];

LOG("Searching a new cache location");

_cachePosition = nil;
_building = nil;

for "_i" from 1 to 15 do {
    // Get a random cache building and the cache buildingPos inside the building
    _buildingData = call FUNC("findRandomCacheBuilding");

    if (!isNil "_buildingData") then {
        _building = _buildingData select 0;
        _buildingPos = _buildingData select 1;
        // Get the position of the building (not ATL!)
        _position = getPos _building;

        // Check whether the new location matches the spacing requirements
        if ([_position] call FUNC("checkCacheDistance"))  exitWith {};
    };
};

if (isNil "_building") then {
    LOG("No location found");
} else {
    // Get the position inside the building
    _cachePosition = _building buildingPos _buildingPos;
    LOG("New cache location found " + (str (_cachePosition select 0)) + ", " +
            (str (_cachePosition select 1)) + ", " + (str (typeOf _building)));
};

[_cachePosition, typeOf _building];
