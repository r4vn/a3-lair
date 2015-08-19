/*
 * Author: r4vn
 *
 * Description:
 * Initializes the ieds module. Randomly spawns mines on roads.
 */

#include "functions\script_macros.hpp"

if (isServer) then {
    // Register cache destruction ticket win
    ["CacheCreated", {
        [_this select 0] execVM FUNC_FILE("createRandomIeds");
    }] call CBA_fnc_addEventHandler;
};
