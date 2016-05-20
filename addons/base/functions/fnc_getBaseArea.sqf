/*
 * Author: r4vn
 *
 * Description:
 * Retrieves the position and radius of the main base. If the axis of the main
 * base marker are not equal the larger one is used to force a circle radius.
 *
 * Returns:
 * <array> An array containing the base center and its radius.
 * 0: <array> The center position of the base
 * 1: <number> The base radius
 */

#include "..\script_component.hpp"

private [
    "_markerName",
    "_markerPosition",
    "_markerSize",
    "_radius"
];

LOG("Getting base marker");

// Get the base marker and its dimensions
_markerName = getText (ADDON_CONFIG >> "markerName");
_markerPosition = getMarkerPos _markerName;
_markerSize = getMarkerSize _markerName;

_radius = (_markerSize select 0) max (_markerSize select 1);

[_markerPosition, _radius];
