class Header {
    gameType = Coop;
    minPlayers = 2;
    maxPlayers = 8;
};

respawn = 3;

respawnDelay = ("RespawnDelay" call BIS_fnc_getParamValue);
respawnTemplatesWest[] = {
    "MenuInventory",
    "MenuPosition"
};

respawnVehicleDelay = ("RespawnVehicleDelay" call BIS_fnc_getParamValue);
wreckManagerMode = 2;

showHUD = 1;
showGroupIndicator = 1;
disabledAI = 1;

ace_hearing_EnableCombatDeafness = 1;
ace_hearing_EarplugsVolume = 0.9;
ace_hearing_UnconsciousnessVolume = 0.7;
ace_hearing_DisableEarRinging = 1;
