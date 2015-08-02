SAD_fnc_randomizePosition2D = {
    private  ["_originalPosition", "_newPosition", "_minOffset", "_maxOffset",
            "_offsetX", "_offsetY"];

    _originalPosition = _this select 0;
    _minOffset = _this select 1;
    _maxOffset = _this select 2;

    _newPosition = _originalPosition;

    while {(_originalPosition distance _newPosition) < _minOffset} do {
        _offsetX = _maxOffset - random 2 * _maxOffset;
        _offsetY = _maxOffset - random 2 * _maxOffset;

        _newPosition = [
            (_originalPosition select 0) + _offsetX,
            (_originalPosition select 1) + _offsetY
        ];
    };

    _newPosition;
};
