/**
 *
 */

#include "functions\script_macros.hpp"

private [
    "_intelDuration"
];

// Public variables
SAD_destroyedCachesCount = 0;
publicVariable "SAD_destroyedCachesCount";

SAD_caches = [];
publicVariable "SAD_caches";

SAD_tasks = [];
publicVariable "SAD_tasks";

// Initializations
if (isServer) then {
    _intelDuration = random (getNumber (MCFG >> "intelDuration"));

    [_intelDuration] execVM FUNC_FILE("createNewCache");
};

