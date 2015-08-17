/*
 * Author: r4vn
 *
 * Description:
 * Creates ticket loss of the specified amount.
 *
 * Parameter(s):
 *     0: <number> The ticket loss
 */

#include "script_macros.hpp"

private [
    "_ticketCount",
    "_ticketLoss",
    "_newTicketCount"
];

_ticketLoss = _this select 0;

// Get current ticket count
_ticketCount = missionNamespace getVariable [GVAR_NAME("bluforTicketCount"), 0];
// Calculate new ticket count
_newTicketCount = _ticketCount - _ticketLoss;

// Set new ticket count
missionNamespace setVariable [GVAR_NAME("bluforTicketCount"), _newTicketCount,
        true];

// Create a new custom event
["BluforTicketUpdate", [_newTicketCount]] call CBA_fnc_globalEvent;
