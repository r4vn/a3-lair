/*
 * Author: r4vn
 *
 * Description:
 * Initializes caches.
 */

#include "..\script_component.hpp"

private [
    "_firstCacheDelay"/*,
    "_secondCacheDelay"*/
];

["LairInit", {
    LOG("Initializing caches");

    // Stores the amount of destroyed caches
    missionNamespace setVariable [GVAR_NAME("createdCachesCount"), 0, true];
    // Stores the amount of destroyed caches
    missionNamespace setVariable [GVAR_NAME("destroyedCachesCount"), 0, true];
    // Stores the amount of intelligence
    missionNamespace setVariable [GVAR_NAME("intelligence"), 0, true];

    _firstCacheDelay = 15 + (random 15);
    // _secondCacheDelay = _firstCacheDelay + 15 + (random 30);

    ["LairCacheCreated", {
        _this call FUNC("createCacheMarker");
        _this call FUNC("createNewTask");
    }] call CBA_fnc_addEventHandler;

    /*
    // Register event handlers for intelligence system
    ["IntelligenceFound", {
        _this call FUNC("checkIntelligence");
    }] call CBA_fnc_addEventHandler;

    // Register event handler for intelligence success
    ["IntelligenceSuccess", {
        [0] execVM FUNC_FILE("createNewCache");
    }] call CBA_fnc_addEventHandler;
    */

    // Create a inital caches
    [_firstCacheDelay] execVM FUNC_PATH("createNewCache");
    // [_secondCacheDelay] execVM FUNC_FILE("createNewCache");
}] call CBA_fnc_addEventHandler;
