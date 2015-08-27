/*
 * Author: r4vn
 *
 * Description:
 * Initializes the map module. This module adds group and unit icons to
 * the player's map.
 */

#include "script_macros.hpp"

// Make group icons visible
setGroupIconsVisible [true, true];

// Create unit icons for blufor
if(!isDedicated) then {
    player addMPEventHandler ["MPRespawn", {
        execVM FUNC_FILE("createUnitMarkers");
    }];
};
