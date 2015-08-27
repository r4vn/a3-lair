/*
 * Author: r4vn
 *
 * Description:
 * Checks whether unit fulfills the requirements to deploy a rally point. In
 * order to perform this action a unit must be leader of its group, must have
 * the squadleader kit (currently identified via weared vest), and the target
 * must be the unit itself.
 *
 * Parameter(s):
 *     0: <object> The target (stored in _target)
 *     1: <object> The unit (stored in _this)
 *
 * Returns:
 * <boolean> Returns true if the unit is able to deploy a rally point,
 *           otherwise false.
 */

#include "..\script_macros.hpp"

// Is the target the unit itself?
_target == _this &&
        // Is the vehicle's unit itself? (equals not in a vehicle)
        typeof (vehicle _this) == typeOf _this &&
        // Is the unit leader of its group?
        leader (group _this) == _this &&
        // Does the unit have the squadleader kit?
        _this getVariable [EGVAR_NAME("kits", "isSquadLeader"), false];
