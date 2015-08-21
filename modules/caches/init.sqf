/*
 * Author: r4vn
 *
 * Description:
 * Initializes the caches module. This module handles cache creation/destruction
 * and spawning insurgents.
 */

#include "functions\script_macros.hpp"

// Initializations
if (isServer) then {
    // Stores the amount of destroyed caches
    missionNamespace setVariable [GVAR_NAME("createdCachesCount"), 0, true];
    // Stores the amount of destroyed caches
    missionNamespace setVariable [GVAR_NAME("destroyedCachesCount"), 0, true];
    // Stores the amount of intelligence
    missionNamespace setVariable [GVAR_NAME("intelligence"), 0, true];

    // Register event handlers for intelligence system
    ["IntelligenceFound", {
        _this call FUNC("checkIntelligence");
    }] call CBA_fnc_addEventHandler;

    // Register event handler for intelligence success
    ["IntelligenceSuccess", {
        [0] execVM FUNC_FILE("createNewCache");
    }] call CBA_fnc_addEventHandler;

    // Create a inital cache and execute the createNewCache function in its own
    // vm since its a computation heavy task.
    [15] execVM FUNC_FILE("createNewCache");
};
