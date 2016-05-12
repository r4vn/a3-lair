/*
 * Author: r4vn
 *
 * Description:
 * Initializes the mission hud.
 */

#include "..\script_component.hpp"

private [
    "_cacheCount",
    "_ticketCount"
];

// Wait for one second
uiSleep 2;

// Show resource
cutRsc ["MissionHud", "PLAIN", 1, false];

_cacheCount = "NeededCaches" call BIS_fnc_getParamValue;
_ticketCount = missionNamespace getVariable [GVAR_NAME("bluforTicketCount"), 0];

(SAD_tickets_missionHud select 0) displayCtrl 1100 ctrlSetText str _ticketCount;
(SAD_tickets_missionHud select 0) displayCtrl 1101 ctrlSetText str _cacheCount;

// Register update handlers
["BluforTicketUpdate", {
    (SAD_tickets_missionHud select 0) displayCtrl 1100 ctrlSetText str (_this
            select 0);
}] call CBA_fnc_addEventHandler;

["CacheDestruction", {
    (SAD_tickets_missionHud select 0) displayCtrl 1101 ctrlSetText str ((_this
                select 2) - (_this select 1));
}] call CBA_fnc_addEventHandler;
