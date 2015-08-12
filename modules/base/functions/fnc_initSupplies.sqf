/*
 * Author: r4vn
 *
 * Description:
 * Makes sure all specified supplies have their pre-defined inventory and not
 * the standard one.
 *
 * TODO: Move inventory specification into module config
 * TODO: Move the retrival of base marker to its own function
 */

#include "script_macros.hpp"

private [
    "_markerName",
    "_markerPosition",
    "_markerSize",
    "_radius"
];

// Get the base marker and its dimensions
_markerName = getText (MCFG >> "markerName");
_markerPosition = getMarkerPos _markerName;
_markerSize = getMarkerSize _markerName;

// Select the larger of both axis as we can only use circles for the search
// radius
if (_markerSize select 0 < _markerSize select 1) then {
    _radius = _markerSize select 1;
} else {
    _radius = _markerSize select 0;
};

// Set inventory for each cargo net
{
    _x call FUNC("setInventoryCargoNet");
} forEach (nearestObjects [_markerPosition, ["B_CargoNet_01_ammo_F"], _radius]);

// Set inventory for each supply crate
{
    _x call FUNC("setInventorySupplyCrate");
} forEach (nearestObjects [_markerPosition, ["B_supplyCrate_F"], _radius]);
