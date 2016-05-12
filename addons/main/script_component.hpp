/*
 * Author: r4vn
 *
 * Description:
 * Defines common macros used across modules.
 */

#define COMPONENT main

#include "script_mod.hpp"

#define ADDON ##PREFIX##_##COMPONENT

// Macro to wrap something in quotation marks
#define TO_STRING(str) #str
#define LOG(text) diag_log (format ["[%1.%2] %3", PREFIX, COMPONENT, text])

// Macro to get module configuration
#define COMPONENT_CONFIG (missionConfigFile >> format ["Cfg%1", COMPONENT])
#define GVAR_NAME(name) (format ["%1_%2_%3", PREFIX, COMPONENT, name])

// Macro to get code of a private module function
#define FUNC(name) (compile (preprocessFileLineNumbers (\
        format ["functions\fnc_%1.sqf", name])))
// Macro to get file name of private module function
#define FUNC_FILE(name) (format ["functions\fnc_%1.sqf", name]);


