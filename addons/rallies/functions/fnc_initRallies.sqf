/*
 * Author: r4vn
 *
 * Description:
 * Initializes rallies. Offers the ability to create
 * rally points for groups/squads.
 */

#include "..\script_component.hpp"

["LairRallyRequested", {
    _this call FUNC("createRally");
}] call CBA_fnc_addEventHandler;

