/*
  SHK_pos - Random position generator for Arma 2
  Author: Shuko (IRC: shuko@quakenet, Email: miika@miikajarvinen.fi)
  Version: 0.1
  
  Parameters for marker area based position:
    Area              String              Marker to define area from which the position is taken.
    Water             Boolean             Allow position on water? Optional, default is false.
  
  Usage examples:
    myPos = ["markerName"] execvm "SHK_pos.sqf";
    myPos = ["myMarker1",true] execvm "SHK_pos.sqf";
    
  Parameters for relative position:
    Point of Origin   Position array      The position from which direction and distance is calculated from.
    Direction         Number              Compass direction (0-359) from Point of Origin.
                      Array               Array can be used to give minimum and maximum directions.
    Distance          Number              Distance in meters from Point of Origin.
                      Array               Array can be used to give minimum and maximum distance.
    Water             Boolean             Allow position on water? Optional, default is false.
    Water solution    Integer             Water positions not allowed, what to do?
      0: Do nothing, do not return any position. An empty array is returned.
      1: Find closest land. Search is done with increasing radius until land is found, thus the resulting
         position might not be exactly in the given direction and distance.
      2: Decrease distance until land is found. Direction is kept the same.
      3: Increase distance until land is found. Direction is kept the same.
      4: Decrease direction (counter clock-wise) until land is found. Distance is kept the same.
      5: Increase direction (clock-wise) until land is found. Distance is kept the same.
      
      If no integer is given, solution 1 is used by default.
  
  Usage examples:
    myPos = [getpos player,random 360,200,true] execvm "SHK_pos.sqf";
    myPos = [getmarkerpos "myMarker",125,random 500] execvm "SHK_pos.sqf";
    myPos = [getpos player,random 360,[200,500],false,2] execvm "SHK_pos.sqf";
  
  Example of creating multiple positions:
    SHK_pos = compile preprocessfile "SHK_pos.sqf";
    for "_i" from 0 to 500 do {
      _p = [getpos player,random 360,random 1000] call SHK_pos;
      if (count _p > 0) then {
        call compile format ["
        _m%1 = createMarker[""mySpot%1"",[_p select 0,_p select 1]];
        _m%1 setMarkerShape ""ICON"";
        _m%1 setMarkerType ""DOT"";
        _m%1 setmarkercolor ""colorred"";
      ",_i];
      };
    };
*/
private "_getpos";
_getpos = {
  private ["_origo","_dir","_dist"];
  _origo = _this select 0;
  _dir = _this select 1;
  _dist = _this select 2;
  if (typename _dir == typename []) then {
    if ((_dir select 0) > (_dir select 1)) then { _dir set [1,((_dir select 1) + 360)] };
    _dir = ((_dir select 0) + random((_dir select 1)-(_dir select 0)))
  };
  if (typename _dist == typename []) then {
    _dist = ((_dist select 0) + random((_dist select 1)-(_dist select 0)));
  };
  [((_origo select 0) + (_dist * sin _dir)),((_origo select 1) + (_dist * cos _dir)),0];
};

private "_water";
if (typename (_this select 0) == typename "") then {
  private ["_pos","_area","_cp","_cx","_cy","_as","_rx","_ry","_ad","_cd","_sd","_xo","_yo","_loop"];
  _area = _this select 0;
  if (count _this > 1) then {_water = _this select 1} else {_water = false};
  _cp = getMarkerPos _area;
  _cx = abs(_cp select 0);
  _cy = abs(_cp select 1);
  _as = getMarkerSize _area;
  _rx = _as select 0;
  _ry = _as select 1;
  _ad = (markerDir _area) * -1;
  _cd = cos _ad;
  _sd = sin _ad;
  _loop = true;
  while {_loop} do {
    _tx = (random (_rx*2))-_rx;
    _ty = (random (_ry*2))-_ry;
    _xo = if (_ad!=0) then {_cx+ (_cd*_tx - _sd*_ty)} else {_cx+_tx};
    _yo = if (_ad!=0) then {_cy+ (_sd*_tx + _cd*_ty)} else {_cy+_ty};
    _pos = [_xo,_yo,0];
    if (_water) then {
      _loop = false;
    } else {
      if (!surfaceIsWater [_pos select 0,_pos select 1]) then {_loop = false};
    };
  };
  _pos
} else {
  private ["_origo","_dir","_dist","_pos","_loop","_watersolution"];
  _origo = _this select 0;
  _dir = _this select 1;
  _dist = _this select 2;
  if (count _this > 3) then {_water = _this select 3} else {_water = false};
  if (count _this > 4) then {_watersolution = _this select 4} else {_watersolution = 1};
  _pos = [_origo,_dir,_dist] call _getpos;
  if (!_water) then {
    private ["_d","_l","_p"];
    _l = true;
    switch _watersolution do {
      case 0: {
        if (surfaceIsWater [_pos select 0,_pos select 1]) then {
          _pos = +[];
        };
      };
      case 1: {
        _d = 10; _l = true;
        while {_l} do {
          for "_i" from 0 to 350 do {
            _p = [_pos,_i,_d] call _getpos;
            if (!surfaceIsWater [_p select 0,_p select 1]) exitwith {_l = false};
          };
          _d = _d + 10;
        };
        _pos = _p;
      };
      case 2: {
        _d = _pos distance _origo;
        while {_d = _d - 10; _l} do {
          _pos = [_pos,_dir,_d] call _getpos;
          if (!surfaceIsWater [_pos select 0,_pos select 1]) then {_l = false};
          if (_d < 10) then {_l = false; _pos = + []};
        };
      };
      case 3: {
        _d = _pos distance _origo;
        while {_d = _d + 10; _l} do {
          _pos = [_pos,_dir,_d] call _getpos;
          if (!surfaceIsWater [_pos select 0,_pos select 1]) then {_l = false};
          if (_d > 10000) then {_l = false; _pos = + []};
        };
      };
      case 4: {
        if (typename _dir == typename []) then {
          _d = _dir select 0;
          _dir = _dir select 0;
        } else {
          _d = _dir;
        };
        while {_l} do {
          _p = [_pos,_d,_dist] call _getpos;
          if (!surfaceIsWater [_p select 0,_p select 1]) exitwith {_l = false};
          if (_d < (_dir - 360)) then {_l = false};
          _d = _d - 10;
        };
        _pos = _p;
      };
      case 5: {
        if (typename _dir == typename []) then {
          _d = _dir select 1;
          _dir = _dir select 1;
        } else {
          _d = _dir;
        };
        while {_l} do {
          _p = [_pos,_d,_dist] call _getpos;
          if (!surfaceIsWater [_p select 0,_p select 1]) exitwith {_l = false};
          if (_d > (_dir + 360)) then {_l = false};
          _d = _d + 10;
        };
        _pos = _p;
      };
    };
  };
  _pos
};