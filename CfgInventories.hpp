class CfgRespawnInventory {
    class SQL {
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
            "ACE_personalAidKit"
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

    class RFM {
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
            "ACE_personalAidKit"
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

    class LMG {
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
            "ACE_personalAidKit"
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

    class MED {
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
            "ACE_personalAidKit"
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

    class LAT {
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
            "ACE_personalAidKit"
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

    class ENG {
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
            "ACE_personalAidKit",
            "ACE_Clacker"
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

    class MAR {
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
            "ACE_personalAidKit"
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

    class PLT {
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
            "ACE_personalAidKit"
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
};
