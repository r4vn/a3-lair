class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Ieds {
            class initIeds {
                description = "Initialize ieds";
                file = "\x\lair\addons\ieds\functions\fnc_initIeds.sqf";
                postInit = 1;
            };
        };
    };
};
