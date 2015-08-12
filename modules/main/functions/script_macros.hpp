/*
 * Author: r4vn
 *
 * Description:
 * Defines common macros used across modules.
 */

// Macro to get code of a module init function
#define INIT(module) (compile (preprocessFileLineNumbers (\
        format ["modules\%1\init.sqf", module])))

// Macro to get code of a private module function
#define FUNC(name) (compile (preprocessFileLineNumbers (\
        format ["modules\%1\functions\fnc_%2.sqf", MODULE, name])))
// Macro to get file name of private module function
#define FUNC_FILE(name) (format ["modules\%1\functions\fnc_%2.sqf", MODULE,\
        name]);

// Macro to get module configuration
#define MCFG (missionConfigFile >> format ["Cfg%1", MODULE])
// Macro to get an external mission configuration by its name
#define EMCFG(name) (missionConfigFile >> format ["Cfg%1", name])

// Macro to increase a number variable by one
#define INCREASE(var) var = var + 1

// Macro to add a element to an array
#define ARR_ADD(array, element) array = array + [element]

