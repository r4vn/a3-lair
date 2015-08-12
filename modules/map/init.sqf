/*
 * Author: r4vn
 *
 * Description:
 * Initializes the map module. This module adds group and unit icons to
 * the player's map.
 */

#include "functions\script_macros.hpp"

// Make group icons visible
setGroupIconsVisible [true, true];

// Create unit icons for blufor
call FUNC("createUnitIcons");
