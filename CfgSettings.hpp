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
corpseManagerMode = 1;
corpseLimit = 15;
corpseRemovalMinTime = 300;
corpseRemovalMaxTime = 300;

respawnVehicleDelay = 300;
wreckManagerMode = 1;
wreckLimit = 15;
wreckRemovalMinTime = 300;
wreckRemovalMaxTime = 300;

showHUD = 1;
showGroupIndicator = 1;
disabledAI = 1;
