/*
 * Author: r4vn
 *
 * Description:
 * This is the module configuration for the ai module and is accessible via
 * the MCFG macro.
 */

class CfgAi {
    minWaypointCount = 3;
    maxWaypointCount = 10;
    hqVarName = "hq_west";
    questioningDistance = 5;

    class Insurgents {
        minGroupCount = 3;
        guardCount = 2;
        side = "Indep";
        faction = "rhs_faction_insurgents";
        // In this array all groups which can spawn at a cache are defined.
        // The first entry in a insurgent group array is the category of the
        // group and the second is the group name. The configuration path for
        // the represented group is build using these two values.
        groups[] = {
            {"Infantry", "IRG_ReconSentry"},
            {"Infantry", "IRG_InfSentry"},
            {"Infantry", "IRG_InfTeam"},
            {"Infantry", "IRG_InfTeam_AT"},
            {"Infantry", "IRG_InfTeam_MG"},
            {"Infantry", "IRG_SniperTeam_M"},
            {"Support", "IRG_Support_CLS"},
            {"rhs_group_indp_ins_ural", "rhs_group_chdkz_ural_chq"},
            {"rhs_group_indp_ins_ural", "rhs_group_chdkz_ural_squad"},
            {"rhs_group_indp_ins_ural", "rhs_group_chdkz_ural_2mg"};
        };
    };

    class Civilians {
        units[] = {
            "C_man_polo_1_F_afro",
            "C_man_polo_2_F_afro",
            "C_man_polo_3_F_afro",
            "C_man_polo_4_F_afro",
            "C_man_polo_5_F_afro",
            "C_man_polo_6_F_afro",
            "C_man_p_fugitive_F_afro",
            "C_man_p_beggar_F_afro",
            "C_man_p_shorts_1_F_afro",
            "C_man_shorts_1_F_afro",
            "C_man_shorts_2_F_afro",
            "C_man_shorts_3_F_afro",
            "C_man_shorts_4_F_afro";
        };
    };
};
