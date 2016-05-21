/*
 * Author: r4vn
 *
 * Description:
 * Defines common macros used across modules.
 */

#include "script_mod.hpp"

#define COMPONENT main

#define ADDON ##PREFIX##_##COMPONENT
#define ADDON_PATH (format ["\x\%1\addons\%2", #PREFIX, #COMPONENT])

// Macro to wrap something in quotation marks
#define TO_STRING(str) #str
#define LOG(message) (diag_log (text (format ["[%1.%2] %3", #PREFIX, #COMPONENT,  message])))

#define ADDON_CONFIG (configFile >> format ["Cfg%1", #COMPONENT])
#define EXT_ADDON_CONFIG(name) (configFile >> format ["Cfg%1", name])
#define MISSION_CONFIG (missionConfigFile >> format ["Cfg%1", #COMPONENT])
#define EXT_MISSION_CONFIG(name) (missionConfigFile >> format ["Cfg%1", name])
#define GVAR_NAME(name) (format ["%1_%2_%3", #PREFIX, #COMPONENT, name])

// Macro to get code of a private function
#define FUNC(name) (compile (preprocessFileLineNumbers (\
        format ["%1\functions\fnc_%2.sqf", ADDON_PATH, name])))
// Macro to get file name of private function
#define FUNC_FILE(name) (format ["%1\functions\fnc_%2.sqf", ADDON_PATH, name])

#define STRING_NAME(name) (format ["STR_%1_%2", #PREFIX, name])
