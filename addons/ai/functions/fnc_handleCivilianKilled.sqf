/*
 * Author: r4vn
 *
 * Description:
 * Handles death of a civilian.
 */

#include "..\script_component.hpp"

private [
    "_intelligenceSources"
];
/*
// Get current civilian count
_intelligenceSources = missionNamespace getVariable [
        GVAR_NAME("intelligenceSources"), 0];

// Decrease since one has been killed
_intelligenceSources = _intelligenceSources - 1;
missionNamespace setVariable [GVAR_NAME("intelligenceSources"),
        _intelligenceSources, true];

if (_intelligenceSources <= 0) {
    // No sources remaining to complete mission, meaning it failed
    ["end1", false, true] remoteExec ["BIS_fnc_endMission", 0, true];
};
*/
// Delegate event
["LairCivilianKilled", _this] call CBA_fnc_globalEvent;
