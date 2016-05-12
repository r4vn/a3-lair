#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_events"
        };
        version = VERSION;
        versionStr = TO_STRING(VERSION);
        versionAr[] = {VERSION_ARRAY};
        author[] = {"r4vn"};
        authorUrl = "https://github.com/r4vn/";
    };
};

#include "CfgFunctions.hpp"
