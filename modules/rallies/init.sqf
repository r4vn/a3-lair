/*
 * Author: r4vn
 *
 * Description:
 * Initializes the rallies module. This module offers the ability to create
 * rally points for groups/squads.
 */

#include "functions\script_macros.hpp"

// On each player respawn register the deploy rally action again since the
// registration will be lost on respawn
player addEventHandler ["Respawn", {
    call FUNC("registerRallyDeployAction");
}];
