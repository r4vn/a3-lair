/**
 *
 */

if(!isDedicated) then {
    player addMPEventHandler ["MPRespawn",
            "call SAD_fnc_createUnitMarkers"];
};
