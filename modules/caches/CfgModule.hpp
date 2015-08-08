class CfgCaches {
    vehicle = "Box_FIA_Ammo_F";
    vehicleVarPrefix = "cache"
    maxCount = 6;
    minSpacing = 500;
    intelDuration = 10;
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
