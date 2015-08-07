/**
 *
 */

#include "script_macros.hpp"

private [
    "_return",
    "_newCachePosition",
    "_cachePosition",
    "_distance",
    "_cachesCount",
    "_minSpacing"
];

_newCachePosition = _this select 0;

_minSpacing = getNumber (MCFG >> "minSpacing");
_cachesCount = count SAD_caches;

_return = false;

for "_i" from 0 to _cachesCount - 1 do {
    _cachePosition = position (SAD_caches select _i);
    _distance = _cachePosition distance _newCachePosition;

    if (_distance < _minSpacing) exitWith {_return;};
};

_return = true;

_return;
