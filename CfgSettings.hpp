/*
 * Author: r4vn
 *
 * Description:
 * Common settings for the mission are defined in this configuration file.
 */

class Header {
    gameType = Coop;
    minPlayers = 2;
    maxPlayers = 8;
};

respawn = 3;
respawnOnStart = 1;

respawnDelay = 15;
respawnTemplatesWest[] = {
    "MenuInventory",
    "MenuPosition"
};

respawnVehicleDelay = 60;
wreckManagerMode = 2;

showHUD = 1;
showGroupIndicator = 1;
disabledAI = 1;
