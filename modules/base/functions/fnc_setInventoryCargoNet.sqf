/*
 * Author: r4vn
 *
 * Description:
 * Clears and fills the inventory of a cargo net.
 *
 * TODO (DONE): Move this to module configuration
 */

#include "script_macros.hpp"

call FUNC("clearInventoryGlobal");

_this addWeaponCargo ["rhs_weap_m16a4_grip_compm4", 3];
_this addWeaponCargo ["rhs_weap_m16a4_grip_compm4", 3];
_this addWeaponCargo ["rhs_weap_m249_pip_elcan", 1];
_this addWeaponCargo ["rhs_weap_M136", 3];
_this addWeaponCargo ["Laserdesignator", 1];
_this addWeaponCargo ["Rangefinder", 1];
_this addMagazineCargo ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 30];
_this addMagazineCargo ["rhsusf_100Rnd_556x45_soft_pouch", 6];
_this addMagazineCargo ["Laserbatteries", 2];
_this addMagazineCargo ["HandGrenade", 10];
_this addMagazineCargo ["SmokeShell", 20];
_this addMagazineCargo ["SmokeShellPurple", 10];
_this addMagazineCargo ["DemoCharge_Remote_Mag", 6];
_this addItemCargo ["ACE_Clacker", 2];
_this addItemCargo ["ACE_fieldDressing", 20];
_this addItemCargo ["ACE_morphine", 20];
_this addItemCargo ["ACE_epinephrine", 20];
_this addItemCargo ["ToolKit", 2];
