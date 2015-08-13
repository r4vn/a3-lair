/*
 * Author: r4vn
 *
 * Description:
 * Defines common macros used across modules.
 */

// Mission namespace
#define MISSION "SAD"

// Macro to wrap something in quotation marks
#define STRINGIFY(s) #s;

// Macro to get a global variable name
#define GVAR_NAME(name) (format ["%1_%2_%3", MISSION, MODULE, name])
#define EGVAR_NAME(mod, name) (format ["%1_%2_%3", MISSION, mod, name])

// Macro to get code of a module init function
#define INIT(module) (compile (preprocessFileLineNumbers (\
        format ["modules\%1\init.sqf", module])))

// Macro to get code of a private module function
#define FUNC(name) (compile (preprocessFileLineNumbers (\
        format ["modules\%1\functions\fnc_%2.sqf", MODULE, name])))
// Macro to get file name of private module function
#define FUNC_FILE(name) (format ["modules\%1\functions\fnc_%2.sqf", MODULE,\
        name]);
// Macro to get the global name of a function
#define GFUNC_NAME(name) (format ["%1_%2_fnc_%3", MISSION, MODULE, name])
#define EGFUNC_NAME(mod, name) (format ["%1_%2_fnc_%3", MISSION, mod, name])

// Macro to get module configuration
#define MCFG (missionConfigFile >> format ["Cfg%1", MODULE])
// Macro to get an external mission configuration by its name
#define EMCFG(name) (missionConfigFile >> format ["Cfg%1", name])

// Macro to increase a number variable by one
#define INCREASE(var) var = var + 1

// Macro to add a element to an array
#define ARR_ADD(array, element) array = array + [element]



