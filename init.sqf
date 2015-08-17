/*
 * Author: r4vn
 *
 * Description:
 * Initializes modules for the mission.
 */

#include "modules\main\functions\script_macros.hpp"

// Initialize modules
call INIT("main");
call INIT("kits");
call INIT("base");
call INIT("map");
call INIT("rallies");
call INIT("caches");
call INIT("tickets");
