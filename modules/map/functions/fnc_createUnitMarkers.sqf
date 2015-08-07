/**
 *
 */

private["_unit", "_units", "_side", "_unitName", "_marker"];

_unit = (_this select 0);
_units = allUnits;
_side = side _unit;

{
    _marker = createMarkerLocal [_marker, position _x;
    _marker setMarkerShapeLocal "Icon";
    _marker setMarkerTypeLocal "mil_dot";
    _marker setmarkerDirLocal (getDir _x);

    if(side _x == _side) then {
        _marker setMarkerColorLocal "ColorWEST";
    } else {
        _marker setMarkerColorLocal "ColorEAST";
    };
} foreach _units;

while {alive _unit} do {
    {
        _marker setMarkerPosLocal (position _x);
        _marker setMarkerDirLocal (getDir _x);
    } foreach _units;

    uiSleep 0.2;
};
