#include "util.sqf"

SAD_tasks = [];

SAD_fnc_setTaskSucceeded = {
    private ["_taskId", "_task"];

    _taskId = _this select 0;

    _task = SAD_tasks select _taskId;
    _task setTaskState "Succeeded";

    ["TaskSucceeded",["", localize "STR_taskTitle_SAD"]] call
            BIS_fnc_showNotification;
};

SAD_fnc_createNewTask = {
    private ["_position", "_task", "_desc", "_descShort", "_descHUD"];

    _position = _this select 0;

    _desc = localize "STR_taskDesc_SAD";
    _descShort = localize "STR_taskDescShort_SAD";
    _descHUD = localize "STR_taskTitle_SAD";

    _task = player createSimpleTask [_descHUD];
    _task setSimpleTaskDescription [
        _desc,
        _descShort,
        _descHUD
    ];

    _task setSimpleTaskDestination _position;

    _task setTaskState "Assigned";
    player setCurrentTask _task;

    SAD_tasks = SAD_tasks + [_task];

    ["TaskAssigned",["", _descHUD]] call BIS_fnc_showNotification;
};

SAD_fnc_createCacheMarker = {
    private ["_marker", "_markerPosition"];

    _markerPosition = _this select 0;

    _marker = createMarker [GET_MARKER_ID(count SAD_activeCaches - 1),
            _markerPosition];
    _marker setMarkerShape "Ellipse";
    _marker setMarkerSize [SAD_MAX_CACHE_MARKER_OFFSET,
            SAD_MAX_CACHE_MARKER_OFFSET];
    _marker setMarkerBrush "DiagGrid";
    _marker setMarkerColor "ColorOPFOR";

    _marker;
};

SAD_fnc_setCacheMarkerDestroyed = {
    private ["_marker"];

    _marker = _this select 0;

    _marker setMarkerColor "ColorGrey";
};
