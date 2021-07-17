//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_FlashMarker       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_marker","_typ","_size","_pos","_dir","_np","_i","_a","_ns","_zone","_run","_flag","_alogic","_action",
			"_s","_sp","_m","_point","_pp","_ps","_pt","_rnd","_unit","_xTime","_pos","_sum","_go","_zoneside"
		];

			_marker = ((_this select 0) select 0);_typ = _this select 1;_run = true;_sum = 0;_unit = objNull;_sp = [];_pos = [];_dir = 0;_ns = 0;_flag = "";_alogic = "";
			_zone = objNull;_i = 0;_np = [];_size = 0;_a = 0;_zoneside = 0;_action = true;_s = 0;_m = "";_point = "";_xTime = 0;_go = 0;_pp = 0;_ps = 0;_pt = 0;_rnd = 0;
			
if(count _this > 2) then {_unit = _this select 2};

sleep 1;

if(isDedicated) exitwith {};
		
switch (_typ) do
{
	case 0:	{
				_i = 0;_xTime = time + 8;
				while {time < _xTime} do
				{
					if(_i > 360) then {_i = 0};
					_marker setmarkerdirlocal _i;
					if(alive _unit) then {_marker setMarkerPoslocal (position _unit)};
					sleep 0.05;
					_i = _i + 10;
				};
				deletemarker _marker;
			};
	case 1:	{
				//disabled;
			};
	case 2:	{
				_pos = getmarkerpos _marker;_dir = _this select 2;_flag = _this select 4;
				_size = ((getmarkersize _marker) select 0);_i = 0;_go = 1;
				_a = 15;_steps = (_size / _a);_s = 0;_ns = 0;_np = [0,0];_rnd = random 999;
				_sp = [(_pos select 0) - (Sin (_dir) * _size),(_pos select 1) - (Cos (_dir) * _size),0];
				_marker setMarkerPoslocal _np;_pp = _this select 3;_ps = (((getmarkersize _marker) select 1) * 20);
				_marker setMarkerSizelocal [1,((getmarkersize _marker) select 1)];_pt = _ps / _a;
				_m = format["_p%1",_rnd];_point = createmarkerlocal [_m, _pp];_point setMarkerShapelocal "ELLIPSE";
				_point setMarkerSizelocal [0,0];_point setMarkerColorlocal "ColorBlack";
				while {_go > 0} do
				{
					sleep 0.05;
					if(format["%1",_flag] == "<NULL-object>") then
					{
						_go = 0;
					}
					else
					{
						if(_i == 0) then
						{
							_s = _s + 1;_ns = _s * _steps;
							_np = [(_sp select 0) + (Sin (_dir) *_ns),(_sp select 1) + (Cos (_dir) * _ns),0];
							_marker setMarkerPoslocal _np;
							_marker setMarkerSizelocal [_ns,((getmarkersize _marker) select 1)];
							if(_s >= _a) then {_i = 1;_point setMarkerSizelocal [(_pt * _s),(_pt * _s)]};
						}
						else
						{
							_s = _s - 1;_ns = _s * _steps;
							_np = [(_sp select 0) + (Sin (_dir) *_ns),(_sp select 1) + (Cos (_dir) * _ns),0];
							_marker setMarkerPoslocal _np;_point setMarkerSizelocal [(_pt * _s),(_pt * _s)];
							_marker setMarkerSizelocal [_ns,((getmarkersize _marker) select 1)];
							if(_s <= 0) then {_s = 0;_i = 0};
						};
					};
				};
				deletemarker _marker;deletemarker _point;
			};
	case 4:	{
				_i = 0;_xTime = time + 15;
				while {time < _xTime} do
				{
					if(_i > 360) then {_i = 0};
					_marker setmarkerdirlocal _i;
					sleep 0.05;
					_i = _i + 10;
				};
				deletemarker _marker;
			};
	case 5:	{
				if(!(format["%1",(_this select 2)] == "<null>")) then
				{
					sleep 1;
					_m = _this select 2;_zoneside = _this select 3;_i = 0;
					_marker = _this select 0;_s = getMarkerColor (_marker select 0);
					while {_action} do
					{
						if(((getMarkerSize _m) select 0) <= 4) then
						{
							if(((getMarkerSize _m) select 0) == 4) then
							{
								if((getMarkerColor (_marker select 0)) != "ColorBlack") then {{_x setMarkerColor "ColorBlack"} foreach _marker};
							}
							else
							{
								{deletemarker _x} foreach _marker;_action = false;
							};
						}
						else
						{
							_sp = 0;if(count _marker < 4) then {_sp = 1} else {_sp = 4};
							if(_zoneside == 4) then
							{
								while {_i < _sp} do
								{
									(_marker select _i) setMarkerColor ((DAC_Marker_Val select 14) select _i);_i = _i + 1;
								};
							}
							else
							{
								if((getMarkerColor (_marker select 0)) != _s) then {{_x setMarkerColor _s} foreach _marker};
							};
						};
						sleep (1 + (random 0.5));
					};
				};
			};
	case 6:	{
				_marker = _this select 0;_zone = _this select 2;
				_pos = position _zone;_i = 0;_np = [];_sp = _this select 3;
				while {time > 0} do
				{
					if(format["%1",(triggertext _zone)] != "action") then
					{
						sleep (1 + (random 0.5));
					}
					else
					{
						[_marker,_zone,_sp] spawn DAC_fResizeMarker;
						sleep 1;
						waituntil {(format["%1",(triggertext _zone)] == "stop")};
						_pos = position _zone;
						((_this select 3) select 0) setmarkerpos _pos;
					};
				};
			};
	case 7:	{
				_marker = ((_this select 0) select 0);_point = ((_this select 0) select 1);_dir = 0;
				_unit = ((_this select 0) select 2);_alogic = ((_this select 0) select 3);_ns = _this select 3;_pos = _this select 2;
				while{alive _alogic} do
				{
					_np = [(_pos select 0) + (Sin (_dir) * (_ns + 3)),(_pos select 1) + (Cos (_dir) * (_ns + 3)),0];
					_marker setMarkerPoslocal _np;_marker setMarkerDirlocal _dir;
					sleep 0.03;
					_dir = _dir + 10;
				};
				deletemarker _marker;
				_i = ((getMarkerSize _point) select 0);
				while{_i > 0} do
				{
					_i = _i - 1;
					_point setMarkerSize [_i,_i];
					sleep 0.03;
				};
				deletemarker _point;
			};
	case 8:	{
				_i = 0;_xTime = time + 5;
				while {time < _xTime} do
				{
					if(_i > 360) then {_i = 0};
					_marker setmarkerdirlocal _i;
					sleep 0.05;
					_i = _i + 10;
				};
				deletemarker _marker;
			};
	Default {};
};
