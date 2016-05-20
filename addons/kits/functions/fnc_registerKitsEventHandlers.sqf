/*
 * Author: r4vn
 *
 * Description:
 * Event handlers registration.
 */

#include "..\script_component.hpp"

// Check player for a specialized kit on respawn
player addEventHandler ["Respawn", {
    (_this select 0) execVM FUNC_FILE("checkKit");
}];

// Check player for pilot kit on GetIn event
{
    _x addEventHandler ["GetIn", {
        _this call FUNC("handleGetInAircraft");
    }];
} forEach vehicles;
