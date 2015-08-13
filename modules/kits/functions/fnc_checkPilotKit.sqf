/*
 * Author: r4vn
 *
 * Description:
 * Checks whether a unit is a pilot and sets a variable on this unit.
 *
 * Parameter(s):
 *     0: <object> The unit (stored in _this)
 */

#include "script_macros.hpp"

private [
    "_isPilot",
    "_globalVarName",
    "_uniform"
];

// Get the name for the storage variable which will be registered on the unit
_globalVarName = GVAR_NAME("isPilot");
// This variable stores the previous value of the variable or false if nil
_isPilot = _this getVariable [_globalVarName, false];
// Get the needed vest for this special kit
_uniform = getText (EMCFG("RespawnInventory") >> "Pilot" >> "uniformClass");

if (uniform _this == _uniform) then {
    if (!_isPilot) then {
        // Only set this unit as engineer if it fulfills the requirements and
        // isn't already a engineer
        _this setVariable [_globalVarName, true];
    };
} else {
    if (_isPilot) then {
        // If a unit is a engineer but does not fulfill the requirements
        // anymore, revoke engineer rights
        _this setVariable [_globalVarName, false];
    };
};
