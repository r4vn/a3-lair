#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "lair_main",
            "lair_caches"
        };
        version = VERSION;
        author[] = {"r4vn"};
        authorUrl = "https://github.com/r4vn/";
    };
};

#include "CfgComponent.hpp"
#include "CfgFunctions.hpp"
