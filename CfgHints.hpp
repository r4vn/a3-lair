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
        displayName = $STR_SAD_kitSystem;

        class OperatingAircrafts {
            displayName = $STR_SAD_operatingAircrafts;
            description = $STR_SAD_pilotKitNeeded;
            tip = $STR_SAD_requestKits;
            image = "\a3\ui_f\data\gui\cfg\Hints\takeoff_ca";
            noImage = false;
        };
    };
};
