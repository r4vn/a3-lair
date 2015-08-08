/**
 *
 */

#include "script_macros.hpp"

private [
    "_mapSize",
    "_cachePosition",
    "_distance",
    "_cachesCount",
    "_minSpacing"
];

_cachePosition = _this select 0;

_mapSize = getNumber (MCFG >> "Map" >> "size");
_minSpacing = getNumber (MCFG >> "minSpacing");
_cachesCount = count SAD_caches;

if (_cachePosition select 0 > _mapSize - _minSpacing ||
        _cachePosition select 0 < _minSpacing ||
        _cachePosition select 1 > _mapSize - _minSpacing ||
        _cachePosition select 1 < _minSpacing) exitWith {
    false;
};

for "_i" from 0 to _cachesCount - 1 do {
    _distance = (SAD_caches select _i) distance _cachePosition;

    if (_distance < _minSpacing) exitWith {
        false;
    };
};

true;
