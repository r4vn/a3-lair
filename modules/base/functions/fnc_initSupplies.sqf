/**
 *
 */

#include "script_macros.hpp"

private [
    "_markerName",
    "_markerPosition",
    "_markerSize",
    "_radius"
];

_markerName = getText (MCFG >> "markerName");

_markerPosition = getMarkerPos _markerName;
_markerSize = getMarkerSize _markerName;

if (_markerSize select 0 < _markerSize select 1) then {
    _radius = _markerSize select 1;
} else {
    _radius = _markerSize select 0;
};

{
    _x call FUNC("setInventoryCargoNet");
} forEach (nearestObjects [_markerPosition, ["B_CargoNet_01_ammo_F"], _radius]);

{
    _x call FUNC("setInventorySupplyCrate");
} forEach (nearestObjects [_markerPosition, ["B_supplyCrate_F"], _radius]);
