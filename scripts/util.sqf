SAD_fnc_randomizePosition = {
    private  ["_position", "_minOffset", "_maxOffset", "_offsetX", "_offsetY"];

    _position = _this select 0;
    _minOffset = _this select 1;
    _maxOffset = _this select 2;

    _offsetX = _minOffset + _maxOffset - random 2 * _maxOffset;
    _offsetY = _minOffset + _maxOffset - random 2 * _maxOffset;

    _position set [0, (_position select 0) + _offsetX];
    _position set [1, (_position select 1) + _offsetY];

    _position;
};
