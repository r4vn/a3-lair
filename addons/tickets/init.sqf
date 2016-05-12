/*
 * Author: r4vn
 *
 * Description:
 * Initializes the tickets module. This module is repsonsible for setting blufor
 * tickets, managing ticket bleed and the corresponding part of user interface.
 */

#include "script_macros.hpp"

if (isServer) then {
    // Stores & initializes the blufor tickets
    missionNamespace setVariable [GVAR_NAME("bluforTicketCount"),
            getNumber (MCFG >> "bluforTicketCount"), true];

    // Register vehicle destruction event handlers
    call FUNC("registerVehicleDestructionHandlers");

    // Register cache destruction ticket win
    ["CacheDestruction", {
        [getNumber (MCFG >> "ticketWinCacheDestruction")] call
                FUNC("createTicketWin");
    }] call CBA_fnc_addEventHandler;

    // Register civilian killed ticket loss
    ["CivilianKilled", {
        [getNumber (MCFG >> "ticketLossCivilianKilled")] call
                FUNC("createTicketLoss");
    }] call CBA_fnc_addEventHandler;

    // Create ticket bleed per minute
    execVM FUNC_FILE("scheduleTicketBleed");
    // Create handler for mission failure
    execVM FUNC_FILE("scheduleOutOfTickets");
};

if (!isDedicated) then {
    player setVariable [GVAR_NAME("isInitalRespawn"), true];

    // Register handler for unit respawn ticket loss
    player addEventHandler ["Killed", {
        // Don't do anything if initial respawn
        if (player getVariable [GVAR_NAME("isInitalRespawn"), false]) exitWith {
            player setVariable [GVAR_NAME("isInitalRespawn"), false];
        };

        [getNumber (MCFG >> "ticketLossUnitKilled")] call
                FUNC("createTicketLoss");
    }];

    // Create UI elements
    player addEventHandler ["Respawn",{
        execVM FUNC_FILE("createMissionHud");
    }];
};
