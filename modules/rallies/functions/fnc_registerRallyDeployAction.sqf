/*
 * Author: r4vn
 *
 * Description:
 * Registers the deploy rally point action to the action menu of the player. It
 * will only be shown if checkRallyDeployAction returns true. If the action is
 * executed, createRally will be called.
 */

#include "script_macros.hpp"

player addAction [localize "STR_SAD_deployRally", {call FUNC("createRally")},
        nil, 1.5, false, true, "", 'call FUNC("checkRallyDeployAction")'];
