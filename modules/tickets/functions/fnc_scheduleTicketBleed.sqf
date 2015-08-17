/*
 * Author: r4vn
 *
 * Description:
 * Creates ticket bleeding each minute.
 */

#include "script_macros.hpp"

private [
    "_ticketCount",
    "_bleedPerMinute",
    "_newTicketCount"
];

_bleedPerMinute = getNumber (MCFG >> "ticketBleed");

// Initial ticket bleed timeout
uiSleep 60;

while {
    _ticketCount = missionNamespace getVariable [GVAR_NAME("bluforTicketCount"),
            0];
    _ticketCount > 0
} do {
    // Calculate new ticket count
    _newTicketCount = _ticketCount - _bleedPerMinute;

    // Remove ticket bleed from ticket count
    missionNamespace setVariable [GVAR_NAME("bluforTicketCount"),
            _newTicketCount, true];

    // Create a new custom event
    ["BluforTicketUpdate", [_newTicketCount]] call CBA_fnc_globalEvent;

    // Wait for 60s
    uiSleep 60;
};
