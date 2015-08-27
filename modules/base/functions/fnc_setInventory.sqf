/*
 * Author: r4vn
 *
 * Description:
 * Clears and fills an inventory of a vehicle.
 *
 * Parameter(s):
 *     0: <object> The vehicle
 *     1: <config> The inventory's contents
 */

#include "..\script_macros.hpp"

private [
    "_vehicle",
    "_contents",
    "_weapons",
    "_magazines",
    "_items"
];

_vehicle = _this select 0;
_contents = _this select 1;

// Get inventory contents from configuration
_weapons = getArray (_contents >> "weapons");
_magazines = getArray (_contents >> "magazines");
_items = getArray (_contents >> "items");

// Clear inventory of vehicle
_vehicle call FUNC("clearInventoryGlobal");

// Add weapons
{
    _vehicle addWeaponCargoGlobal [_x select 0, _x select 1];
} forEach _weapons;

// Add magazines
{
    _vehicle addMagazineCargoGlobal [_x select 0, _x select 1];
} forEach _magazines;

// Add items
{
    _vehicle addItemCargoGlobal [_x select 0, _x select 1];
} forEach _items;
