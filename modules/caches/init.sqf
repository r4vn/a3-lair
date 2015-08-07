/**
 *
 */

#include "functions\script_macros.hpp"

// Public variables
SAD_destroyedCachesCount = 0;
publicVariable "SAD_destroyedCachesCount";

SAD_caches = [];
publicVariable "SAD_caches";

SAD_tasks = [];
publicVariable "SAD_tasks";

if (isServer) then {
    uiSleep 10;

    call FUNC("createNewCache");
};

