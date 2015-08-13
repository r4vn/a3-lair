/*
 * Author: r4vn
 *
 * Description:
 * Checks whether a unit is a squad leader and sets a variable on this unit.
 *
 * Parameter(s):
 *     0: <object> The unit (stored in _this)
 */

#include "script_macros.hpp"

private [
    "_isSquadLeader",
    "_globalVarName",
    "_vest"
];

// Get the name for the storage variable which will be registered on the unit
_globalVarName = GVAR_NAME("isSquadLeader");
// This variable stores the previous value of the variable or false if nil
_isSquadLeader = _this getVariable [_globalVarName, false];
// Get the needed vest for this special kit
_vest = (getArray (EMCFG("RespawnInventory") >> "SquadLeader" >> "linkedItems"))
        select 0;

if (vest _this == _vest) then {
    if (!_isSquadLeader) then {
        // Only set this unit as engineer if it fulfills the requirements and
        // isn't already a engineer
        _this setVariable [_globalVarName, true];
    };
} else {
    if (_isSquadLeader) then {
        // If a unit is a engineer but does not fulfill the requirements
        // anymore, revoke engineer rights
        _this setVariable [_globalVarName, false];
    };
};
