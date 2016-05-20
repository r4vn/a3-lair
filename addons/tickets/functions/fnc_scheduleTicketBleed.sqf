/*
 * Author: r4vn
 *
 * Description:
 * Creates ticket bleeding each minute.
 */

#include "..\script_component.hpp"

private [
    "_ticketCount",
    "_bleedPerMinute"
];

_bleedPerMinute = getNumber (MISSION_CONFIG >> "ticketBleed");

// Initial ticket bleed timeout
uiSleep 60;

while {
    _ticketCount = missionNamespace getVariable
            [GVAR_NAME("ticketCount"), 0];
    _ticketCount > 0
} do {
    [_bleedPerMinute] call FUNC("createTicketLoss");

    // Wait for 60s
    uiSleep 60;
};
