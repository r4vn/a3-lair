/*
 * Author: r4vn
 *
 * Description:
 * Creates random ieds on roads near given cache.
 *
 * Parameter(s):
 *     0: <object> A cache which should be mined
 */

#include "..\script_component.hpp"

private [
    "_position",
    "_cache",
    "_minIedCount",
    "_maxIedCount",
    "_radius",
    "_iedCount",
    "_roads",
    "_road",
    "_fakeProbility",
    "_fakeIedCount",
    "_isFake"
];

_cache = _this select 0;

// Get minimum and maximum values for ied count
_minIedCount = getNumber (MCFG >> "minIedCount");
_maxIedCount = getNumber (MCFG >> "maxIedCount");
// Get spawn radius
_radius = getNumber (MCFG >> "radius");
// Get probability for a fake ied
_fakeProbility = getNumber (MCFG >> "_fakeProbility");

// Randomize ied count
_iedCount = (random _maxIedCount) + 1;

// Set lower ied count limit if it is lower
if (_iedCount < _minIedCount) then {
    _iedCount = _minIedCount;
};

// Calculate fake ied count
_fakeIedCount = floor (_fakeProbility * _iedCount);

// Get nearby roads
_roads = (getPos _cache) nearRoads _radius;

// Loop ieds
for "_i" from 0 to _iedCount - 1 do {
    // Get a random road segment in radius
    _road = _roads call BIS_fnc_selectRandom;

    DEBUG_r = _road;

    // Set if current ied is a fake
    if (_i <= _fakeIedCount) then {
        _isFake = true;
    } else {
        _isFake = false;
    };

    // Create ied
    [getPos _road, _isFake] call FUNC("createIed");
};
