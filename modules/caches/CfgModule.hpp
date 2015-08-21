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
    buildings[] = {
        {"Land_jbad_House3", 4},
        {"Land_jbad_House5", 2},
        {"Land_jbad_House6", 8},
        {"Land_jbad_House7", 5},
        {"Land_jbad_House8", 13},
        {"Land_jbad_House_c_4", 3},
        {"Land_jbad_House_c_5", 3},
        {"Land_jbad_House_c_11", 7},
        {"Land_jbad_House_3_old", 1},
        {"Land_jbad_House_4_old", 6},
        {"Land_jbad_House_6_old", 3},
        {"Land_jbad_House_7_old", 5},
        {"Land_jbad_House_8_old", 2};
    };

    class Map {
        size = 5120;
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
        groups[] = {
            {"Infantry", "IRG_ReconSentry"},
            {"Infantry", "IRG_InfSentry"},
            {"Infantry", "IRG_InfTeam_AT"},
            {"Infantry", "IRG_InfTeam_MG"},
            {"Infantry", "IRG_InfSquad"},
            {"rhs_group_indp_ins_ural", "rhs_group_chdkz_ural_chq"};
        };
    };
};
