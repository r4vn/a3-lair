/*
 * Author: r4vn
 *
 * Description:
 * Periodically checks whether a unit has a special kit.
 *
 * Note: Should be executed in a VM.
 *
 * Parameter(s):
 *     0: <object> The unit (stored in _this)
 */

#include "script_macros.hpp"

// Keep checking while the unit is alive
while {alive _this} do {
    // Check for squad leader kit
    _this call FUNC("checkSquadLeaderKit");
    // Check for medic kit
    _this call FUNC("checkMedicKit");
    // Check for engineer kit
    _this call FUNC("checkEngineerKit");
    // Check for pilot kit
    _this call FUNC("checkPilotKit");

    // Wait for a small amount of time before continuing checking
    uiSleep 0.2;
};
