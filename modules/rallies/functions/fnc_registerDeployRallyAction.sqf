/**
 *
 */

#include "script_macros.hpp"

player addAction [localize "STR_SAD_deployRally", {call FUNC("deployRally")},
        nil, 1.5, false, true, "", 'call FUNC("checkDeployRallyAction")'];
