/*
 * Author: r4vn
 *
 * Description:
 * Initializes Lair gamemode.
 */

#include "..\script_component.hpp"

LOG(Initializing Lair);

["LairInit", []] call CBA_fnc_globalEvent;
["Initialize", [true]] call BIS_fnc_dynamicGroups;
