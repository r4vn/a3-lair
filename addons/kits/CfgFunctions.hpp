class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Kits {
            class initKits {
                description = "Initializes kits component";
                file = "\x\lair\addons\kits\functions\fnc_initKits.sqf";
                postInit = 1;
            };

            class addKits {
                description = "Make kits available";
                file = "\x\lair\addons\kits\functions\fnc_addKits.sqf";
            };

            class registerKitsEventHandlers {
                description = "Register events";
                file = "\x\lair\addons\kits\functions\fnc_registerKitsEventHandlers.sqf";
            };
        };
    };
};
