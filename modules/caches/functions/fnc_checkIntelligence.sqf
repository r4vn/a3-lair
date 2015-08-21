/*
 * Author: r4vn
 *
 * Description:
 * Handles intelligence and spawns a new cache if enough information is
 * collected.
 *
 * Parameter(s):
 *     0: <number> Amount of information
 */

#include "script_macros.hpp"

private [
    "_addedIntelligence",
    "_currentIntelligence",
    "_neededIntelligence"
];

_addedIntelligence = _this select 0;

_neededIntelligence = getNumber (MCFG >> "neededIntelligencePerCache");
_currentIntelligence = missionNamespace getVariable [GVAR_NAME("intelligence"),
        0];

_currentIntelligence = _currentIntelligence + _addedIntelligence;

if (_currentIntelligence >= _neededIntelligence) then {
    _currentIntelligence = 0;
    // Create a new custom event for enough intelligence
    ["IntelligenceSuccess"] call CBA_fnc_globalEvent;
};

missionNamespace setVariable [GVAR_NAME("intelligence"), _currentIntelligence,
        true];
