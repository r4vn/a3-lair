class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class base {
            class initBase {
                description = "Initializes base component";
                file = "\x\lair\addons\base\functions\fnc_initBase.sqf";
                postInit = 1;
            };

            class getBaseArea {
                description = "Get base position and size";
                file = "\x\lair\addons\base\functions\fnc_getBaseArea.sqf";
            };
        };
    };
};
