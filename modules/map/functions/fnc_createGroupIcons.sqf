/**
 *
 */

SAD_fnc_createGroupIcons = {
    private ["_group", "_icon"];

    _group = group player;

    _group setGroupIconParams [
        [0, 0.3, 0.6, 0.65],
        groupId _group,
        1,
        true
    ];
};
