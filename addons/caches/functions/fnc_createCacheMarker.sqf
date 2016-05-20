/*
 * Author: r4vn
 *
 * Description:
 * Creates area marker of a cache.
 *
 * Parameter(s):
 *     0: <object> The cache
 *     1: <array> The position where the marker should have its center
 *
 * Returns:
 * <string> Returns the created marker.
 */

#include "..\script_component.hpp"

private [
    "_marker",
    "_markerPosition",
    "_cache",
    "_markerSize"
];

_cache = _this select 0;
_markerPosition = _this select 1;

LOG("Creating new cache marker");

// Gwt the marker size which equals the maximum offset from the cache's position
_markerSize = getNumber (MISSION_CONFIG >> "areaSize");

// Create marker and set its visuals
_marker = createMarker [vehicleVarName _cache, _markerPosition];
_marker setMarkerShape "Rectangle";
_marker setMarkerSize [_markerSize, _markerSize];
_marker setMarkerBrush "DiagGrid";
_marker setMarkerColor "ColorOPFOR";

// Return the marker
_marker;
