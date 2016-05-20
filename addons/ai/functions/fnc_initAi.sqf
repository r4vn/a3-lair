/*
 * Author: r4vn
 *
 * Description:
 * Initializes ai.
 */

#include "..\script_component.hpp"

["LairCacheCreated", {
    LOG("Spawning ai");

    _this call FUNC("createInsurgents");
    _this call FUNC("createCivilians");
}] call CBA_fnc_addEventHandler;
