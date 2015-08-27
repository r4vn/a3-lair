/*
 * Author: r4vn
 *
 * Description:
 * Waits until no more tickets are remaining and ends the mission in this case.
 */

#include "..\script_macros.hpp"

waitUntil {
    (missionNamespace getVariable [GVAR_NAME("bluforTicketCount"), 0]) <= 0;
};

[["end1", false, true], "BIS_fnc_endMission", west, true] call BIS_fnc_MP;
