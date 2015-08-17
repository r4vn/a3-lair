/*
 * Author: r4vn
 *
 * Description:
 * Initializes the mission hud.
 */

#include "script_macros.hpp"

private [
    "_cacheCount",
    "_ticketCount"
];

// Wait for one second
uiSleep 2;

// Show resource
cutRsc ["MissionHud", "PLAIN", 1, false];

_cacheCount = 6;
_ticketCount = missionNamespace getVariable [GVAR_NAME("bluforTicketCount"), 0];

(SAD_tickets_missionHud select 0) displayCtrl 1100 ctrlSetText str _cacheCount;
(SAD_tickets_missionHud select 0) displayCtrl 1101 ctrlSetText str _ticketCount;

// Register update handler
["BluforTicketUpdate", {
    (SAD_tickets_missionHud select 0) displayCtrl 1101 ctrlSetText str (_this
            select 0);
}] call CBA_fnc_addEventHandler;
