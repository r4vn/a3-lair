/*
 * Author: r4vn
 *
 * Description:
 * Checks whether a unit is a medic and sets a variable on this unit.
 *
 * Parameter(s):
 *     0: <object> The unit (stored in _this)
 */

#include "script_macros.hpp"

private [
    "_isMedic",
    "_globalVarName",
    "_vest"
];

// Get the name for the storage variable which will be registered on the unit
_globalVarName = "ace_medical_medicClass";
// This variable stores the previous value of the variable or 0 if nil
_isMedic = _this getVariable [_globalVarName, 0];
// Get the needed vest for this special kit
_vest = (getArray (EMCFG("RespawnInventory") >> "Medic" >> "linkedItems"))
        select 0;

if (vest _this == _vest) then {
    if (_isMedic == 0) then {
        // Only set this unit as medic if it fulfills the requirements and
        // isn't already a medic
        _this setVariable [_globalVarName, 1];
    };
} else {
    if (_isMedic == 1) then {
        // If a unit is a medic but does not fulfill the requirements
        // anymore, revoke medic rights
        _this setVariable [_globalVarName, 0];
    };
};
