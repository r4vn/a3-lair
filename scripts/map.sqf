SAD_fnc_createGroupIcon = {
    private ["_group", "_icon"];

    _group = group player;

    //if(leader _group != player) exitWith {};

    _group setGroupIconParams [
        [0, 0.3, 0.6, 0.65],
        groupId _group,
        1,
        true
    ];
};

SAD_fnc_init_map = {
    setGroupIconsVisible [true,false];

    call SAD_fnc_createGroupIcon;
};
