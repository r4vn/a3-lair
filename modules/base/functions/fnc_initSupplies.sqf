/*
 * Author: r4vn
 *
 * Description:
 * Makes sure all specified supplies have their pre-defined inventory and not
 * the standard one.
 */

#include "..\script_macros.hpp"

private [
    "_baseArea",
    "_position",
    "_radius"
];

// Get the base area
_baseArea = call FUNC("getBaseArea");
_position = _baseArea select 0;
_radius = _baseArea select 1;

// Set inventory for each cargo net
{
    [_x, MCFG >> "Supplies" >> "CargoNet"] call FUNC("setInventory");
} forEach (nearestObjects [_position, ["B_CargoNet_01_ammo_F"], _radius]);

// Set inventory for each supply crate
{
    [_x, MCFG >> "Supplies" >> "SupplyCrate"] call FUNC("setInventory");
} forEach (nearestObjects [_position, ["B_supplyCrate_F"], _radius]);
