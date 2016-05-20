/*
 * Author: r4vn
 *
 * Description:
 * Client handlers.
 */

player addAction [localize "STR_lair_deployRally", {
    ["LairRallyRequested", [player]] call CBA_fnc_globalEvent;
}, nil, 1.5, false, true, "", '
    _target == _this &&
            typeof (vehicle _this) == typeOf _this &&
            leader (group _this) == _this;
'];
