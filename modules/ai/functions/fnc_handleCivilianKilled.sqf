/*
 * Author: r4vn
 *
 * Description:
 * Handles death of a civilian.
 */

#include "..\script_macros.hpp"

private [
    "_intelligenceSources",
    "_neededIntelligence"
];

// Get current civilian count
_intelligenceSources = missionNamespace getVariable [
        GVAR_NAME("intelligenceSources"), 0];
_neededIntelligence = getNumber (EMCFG("caches") >>
        "neededIntelligencePerCache");

// Decrease since one has been killed
_intelligenceSources = _intelligenceSources - 1;
missionNamespace setVariable [GVAR_NAME("intelligenceSources"),
        _intelligenceSources, true];

if (_intelligenceSources <= 0) {
    // No sources remaining to complete mission, meaning it failed
    [["end1", false, true], "BIS_fnc_endMission", west, true] call BIS_fnc_MP;
};

// Delegate event
["CivilianKilled", _this] call CBA_fnc_globalEvent;
