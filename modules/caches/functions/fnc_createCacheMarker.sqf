/**
 *
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

_markerSize = getNumber (MCFG >> "Marker" >> "maxOffset");

_marker = createMarker [vehicleVarName _cache, _markerPosition];
_marker setMarkerShape "Rectangle";
_marker setMarkerSize [_markerSize, _markerSize];
_marker setMarkerBrush "DiagGrid";
_marker setMarkerColor "ColorOPFOR";

_marker;
