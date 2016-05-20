/*
 * Author: r4vn
 *
 * Description:
 * Waits until no more tickets are remaining and ends the mission in this case.
 */

#include "..\script_component.hpp"

waitUntil {
    (missionNamespace getVariable [GVAR_NAME("ticketCount"), 0]) <= 0;
};

["end1", false, true] remoteExec ["BIS_fnc_endMission", 0, true];
