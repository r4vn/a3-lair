/*
 * Author: r4vn
 *
 * Description:
 * This is the module configuration for the tickets module and is accessible via
 * the MCFG macro.
 */

class CfgTickets {
    bluforTicketCount = 120;
    ticketBleed = 2;
    ticketLossUnitKilled = 2;
    ticketLossVehicleDestruction = 5;
    ticketLossCivilianKilled = 15;
    ticketWinCacheDestruction = 20;
};

class RscTitles {
    class MissionHud {
        idd = 1000;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 240 * 60;
        fadeIn = 0;
        fadeOut = 0;
        onLoad = "SAD_tickets_missionHud = _this;";

        class controls {
            #define INDICATOR_WIDTH 0.058
            #define INDICATOR_HEIGHT 0.05
            #define MARGIN 0.025
            #define PADDING 0.015
            #define POS_X (safeZoneX + safeZoneW - INDICATOR_WIDTH - MARGIN)
            #define POS_Y(n) (safeZoneY + (safeZoneH / 3) + n * \
                    INDICATOR_HEIGHT + (n - 1) * PADDING)
            #define FONT "PuristaBold"

            class BluforTicketsIndicator {
                idc = 1101;
                type = 0;
                style = 114;
                x = POS_X;
                y = POS_Y(1);
                w = INDICATOR_WIDTH;
                h = INDICATOR_HEIGHT;
                font = FONT;
                sizeEx = 0.03;
                colorText[] = {255, 255, 255, 1};
                colorBackground[] = {0, 0, 255, 0.5};
                text = "---";
            };

            class InsurgentCacheIndicator {
                idc = 1100;
                type = 0;
                style = 114;
                x = POS_X;
                y = POS_Y(2);
                w = INDICATOR_WIDTH;
                h = INDICATOR_HEIGHT;
                font = FONT;
                sizeEx = 0.03;
                colorText[] = {255, 255, 255, 1};
                colorBackground[] = {255, 0, 0, 0.5};
                text = "---";
            };
        };
    };
};
