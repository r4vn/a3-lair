/*
 * Author: r4vn
 *
 * Description:
 * Initializes Lair gamemode.
 */

#include "..\script_component.hpp"

LOG("Initializing Lair");

[] spawn {
    uiSleep 5;

    ["LairInit", []] call CBA_fnc_globalEvent;
    ["Initialize", [true]] call BIS_fnc_dynamicGroups;
};
