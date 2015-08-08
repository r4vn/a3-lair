/**
 *
 */

#include "script_macros.hpp"

player addAction [localize "STR_SAD_deployRally", {call FUNC("createRally")},
        nil, 1.5, false, true, "", 'call FUNC("checkRallyDeployAction")'];
