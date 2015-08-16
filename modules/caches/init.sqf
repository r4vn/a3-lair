/*
 * Author: r4vn
 *
 * Description:
 * Initializes the caches module. This module handles cache creation/destruction
 * and spawning insurgents.
 *
 * TODO: Use some player related resource in order to spawn/reveal new caches.
 */

#include "functions\script_macros.hpp"

private [
    "_intelDuration"
];

// Initializations
if (isServer) then {
    // Stores the amount of destroyed caches
    missionNamespace setVariable [GVAR_NAME("createdCachesCount"), 0, true];
    // Stores the amount of destroyed caches
    missionNamespace setVariable [GVAR_NAME("destroyedCachesCount"), 0, true];

    // Select a random intelligence time at which the cache will be unveiled.
    _intelDuration = random (getNumber (MCFG >> "intelDuration"));

    // Create a inital cache and execute the createNewCache function in its own
    // vm since its a computation heavy task.
    [_intelDuration] execVM FUNC_FILE("createNewCache");
};

