/**
 *
 */

#include "functions\script_macros.hpp"

player addEventHandler ["Respawn", {
    call FUNC("registerRallyDeployAction");
}];
