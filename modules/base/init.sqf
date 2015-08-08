/**
 *
 */

#include "functions\script_macros.hpp"

if (isServer) then {
    call FUNC("createVehicleRespawns");
    call FUNC("initSupplies");
};
