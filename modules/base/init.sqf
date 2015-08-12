/*
 * Author: r4vn
 *
 * Description:
 * Initializes the base module. This module is repsonsible for creating vehicle
 * respawn points in the missions main base. It also prepares the supplies
 * available in the base.
 */

#include "functions\script_macros.hpp"

if (isServer) then {
    call FUNC("createVehicleRespawns");
    call FUNC("initSupplies");
};
