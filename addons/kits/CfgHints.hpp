/*
 * Author: r4vn
 *
 * Description:
 * All custom hint templates are defined in this configuration
 * file. Each inner class of CfgHints represents a single template.
 */

class CfgHints {
    class KitSystem
    {
        displayName = $str_lair_kitSystem;

        class OperatingAircrafts {
            displayName = $str_lair_operatingAircrafts;
            description = $str_lair_pilotKitNeeded;
            tip = $str_lair_requestKits;
            image = "\a3\ui_f\data\gui\cfg\Hints\takeoff_ca";
            noImage = false;
        };
    };
};
