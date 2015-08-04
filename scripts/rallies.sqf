#include "defines.hpp"

SAD_fnc_isOfficer = {
    vest _this == "rhsusf_iotv_ucp_squadleader" &&
            typeof (vehicle _this) == typeOf _this;
};

SAD_fnc_deployRally = {
    private ["_caller", "_callerGroup", "_position", "_marker", "_rally",
            "_rallyVarName"];

    _caller = _this select 0;

    _callerGroup = groupId (group _caller);
    _rallyVarName = format ["%1%2", SAD_RALLY_VAR_PREFIX, _callerGroup];

    if (!isNil _rallyVarName) then {
        deleteVehicle (missionNamespace getVariable [_rallyVarName, nil]);
        deleteMarker (format ["respawn_west_%1", _callerGroup]);
    };

    _position = position _caller;

    if (isServer) then {
        _position = _position findEmptyPosition [0, 50, SAD_RALLY_VEHICLE];

        _marker = createMarker [format ["respawn_west_%1", _callerGroup],
                _position];
        _marker setMarkerShape "Icon";
        _marker setMarkerType "mil_join";
        _marker setMarkerColor "ColorWEST";
        _marker setMarkerText format ["%1 %2", localize "STR_SAD_rallyMarker",
                groupId (group _caller)];

        _rally = SAD_RALLY_VEHICLE createVehicle _position;
        _rally setDir direction _caller;

        missionNamespace setVariable [_rallyVarName, _rally];

        [["Rally", [localize "STR_SAD_rallyDeployNoteDesc"]],
                "BIS_fnc_showNotification", west, false] call BIS_fnc_MP;
    };
};

SAD_fnc_registerRallyDeployAction = {
    // creates duplicate when facing another sl
    player addAction [localize "STR_SAD_deployRally",
            {call SAD_fnc_deployRally}, nil, 1.5, false, true, "",
            "call SAD_fnc_isOfficer"];
};

SAD_fnc_init_rallies = {
    player addEventHandler ["respawn", "call SAD_fnc_registerRallyDeployAction"];
};
