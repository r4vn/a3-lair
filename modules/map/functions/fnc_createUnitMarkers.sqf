/*
 * Author: r4vn
 *
 * Description:
 * Creates unit markers on the map for blufor units. The own marker is
 * highlighted by a different color.
 *
 * Note: Since this a computation heavy task and runs during the whole time the
 * player is alive, it needs to be executed in its own VM.
 */

#include "script_macros.hpp"

private[
    "_units",
    "_side",
    "_name",
    "_marker"
];

// Get the name and side of player
_name = name player;
_side = side player;
_debug = true;

// Keep creating/updating/deleting unit markers as long as player is alive
while {alive player} do {
    // Loop all alive units on the battlefield
    {
        // Set the marker name to the unit's name
        _marker = name _x;

        // Check if the unit is blufor and has a marker
        if ((_side == side _x || _debug) && getMarkerColor _marker == "") then {
            // Create marker since its not present and set its appearance
            _marker = createMarkerLocal [name _x, getPos _x];
            _marker setMarkerShapeLocal "Icon";
            _marker setMarkerTypeLocal "mil_triangle_noShadow";
            _marker setMarkerDirLocal (getDir _x);

            if(name _x == _name) then {
                // If its the player's marker use a different color
                _marker setMarkerColorLocal "ColorYellow";
            } else {
                // Otherwise use the sandard blufor color
                _marker setMarkerColorLocal "ColorWEST";

                if (_debug && side _x == civilian) then {
                    _marker setMarkerColorLocal "ColorCIV";
                };

                if (_debug && (side _x == east ||
                        side _x == independent)) then {
                    _marker setMarkerColorLocal "ColorEAST";
                };
            };

            // Add event handler for marker removal on unit death
            _x addEventHandler ["Killed", {
                deleteMarkerLocal (name (_this select 0));
            }];
        };

        if (getMarkerColor _marker != "") then {
            // Update marker position and direction for the current unit
            _marker setMarkerPosLocal (getPos _x);
            _marker setMarkerDirLocal (getDir _x);
        };
    } forEach allUnits;

    // After updating all markers wait for a specific period of time before
    // updating again
    uiSleep 0.2;
};
