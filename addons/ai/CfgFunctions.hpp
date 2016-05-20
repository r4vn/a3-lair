class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Ai {
            class initAi {
                description = "Initialize ai";
                file = "\x\lair\addons\ai\functions\fnc_initAi.sqf";
                postInit = 1;
            };
        };
    };
};
