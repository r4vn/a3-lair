/*
 * Author: r4vn
 *
 * Description:
 * Initializes rallies. Offers the ability to create
 * rally points for groups/squads.
 */

#include "..\script_component.hpp"

private [
    "_unit"
];

["LairRallyRequested", {
    _this call FUNC("createRally");
}] call CBA_fnc_addEventHandler;

["LairPlayerRespawned", {
    _unit = _this select 0;

    FUNC("addActionDeployRally") remoteExec ["call", _unit, false];
}] call CBA_fnc_addEventHandler;
