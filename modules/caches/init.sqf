/*
 * Author: r4vn
 *
 * Description:
 * Initializes the caches module. This module handles cache creation/destruction
 * and spawning insurgents.
 *
 * TODO: Check whether SAD_caches is still needed or another simpler
 *       implementation is available
 * TODO: Use some player related resource in order to spawn/reveal new caches.
 */

#include "functions\script_macros.hpp"

private [
    "_intelDuration"
];

// Public variables

// Stores the amount of destroyed caches
SAD_destroyedCachesCount = 0;
publicVariable "SAD_destroyedCachesCount";

// Stores all created cache vehicles
SAD_caches = [];
publicVariable "SAD_caches";

// Initializations
if (isServer) then {
    // Select a random intelligence time at which the cache will be unveiled.
    _intelDuration = random (getNumber (MCFG >> "intelDuration"));

    // Create a inital cache and execute the createNewCache function in its own
    // vm since its a computation heavy task.
    [_intelDuration] execVM FUNC_FILE("createNewCache");
};

