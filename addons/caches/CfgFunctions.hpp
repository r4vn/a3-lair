class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Caches {
            class initCaches {
                description = "Initializes caches component";
                file = "\x\lair\addons\caches\functions\fnc_initCaches.sqf";
                postInit = 1;
            };
        };
    };
};
