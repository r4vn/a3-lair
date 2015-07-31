#include "util.sqf"

SAD_currentTask = nil;
SAD_currentMarker = nil;

SAD_fnc_setTaskSucceeded = {
    private ["_task"];

    _task = _this select 0;
    _task setTaskState "Succeeded";

    ["TaskSucceeded",["", localize "STR_taskTitle_SAD"]] call
            BIS_fnc_showNotification;
};

SAD_fnc_createNewTask = {
    private ["_taskDesc", "_taskDescShort", "_taskDescHUD"];

    _markerPosition = _this select 0;
    _markerPosition = [_markerPosition, SAD_minCacheMarkerOffset,
            SAD_maxCacheMarkerOffset] call SAD_fnc_randomizePosition;

    _taskDesc = localize "STR_taskDesc_SAD";
    _taskDescShort = localize "STR_taskDescShort_SAD";
    _taskDescHUD = localize "STR_taskTitle_SAD";

    SAD_currentTask = player createSimpleTask [_taskDescHUD];
    SAD_currentTask setSimpleTaskDescription [
        _taskDesc,
        _taskDescShort,
        _taskDescHUD
    ];

    SAD_currentTask setSimpleTaskDestination _markerPosition;

    SAD_currentTask setTaskState "Assigned";
    player setCurrentTask SAD_currentTask;

    ["TaskAssigned",["", _taskDescHUD]] call BIS_fnc_showNotification;
};

SAD_fnc_createCacheMarker = {
    private ["_markerPosition", "_markerName"];

    _markerPosition = _this select 0;

    _markerName = format ["cache_area_%1", SAD_destroyedCachesCount + 1];
    SAD_currentMarker = createMarker [_markerName, _markerPosition];
    SAD_currentMarker setMarkerShape "Ellipse";
    SAD_currentMarker setMarkerSize [SAD_maxCacheMarkerOffset,
            SAD_maxCacheMarkerOffset];
    SAD_currentMarker setMarkerBrush "DiagGrid";
    SAD_currentMarker setMarkerColor "ColorOPFOR";
};

SAD_fnc_setCacheMarkerDestroyed = {
    private ["_markerName"];

    _markerName = _this select 0;

    _markerName setMarkerColor "ColorBLUFOR";
};
