/*
 * Author: r4vn
 *
 * Description:
 * This configuration holds all mission parameters. An inner class of Params
 * is a single mission parameter.
 */

class Params
{
    #ifndef WEATHER_DEFAULT
        #define WEATHER_DEFAULT 25
    #endif

    #ifndef DAYTIMEPERIOD_DEFAULT
        #define DAYTIMEPERIOD_DEFAULT   12
    #endif

    class Weather {
        title = $STR_A3_rscattributeovercast_title;
        values[] = {0,25,50,75,100};
        texts[] = {
            $STR_A3_rscattributeovercast_value000_tooltip,
            $STR_A3_rscattributeovercast_value025_tooltip,
            $STR_A3_rscattributeovercast_value050_tooltip,
            $STR_A3_rscattributeovercast_value075_tooltip,
            $STR_A3_rscattributeovercast_value100_tooltip
        };
        default = WEATHER_DEFAULT;
        function = "BIS_fnc_paramWeather";
    };

    class Daytime {
        title = $STR_A3_paramDaytimePeriod_title;
        values[] = {6,12,18,0};
        texts[] = {
            $STR_A3_paramDaytimePeriod_text1,
            $STR_A3_paramDaytimePeriod_text2,
            $STR_A3_paramDaytimePeriod_text3,
            $STR_A3_paramDaytimePeriod_text4
        };
        default = DAYTIMEPERIOD_DEFAULT;
        function = "BIS_fnc_paramDaytime";
    };

    class NeededCaches {
        title = $STR_SAD_neededCaches;
        values[] = {2, 4, 5, 6};
        default = 6;
    };

    class MaxCacheGroups {
        title = $STR_SAD_maxCacheGroups;
        values[] = {3, 5, 7, 9};
        default = 5;
    };
};
