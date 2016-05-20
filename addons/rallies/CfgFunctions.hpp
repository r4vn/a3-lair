class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Rallies {
            class initRallies {
                description = "Initialize rallies";
                file = "\x\lair\addons\rallies\functions\fnc_initRallies.sqf";
                postInit = 1;
            };
        };
    };
};
