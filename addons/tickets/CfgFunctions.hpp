class CfgFunctions {
    class Lair {
        tag = TO_STRING(PREFIX);
        project = TO_STRING(PREFIX);

        class Tickets {
            class initTickets {
                description = "Initialize tickets";
                file = "\x\lair\addons\tickets\functions\fnc_initTickets.sqf";
                postInit = 1;
            };

            class createMissionHud {
                description = "Creates the tickets and cache count on client's hud";
                file = "\x\lair\addons\tickets\functions\fnc_createMissionHud.sqf";
            };
        };
    };
};
