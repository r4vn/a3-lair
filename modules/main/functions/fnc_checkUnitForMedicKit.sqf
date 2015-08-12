/*
 * Author: r4vn
 *
 * Description:
 * Periodically checks whether a unit has a medic kit.
 *
 * Note: Should be executed in a VM.
 *
 * Parameter(s):
 *     0: <object> The unit (stored in _this)
 */

#include "script_macros.hpp"

private [
    "_isMedic"
];

// Keep checking while the unit is alive
while {alive _this} do {
    DEBUG_t2 = 2;
    // Get ace medic variable for this unit
    _isMedic = _this getVariable ["ace_medical_medicClass", 0];

    if (vest _this == "rhsusf_iotv_ucp_medic") then {
        if (_isMedic == 0) then {
            // Only set this unit as medic if it fulfills the requirements and
            // isn't already a medic
            _this setVariable ["ace_medical_medicClass", 1];
        };
    } else {
        if (_isMedic == 1) then {
            // If a unit is a medic but does not fulfill the requirements
            // anymore, revoke medic rights
            _this setVariable ["ace_medical_medicClass", 0];
        };
    };

    // Wait a small amount of time
    uiSleep 0.2;
};
