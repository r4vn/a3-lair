/*
 * Author: r4vn
 *
 * Description:
 * Finds a new random location for a cache.
 *
 * Returns:
 * <array> Position of the cache inside a building above terrain level.
 */

#include "..\script_macros.hpp"

private [
    "_building",
    "_buildingData",
    "_buildingPos",
    "_position",
    "_cachePosition"
];

_building = nil;

// Keep searching for a location if no building is found yet
while {isNil "_building"} do {
    // Get a random cache building and the cache buildingPos inside the building
    _buildingData = call FUNC("findRandomCacheBuilding");
    _building = _buildingData select 0;
    _buildingPos = _buildingData select 1;
    // Get the position of the building (not ATL!)
    _position = getPos _building;

    // Check whether the new location matches the spacing requirements
    if (!([_position] call FUNC("checkCacheDistance"))) then {
        // If it does not match it set the building to nil
        _building = nil;
    };
};

// Get the position inside the building
_cachePosition = _building buildingPos _buildingPos;
// and return it
_cachePosition;
