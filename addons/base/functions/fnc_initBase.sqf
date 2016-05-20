/*
 * Author: r4vn
 *
 * Description:
 * Initializes the base. This module is repsonsible for creating vehicle
 * respawn points in the missions main base. It also prepares the supplies
 * available in the base.
 */

#include "..\script_component.hpp"

["LairInit", {
    LOG("Initializing base");

    call FUNC("createVehicleRespawns");
    call FUNC("initSupplies");
}] call CBA_fnc_addEventHandler;
