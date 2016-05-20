/*
 * Author: r4vn
 *
 * Description:
 * Common client side event handlers.
 */

player setVariable ["lair_main_isInitialRespawn", true];

player addEventHandler ["Killed", {
    if (player getVariable ["lair_main_isInitialRespawn", false]) then {
        player setVariable ["lair_main_isInitialRespawn", false];
    } else {
        ["LairPlayerKilled", [player]] call CBA_fnc_globalEvent;
    };
}];

player addEventHandler ["Respawn", {
    ["LairPlayerRespawned", [player]] call CBA_fnc_globalEvent;
}];
