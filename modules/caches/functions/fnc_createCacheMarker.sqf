/*
 * Author: r4vn
 *
 * Description:
 * Creates area marker of a cache.
 *
 * Parameter(s):
 *     0: <array> The position where the marker should have its center
 *     1: <object> The cache
 *
 * Returns:
 * <string> Returns the created marker.
 */

#include "script_macros.hpp"

private [
    "_marker",
    "_markerPosition",
    "_cache",
    "_markerSize"
];

_markerPosition = _this select 0;
_cache = _this select 1;

// Gwt the marker size which equals the maximum offset from the cache's position
_markerSize = getNumber (MCFG >> "Marker" >> "maxOffset");

// Create marker and set its visuals
_marker = createMarker [vehicleVarName _cache, _markerPosition];
_marker setMarkerShape "Rectangle";
_marker setMarkerSize [_markerSize, _markerSize];
_marker setMarkerBrush "DiagGrid";
_marker setMarkerColor "ColorOPFOR";

// Return the marker
_marker;
