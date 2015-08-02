class CfgRespawnInventory
{
    class SQL
    {
        displayName = "Officer";
        icon = "\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa";
        weapons[] = {
            "rhs_weap_m16a4_grip_compm4",
            "rhsusf_weap_m1911a1",
            "Throw",
            "Put",
            "Binocular"
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
            "SmokeShellPurple",
            "SmokeShellPurple"
        };
        items[] = {
            "FirstAidKit"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_squadleader",
            "rhsusf_ach_helmet_headset_ucp",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "B_AssaultPack_mcamo";
    };
    class RFM
    {
        displayName = "Rifleman";
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
            "SmokeShell",
            "SmokeShell"
        };
        items[] = {
            "FirstAidKit"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp";
    };
    class MED
    {
        displayName = "Medic";
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
            "FirstAidKit"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_medic",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp_medic";
    };
    class LAT
    {
        displayName = "Rifleman Anti Tank";
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
            "rhs_mag_30Rnd_556x45_M855A1_Stanag",
            "rhs_m136_mag"
        };
        items[] = {
            "FirstAidKit"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ESS_ucp",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp_at";
    };
    class ENG
    {
        displayName = "Engineer";
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
            "APERSMine_Range_Mag",
            "APERSMine_Range_Mag"
        };
        items[] = {
            "FirstAidKit"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_repair",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "rhsusf_assault_eagleaiii_ucp_engineer";
    };
    class MAM
    {
        displayName = "Marksman";
        icon = "\a3\ui_f\data\IGUI\Cfg\Actions\getingunner_ca.paa";
        weapons[] = {
            "rhs_weap_m14ebrri_leu",
            "Throw",
            "Put",
            "Binocular"
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
            "FirstAidKit"
        };
        linkedItems[] = {
            "rhsusf_iotv_ucp_rifleman",
            "rhsusf_ach_helmet_ucp",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "rhs_uniform_cu_ucp";
        backpack = "";
    };
    class PLT
    {
        displayName = "Pilot";
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
            "FirstAidKit"
        };
        linkedItems[] = {
            "V_TacVest_blk",
            "H_PilotHelmetHeli_B",
            "ItemMap",
            "ItemCompass",
            "ItemWatch",
            "ItemRadio"
        };
        uniformClass = "U_B_HeliPilotCoveralls";
        backpack = "";
    };
};
