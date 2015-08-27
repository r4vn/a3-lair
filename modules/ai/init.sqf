/*
 * Author: r4vn
 *
 * Description:
 * Initializes the ai module. This module handles insurgents and civilians.
 *
 */

#include "script_macros.hpp"

private [
    "_intelDuration"
];

// Initializations
if (isServer) then {
    // Register cache creation handler for creating insurgents
    ["CacheCreated", {
        _this execVM FUNC_FILE("createInsurgents");
    }] call CBA_fnc_addEventHandler;

    // Register cache creation handler for creating civilians
    ["CacheCreated", {
        _this execVM FUNC_FILE("createCivilians");
    }] call CBA_fnc_addEventHandler;
};

