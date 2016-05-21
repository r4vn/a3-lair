/*
 * Author: r4vn
 *
 * Description:
 * Initializes ticket system. Responsible for setting blufor tickets,
 * managing ticket bleed and the corresponding part of user interface.
 */

#include "..\script_component.hpp"

private [
    "_ticketCount"
];

["LairInit", {
    LOG("Initializing ticket system");

    // Store & initialize the tickets
    _ticketCount = (getNumber (MISSION_CONFIG >> "ticketCountPerCache")) *
            ("NeededCaches" call BIS_fnc_getParamValue);

    LOG("Setting starting ticket count to " + str _ticketCount);

    missionNamespace setVariable [GVAR_NAME("ticketCount"), _ticketCount, true];

    // Register vehicle destruction event handlers
    call FUNC("registerVehicleDestructionHandlers");

    // Register cache destruction ticket win
    ["LairCacheKilled", {
        [getNumber (MISSION_CONFIG >> "ticketWinCacheKilled")] call
                FUNC("createTicketWin");
    }] call CBA_fnc_addEventHandler;

    // Register civilian killed ticket loss
    ["LairCivilianKilled", {
        [getNumber (MISSION_CONFIG >> "ticketLossCivilianKilled")] call
                FUNC("createTicketLoss");
    }] call CBA_fnc_addEventHandler;

    ["LairPlayerKilled", {
        [getNumber (MISSION_CONFIG >> "ticketLossPlayerKilled")] call
                FUNC("createTicketLoss");
    }] call CBA_fnc_addEventHandler;

    // Create ticket bleed per minute
    execVM FUNC_FILE("scheduleTicketBleed");
    // Create handler for mission failure
    execVM FUNC_FILE("scheduleOutOfTickets");
}] call CBA_fnc_addEventHandler;
