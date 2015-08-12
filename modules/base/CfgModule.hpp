/*
 * Author: r4vn
 *
 * Description:
 * This is the module configuration for the base module and is accessible via
 * the MCFG macro.
 */

class CfgBase {
    markerName = "west_base";

    class Supplies {
        class CargoNet {
            weapons[] = {
                {"rhs_weap_m16a4_grip_compm4", 3},
                {"rhs_weap_m16a4_grip_compm4", 3},
                {"rhs_weap_m249_pip_elcan", 1},
                {"rhs_weap_M136", 3},
                {"Laserdesignator", 1},
                {"Rangefinder", 1};
            };
            magazines[] = {
                {"rhs_mag_30Rnd_556x45_M855A1_Stanag", 30},
                {"rhsusf_100Rnd_556x45_soft_pouch", 6},
                {"Laserbatteries", 2},
                {"HandGrenade", 10},
                {"SmokeShell", 20},
                {"SmokeShellPurple", 10},
                {"DemoCharge_Remote_Mag", 6};
            };
            items[] = {
                {"ACE_Clacker", 2},
                {"ACE_fieldDressing", 20},
                {"ACE_morphine", 20},
                {"ACE_epinephrine", 20},
                {"ToolKit", 2};
            };
        };

        class SupplyCrate {
            weapons[] = {
                {"rhs_weap_m16a4_grip_compm4", 2},
                {"rhs_weap_m16a4_grip_compm4", 0},
                {"rhs_weap_m249_pip_elcan", 0},
                {"rhs_weap_M136", 2},
                {"Laserdesignator", 1},
                {"Rangefinder", 1};
            };
            magazines[] = {
                {"rhs_mag_30Rnd_556x45_M855A1_Stanag", 10},
                {"rhsusf_100Rnd_556x45_soft_pouch", 5},
                {"Laserbatteries", 2},
                {"HandGrenade", 5},
                {"SmokeShell", 5},
                {"SmokeShellPurple", 3},
                {"DemoCharge_Remote_Mag", 2};
            };
            items[] = {
                {"ACE_Clacker", 2},
                {"ACE_fieldDressing", 10},
                {"ACE_morphine", 8},
                {"ACE_epinephrine", 8},
                {"ToolKit", 2};
            };
        };
    };
};
