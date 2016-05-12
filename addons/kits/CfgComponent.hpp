/*
 * Author: r4vn
 *
 * Description:
 * This is the module configuration for the map module and is accessible via
 * the MCFG macro.
 */

class CfgKits {};

// All kits used in the mission are defined in the class below.
// Each inner class represents a single kit. Locales should be used for
// the kit's display name.
//
// IMPORTANT: The first linkedItem always has to be the vest and must be the
// same for an alternative kit variant!
class CfgRespawnInventory {
    class SquadLeader {
        displayName = $STR_SAD_kitOfficer;
        icon = "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa";
        weapons[] = {
            "rhs_weap_m16a4_grip_compm4",
            "rhsusf_weap_m1911a1",
            "Throw",
            "Put",
            "Laserdesignator"
        };
        magazines[] = {
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "HandGrenade",
            "HandGrenade",
            "SmokeShell",
            "SmokeShell",
            "SmokeShellPurple",
            "SmokeShellPurple",
            "Laserbatteries"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_squadleader",
            "rhsusf_ach_helmet_headset_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "tf_rt1523g";
    };

    class SquadLeaderAlternative: SquadLeader {
        displayName = $STR_SAD_kitOfficerAlternative;
        weapons[] = {
            "rhs_m4a1_acog",
            "rhsusf_weap_m1911a1",
            "Throw",
            "Put",
            "Laserdesignator"
        };
    };

    class Rifleman {
        displayName = $STR_SAD_kitRifleman;
        icon = "\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa";
        weapons[] = {
            "rhs_weap_m16a4_grip_compm4",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "HandGrenade",
            "HandGrenade",
            "SmokeShell",
            "SmokeShell"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp";
    };

    class RiflemanAlternative: Rifleman {
        displayName = $STR_SAD_kitRiflemanAlternative;
        weapons[] = {
            "rhs_m4a1_grip_acog_usmc",
            "Throw",
            "Put"
        };
    };

    class AutomaticRifleman {
        displayName = $STR_SAD_kitAutomaticRifleman;
        icon = "\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa";
        weapons[] = {
            "rhs_weap_m249_pip_elcan",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhsusf_100Rnd_556x45_soft_pouch",
            "rhsusf_100Rnd_556x45_soft_pouch",
            "rhsusf_100Rnd_556x45_soft_pouch",
            "HandGrenade",
            "HandGrenade",
            "SmokeShell",
            "SmokeShell"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp";
    };

    class AutomaticRiflemanAlternative: AutomaticRifleman {
        displayName = $STR_SAD_kitAutomaticRiflemanAlternative;
        weapons[] = {
            "rhs_weap_m240b_elcan",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhsusf_50Rnd_762x51",
            "rhsusf_50Rnd_762x51",
            "rhsusf_50Rnd_762x51",
            "rhsusf_50Rnd_762x51",
            "rhsusf_50Rnd_762x51",
            "HandGrenade",
            "HandGrenade",
            "SmokeShell",
            "SmokeShell"
        };
    };

    class Medic {
        displayName = $STR_SAD_kitMedic;
        icon = "\a3\characters_f\data\ui\icon_medic_ca.paa";
        weapons[] = {
            "rhs_weap_m16a4_grip_compm4",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "SmokeShell",
            "SmokeShell",
            "SmokeShell",
            "SmokeShell"
        };
        items[] = {
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_epinephrine",
            "ACE_morphine",
            "ACE_morphine",
            "ACE_morphine",
            "ACE_morphine",
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_medic",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp_medic";
    };

    class MedicAlternative: Medic {
        displayName = $STR_SAD_kitMedicAlternative;
        weapons[] = {
            "rhs_m4a1_grip_acog3",
            "Throw",
            "Put"
        };
    };

    class RiflemanAntiTank {
        displayName = $STR_SAD_kitRiflemanAntiTank;
        icon = "\a3\characters_f\data\ui\icon_expl_specialist_ca.paa";
        weapons[] = {
            "rhs_m4_compm4",
            "rhs_weap_M136",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ESS_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp";
    };

    class RiflemanAntiTankAlternative: RiflemanAntiTank {
        displayName = $STR_SAD_kitRiflemanAntiTankAlternative;
        weapons[] = {
            "rhs_m4a1_grip_acog3",
            "rhs_weap_M136",
            "Throw",
            "Put"
        };
    };

    class Engineer {
        displayName = $STR_SAD_kitEngineer;
        icon = "\a3\characters_f\data\ui\icon_repair_ca.paa";
        weapons[] = {
            "rhs_m4_compm4",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "HandGrenade",
            "HandGrenade",
            "DemoCharge_Remote_Mag",
            "DemoCharge_Remote_Mag"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_Clacker",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_repair",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp_engineer";
    };

    class EngineerAlternative: Engineer {
        displayName = $STR_SAD_kitEngineerAlternative;
        weapons[] = {
            "rhs_m4a1_grip_acog3_usmc",
            "Throw",
            "Put"
        };
    };

    class Marksman {
        displayName = $STR_SAD_kitMarksman;
        icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
        weapons[] = {
            "rhs_weap_m14ebrri_leu",
            "Throw",
            "Put",
            "Rangefinder"
        };
        magazines[] = {
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhsusf_20Rnd_762x51_m118_special_Mag",
            "rhs_mag_m67"
        };
        items[] = {
            "ACE_morphine",
            "ACE_morphine",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_fieldDressing",
            "ACE_IR_Strobe_Item",
            "ACE_EarPlugs",
            "ACE_NVG_Gen1",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie",
            "ACE_CableTie"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "";
    };

    class MarksmanAlternative: Marksman {
        displayName = $STR_SAD_kitMarksmanAlternative;
        weapons[] = {
            "rhs_weap_sr25_usmc",
            "Throw",
            "Put",
            "Rangefinder"
        };
    };

    class Pilot {
        displayName = $STR_SAD_kitPilot;
        icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getinpilot_ca.paa";
        weapons[] = {
            "rhsusf_weap_m1911a1",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhsusf_mag_7x45acp_MHP",
            "rhsusf_mag_7x45acp_MHP",
            "rhsusf_mag_7x45acp_MHP",
            "SmokeShellRed"
        };
        items[] = {
          "ACE_morphine",
          "ACE_morphine",
          "ACE_fieldDressing",
          "ACE_fieldDressing",
          "ACE_fieldDressing",
          "ACE_IR_Strobe_Item",
          "ACE_EarPlugs",
          "ACE_NVG_Gen1",
        };
        linkedItems[] = {
            "V_TacVest_blk",
            "H_PilotHelmetHeli_B",
            "ItemMap",
            "ItemGPS",
            "ItemCompass",
            "ItemWatch",
            "tf_rf7800str"
        };
        uniformClass = "U_B_HeliPilotCoveralls";
        backpack = "";
    };

    class PilotAlternative: Pilot {
        displayName = $STR_SAD_kitPilotAlternative;
        weapons[] = {
            "rhs_weap_m4",
            "Throw",
            "Put"
        };
        magazines[] = {
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "SmokeShellRed"
        };
    };
};
