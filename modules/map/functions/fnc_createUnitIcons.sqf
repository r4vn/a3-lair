/**
 *
 */

#include "script_macros.hpp"

if(!isDedicated) then {
    player addMPEventHandler ["MPRespawn", {
        call FUNC("createUnitMarkers");
    }];
};
