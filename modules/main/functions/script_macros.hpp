#define INIT(module) (compile (preprocessFileLineNumbers (\
        format ["modules\%1\init.sqf", module])))

#define FUNC(name) (compile (preprocessFileLineNumbers (\
        format ["modules\%1\functions\fnc_%2.sqf", MODULE, name])))

#define MCFG (missionConfigFile >> format ["Cfg%1", MODULE])
#define EMCFG(name) (missionConfigFile >> format ["Cfg%1", name])

#define INCREASE(var) var = var + 1

#define ARR_ADD(array, element) array = array + [element]

