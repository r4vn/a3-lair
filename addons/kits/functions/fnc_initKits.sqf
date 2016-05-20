/*
 * Author: r4vn
 *
 * Description:
 * Initializes kits.
 */

#include "..\script_component.hpp"

["LairInit", {
    LOG("Initializing kits");

    call FUNC("addKits");
    // [] remoteExec ["lair_fnc_registerKitsEventHandlers", -2, true];
}] call CBA_fnc_addEventHandler;


