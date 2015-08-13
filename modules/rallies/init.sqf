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
    // Registers the deploy rally point action to the action menu of the player.
    // It will only be shown if checkRallyDeployAction returns true. If the
    // action is executed, createRally will be called.
    player addAction [localize "STR_SAD_deployRally",
            {call FUNC("createRally")}, nil, 1.5, false, true, "",
            'call FUNC("checkRallyDeployAction")'];
}];
