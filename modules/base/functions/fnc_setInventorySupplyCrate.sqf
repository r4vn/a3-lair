/*
 * Author: r4vn
 *
 * Description:
 * Clears and fills the inventory of a supply crate.
 *
 * TODO: Move this to module configuration
 */

#include "script_macros.hpp"

call FUNC("clearInventoryGlobal");

_this addWeaponCargo ["rhs_weap_m16a4_grip_compm4", 2];
_this addWeaponCargo ["rhs_weap_M136", 1];
_this addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 10];
_this addMagazineCargo ["HandGrenade", 5];
_this addMagazineCargo ["SmokeShell", 5];
_this addMagazineCargo ["SmokeShellPurple", 5];
_this addMagazineCargo ["DemoCharge_Remote_Mag", 2];
_this addItemCargo ["ACE_Clacker", 1];
_this addItemCargo ["ACE_fieldDressing", 10];
_this addItemCargo ["ACE_morphine", 10];
_this addItemCargo ["ACE_epinephrine", 10];
_this addItemCargo ["ToolKit", 1];
