/*
 * Author: r4vn
 *
 * Description:
 * Initializes the mission hud.
 */

private [
    "_cacheCount",
    "_ticketCount"
];

// Show resource
cutRsc ["TicketsHud", "PLAIN", 1, false];

_cacheCount = "NeededCaches" call BIS_fnc_getParamValue;
_ticketCount = missionNamespace getVariable ["lair_tickets_ticketCount", 0];

(lair_ticketsHud select 0) displayCtrl 1100 ctrlSetText str _ticketCount;
(lair_ticketsHud select 0) displayCtrl 1101 ctrlSetText str _cacheCount;

// Register update handlers
["LairTicketsUpdated", {
    (lair_ticketsHud select 0) displayCtrl 1100 ctrlSetText str (_this
            select 0);
}] call CBA_fnc_addEventHandler;

["LairCacheKilled", {
    (lair_ticketsHud select 0) displayCtrl 1101 ctrlSetText str ((_this
                select 2) - (_this select 1));
}] call CBA_fnc_addEventHandler;
