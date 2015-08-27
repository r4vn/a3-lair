/*
 * Author: r4vn
 *
 * Description:
 * This is the module configuration for the caches module and is accessible via
 * the MCFG macro.
 */

class CfgCaches {
    vehicle = "Box_FIA_Ammo_F";
    vehicleVarPrefix = "cache";
    maxCount = 6;
    minSpacing = 500;
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

    class Map {
        // Smaller edge length of map
        size = 6000;
    };

    class Marker {
        minOffset = 50;
        maxOffset = 200;
    };

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
