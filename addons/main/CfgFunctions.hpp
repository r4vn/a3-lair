class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Main {
            class init {
                description = "Initializes Lair gamemode";
                file = "\x\lair\addons\main\functions\fnc_init.sqf";
            };

            class randomizePosition2D {
                description = "Translates a 2D position by random vector";
                file = "\x\lair\addons\main\functions\fnc_randomizePosition2D.sqf";
            };
        };
    };
};
