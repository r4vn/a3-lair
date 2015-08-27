/*
 * Author: r4vn
 *
 * Description:
 * Adds intelligence and deletes unit when at hq.
 *
 * Parameter(s):
 *     0: <object> The unit
 */

#include "..\script_macros.hpp"

private [
    "_unit",
    "_chance",
    "_hq",
    "_isAlive",
    "_questioningDistance",
    "_intelligenceSources",
    "_neededIntelligence",
    "_intelligenceChance",
    "_intelligence"
];

_unit = _this select 0;

_hq = missionNamespace getVariable [getText (MCFG >> "hqVarName"), nil];
_questioningDistance = getNumber (MCFG >> "questioningDistance");
_neededIntelligence = getNumber (EMCFG("caches") >>
        "neededIntelligencePerCache");
_isAlive = true;

// Wait until unit is near hq or dead/deleted
waitUntil {
    if (isNil "_unit" || !alive _unit) exitWith {
        _isAlive = false;
    };

    _hq distance _unit <= _questioningDistance;
};

// Only question unit if it is alive
if (!_isAlive) exitWith {};

_intelligenceSources = missionNamespace getVariable [
        GVAR_NAME("intelligenceSources"), 0];
_intelligence = random 1;

if (_intelligenceSources <= _neededIntelligence) then {
    _intelligence = _neededIntelligence;
};

// Create event
["IntelligenceFound", [_intelligence]] call CBA_fnc_globalEvent;

// Decrease sources amount since one has been questioned
_intelligenceSources = _intelligenceSources - 1;
missionNamespace setVariable [GVAR_NAME("intelligenceSources"),
        _intelligenceSources, true];

// Hide unit
deleteVehicle _unit;
