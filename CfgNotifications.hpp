/*
 * Author: r4vn
 *
 * Description:
 * All custom notification templates are defined in this configuration
 * file. Each inner class of CfgNotifications represents a single template.
 */

class CfgNotifications {
    class VehicleRespawn {
        title = $STR_SAD_vehicleRespawn;
        iconPicture = "\a3\ui_f\data\gui\cfg\Hints\vehiclegui_ca.paa";
        description = "%1";
        duration = 3;
        priority = 0;
    };

    class Rally {
        title = $STR_SAD_rallyNote;
        iconPicture = "\a3\ui_f\data\gui\cfg\Hints\waypoint_ca.paa";
        description = "%1";
        duration = 3;
        priority = 0;
    };
};
