/**
 *
 */

#include "script_macros.hpp"

if(!isDedicated) then {
    player addMPEventHandler ["MPRespawn", {
        execVM FUNC_FILE("createUnitMarkers");
    }];
};
