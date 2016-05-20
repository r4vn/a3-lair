/*
 * Author: r4vn
 *
 * Description:
 * This is the configuration for the caches component.
 */

class CfgCaches {
    vehicle = "Box_FIA_Ammo_F";
    vehicleVarPrefix = "cache";
    combatAreaMarkerName = "lair_combat_area";
    // Must not exceed minimum count of intelligence sources
    neededIntelligencePerCache = 1.25;
    // This array stores all buildings in which a cache can spawn.
    // The first array entry of a building array is its class name and the
    // second is the buildingPos representing the location above terrain level
    // inside the building where the cache will be located.
    //
    // buildings[] = {
    //     {"house_class_name", 0},
    //     {"another_house_class_name", 1};
    // };
    buildings[] = {};

    class Insurgents {
        minGroupCount = 3;
        // In this array all groups which can spawn at a cache are defined.
        // The first entry in a insurgent group array is the category of the
        // group and the second is the group name. The configuration path for
        // the represented group is build using these two values.
        //
        // groups[] = {
        //     {"config_category_name", "config_group_name"},
        //     {"config_another_category_name", "config_another_group_name"};
        // };
        groups[] = {};
    };
};
