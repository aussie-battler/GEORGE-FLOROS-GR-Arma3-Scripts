//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Create_Camp       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_build","_camp","_flag","_fire","_objarray","_vegArray","_wallArray","_VEG",
			"_t","_h","_rc","_VEGCount","_bu","_gc","_posX","_posY","_r","_d","_p","_tempVEG",
			"_run","_c","_wallTyp","_sizeX","_startPos","_tempWall","_segm","_sega","_i","_TO",
			"_wallHeight","_wallDir","_wallHole","_wallPara","_a","_storeArray","_s","_ammoArray",
			"_m","_ma","_mr","_campSet","_scrObj","_scrWall","_treArray","_dd"
		];

			_run = true;_sizeX = 0;_build = _this select 0;_camp = _this select 1;_flag = _this select 2;
			_objarray = _this select 3;_a = 0;_vegArray = _this select 4;_wallArray = _this select 5;_tempVEG = "";
			_storeArray = _this select 6;_VEGCount = 0;_bu = [];_gc = 0;_h = 0;_i = 1;_startpos = position player;
			_ammoArray = _this select 7;_fire = _this select 8;_scrObj = _this select 9;_scrWall = _this select 10;
			_bu = _ammoarray + _objarray;_m = "";_ma = "";_mr = [];_campSet = [];_treArray = [];_dd = 0;

if(DAC_Marker > 0) then
{
	if((DAC_Marker_Val select 13) > 0) then
	{
		{
			_m = format["_c%1%2%3",_x,(((position _x) select 0)+((position _x) select 1)),time];_ma = createmarkerlocal [_m, position _x];
			_ma setMarkerShapelocal "RECTANGLE";
			if((format["%1",typeof _x]) == "LOGIC") then
			{
				_ma setMarkerSizelocal [2,2];
				_ma setMarkerDirlocal 45;_ma setMarkerColorlocal "ColorBlue";
				_mr set [count _mr,_ma];
			}
			else
			{
				_ma setMarkerSizelocal [((boundingBox _x select 1) select 0),((boundingBox _x select 1) select 1)];
				_ma setMarkerDirlocal direction _x;_ma setMarkerColorlocal "ColorBlue";
				_mr set [count _mr,_ma];
			};
		}	foreach _bu;
	};
};

if(((count _vegArray) == 0) && ((count _wallArray) == 0)) then
{
	_campSet = [_storeArray,_mr];
	_campSet;
}
else
{
	while {count _vegArray > 0} do
	{
		_rc = (_vegArray select 2);_dd = (_vegArray select 4);
		if(_rc == 0) then {_VEGCount  = random (_vegArray select 1)} else {_VEGCount = (_vegArray select 1)};
		while {_gc <= _VEGCount} do
		{
			_rb = _bu select (random ((count _bu) - 1));
			if((format["%1",typeof _rb]) != "LOGIC") then
			{
				_posX = position _rb select 0;_posY = position _rb select 1;_run = true;
				_VEG = (_vegArray select 0) select (random ((count (_vegArray select 0)) - 1));
				while {_run} do
				{
					_t = _VEG select 2;
					if(_t > 0) then
					{
						_c = random 100;
						if(_c <= _t) then
						{
							_r = random 360;_d = random (_vegArray select 3);
							_p = [_posX + (Sin (_r) * _d),_posY + (Cos (_r) * _d),0];
							if(({((_p distance (position _x)) < _dd)} count _bu) == 0) then
							{
								_tempVEG = (_VEG select 0) createvehicle _p;
								if((_VEG select 1) > 0) then
								{
									_tempVEG setpos [
														(position _tempVEG select 0),
														(position _tempVEG select 1),
														(position _tempVEG select 2) - (random (_VEG select 1))
													]
								};
								_tempVEG setdir (random 360);
								_tempVEG setTargetAge "UNKNOWN";
								if(count _scrObj > 0) then {_treArray set [count _treArray,_tempVEG]};
								_gc = _gc + 1;_run = false;
								if((getdir DAC_StartDummy) > 170) then {sleep 0.01};
								if(DAC_Marker > 0) then
								{
									if((DAC_Marker_Val select 13) > 1) then
									{
										_m = format["t%1",_tempVEG];_ma = createmarkerlocal [_m, position _tempVEG];
										_ma setMarkerShapelocal "RECTANGLE";_ma setMarkerSizelocal [((boundingBox _tempVEG select 1) select 0),((boundingBox _tempVEG select 1) select 1)];
										_ma setMarkerDirlocal direction _tempVEG;_ma setMarkerColorlocal "ColorGreen";
										_mr set [count _mr,_ma];
									};
								};
							};
						}
						else
						{
							_run = false;
						};
					}
					else
					{
						_run = false;
					};
				};
			};
		};
		_vegArray = [];
	};

	if(count _treArray > 0) then {{call compile (_scrObj select 0)} foreach _treArray};
	if(count _wallArray > 0) then
	{
		_wallTyp = _wallArray select 0;_wallHeight = (_wallArray select 4);_wallDir = (_wallArray select 5);
		_wallHole = (_wallArray select 3);_tempWall = _wallTyp createvehicle [0,0,0];_sega = [];_run = 1;

		if(((_wallArray select 2) select 2) == 0) then
		{
			_sizeX = ((boundingBox _tempWall select 1) select 0);
		}
		else
		{
			_sizeX = ((boundingBox _tempWall select 1) select 1);
		};

		_segmA = (((_wallArray select 2) select 0) / (_sizeX * 2));
		_segmB = (((_wallArray select 2) select 1) / (_sizeX * 2));
		if((_wallDir select 0) == 0) then {_s = "(_wallDir select 1)"} else {_s = "(_wallDir select 1) - random ((_wallDir select 1) * 2)"};

		_startPos = [
						["[(position _flag select 0) + ((_wallArray select 1) select 0),(position _flag select 1) + ((_wallArray select 1) select 1)]",_segmA],
						["[(position _tempWall select 0) + _sizeX,(position _tempWall select 1) - _sizeX]",_segmB],
						["[(position _tempWall select 0) - _sizeX,(position _tempWall select 1) - _sizeX]",_segmA],
						["[(position _tempWall select 0) - _sizeX,(position _tempWall select 1) + _sizeX]",_segmB]
					];
		_wallPara = [
						["[(_r select 0) + (_i * (_sizeX * 2)),(_r select 1),- _h]",0],
						["[(_r select 0),(_r select 1) - (_i * (_sizeX * 2)),- _h]",90],
						["[(_r select 0) - (_i * (_sizeX * 2)),(_r select 1),- _h]",180],
						["[(_r select 0),(_r select 1) + (_i * (_sizeX * 2)),- _h]",270]
					];

		while {_a < 4} do
		{
			_i = 0;_sega = [];
			_r = call compile ((_startPos select _a) select 0);
			if((_wallHole select _a) > 0) then
			{
				_gc = round ((((_startPos select _a) select 1) - (_wallHole select _a)) / 2);_c = _gc;
				while {_c < (_gc + (_wallHole select _a))} do
				{
					_sega set [count _sega,_c];
					_c = _c + 1;
				};
			};
			while {_i <= ((_startPos select _a) select 1)} do
			{
				if((_wallHeight select 0) == 1) then {_h = (_wallHeight select 1)} else {_h = random (_wallHeight select 1)};
				_p = call compile ((_wallPara select _a) select 0);
				if(!(_i in _sega)) then
				{
					_tempWall = _wallTyp createvehicle _p;
					if((getdir DAC_StartDummy) > 170) then {sleep 0.01};
					_tempWall setpos _p;
					_tempWall setdir (((_wallPara select _a) select 1) + call compile _s);
					_storeArray set [count _storeArray,_tempWall];
					_tempWall setTargetAge "UNKNOWN";
					if(DAC_Marker > 0) then
					{
						if((DAC_Marker_Val select 13) > 0) then
						{
							_m = format["c%1",_tempWall];_ma = createmarkerlocal [_m, position _tempWall];
							_ma setMarkerShapelocal "RECTANGLE";_ma setMarkerSizelocal [((boundingBox _tempWall select 1) select 0),((boundingBox _tempWall select 1) select 1)];
							_ma setMarkerDirlocal direction _tempWall;_ma setMarkerColorlocal "ColorBlue";
							_mr set [count _mr,_ma];
						};
					};
				}
				else
				{
					_TO = nearestObjects [_p, [], (_dd / 2)];
					{
						if((!(_x in _storeArray))&&(!(_x in _bu))) then
						{
							if((!(_x iskindof "Man")) && (!(_x iskindof "LandVehicle"))
							&& ((format["%1",typeof _x]) != "Logic")
							&& ((format["%1",typeof _x]) != "Camera")
							&& ((format["%1",typeof _x]) != "EmptyDetector")) then {deletevehicle _x};
						};
					}	foreach _TO;
				};
				_i = _i + 1;
			};
			_a = _a + 1;
		};
	};
	if(count _scrWall > 0) then {{call compile (_scrWall select 0)} foreach _storeArray};
	_campSet = [_storeArray,_mr];
	_campSet
};