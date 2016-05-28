/*
 * Author: r4vn
 *
 * Description:
 * Initializes IEDs.
 */

#include "..\script_component.hpp"

["LairInit", {
    LOG("Initializing ieds");

    ["CacheCreated", {
        [_this select 0] execVM FUNC_PATH("createRandomIeds");
    }] call CBA_fnc_addEventHandler;
}] call CBA_fnc_addEventHandler;
