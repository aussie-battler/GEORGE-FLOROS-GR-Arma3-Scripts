//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Sector_Check      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_run","_zone","_zid","_msize","_size1","_size2","_pos2","_yStep","_modeE","_modeF","_timeF",
			"_sect","_yVal","_ref","_incr","_decr","_mPos","_mSets","_i","_z","_c","_r","_m","_a","_timeE",
			"_za","_list","_marker1","_marker2","_WVal","_EVal","_sVal","_E","_F","_sideF","_sideE","_hTime"
		];
		
			_run = 1;_i = 0;_r = 0;_c = 0;_zone = _this select 0;_zid = _this select 1;_msize = [];_size1 = 0;_size2 = 0;
			_yStep = DAC_Sector_Values select 0;_modeE = ((DAC_Sector_Values select 4) select 1);_modeF = ((DAC_Sector_Values select 5) select 1);
			_timeE = ((DAC_Sector_Values select 4) select 0);_timeF = ((DAC_Sector_Values select 5) select 0);
			_list = [];_WVal = 0;_EVal = 0;_sect = 0;_za = objNull;_ref = DAC_Sector_Values select 1;_incr = DAC_Sector_Values select 2;_z = objNull;
			_a = [];_decr = DAC_Sector_Values select 3;_m = "";_marker1 = "";_marker2 = "";_E = [];_F = [];_yVal = 0;_hTime = time;
			_sideE = DAC_Sector_Values select 7;_sideF = DAC_Sector_Values select 8;

if((isServer) && (({((isPlayer _x) && (local _x))} count DAC_Players) == 0)) then
{
	if(time > 0) exitwith {player groupchat "Not possible to start sectorcheck"};
}
else
{
	_zone = (_this select 0);
	if(((triggerArea _zone) select 2) == 0) then
	{
		_size1 = ((triggerArea _zone) select 0);
		_size2 = ((triggerArea _zone) select 1);
	}
	else
	{
		_size1 = ((triggerArea _zone) select 1);
		_size2 = ((triggerArea _zone) select 0);
	};

	if(isNull _zone) then
	{
		hintc "Error > DAC_Sector_Check : zone not found.";
	}
	else
	{
		_zone setTriggerActivation ["ANY", "PRESENT", true];_zone setTriggerType "NONE"; 
		sleep (random 1);
		_mPos  = position _zone;
		if(_ref <= 0) then {_ref = 0.01};
		_pos2  =[(_mPos select 0),(_mPos select 1) - (_size2)];_yVal = (_size2 / _yStep);
		_mSets =[
					[(_size1 - 3),3,((_mPos select 1) - _size2),(_mPos select 0)],
					[3,(_size2 + 3),(_mPos select 1),((_mPos select 0) + _size1)],
					[(_size1 - 3),3,((_mPos select 1) + _size2),(_mPos select 0)],
					[3,(_size2 + 3),(_mPos select 1),((_mPos select 0) - _size1)]
				];

		while {_i < count _mSets} do
		{
			_r = random 100;_m = format["_zu%1%2%3",_zid,_i,_r];
			_za = createmarkerlocal [_m, [((_mSets select _i) select 3),((_mSets select _i) select 2)]];_za setMarkerShapelocal "RECTANGLE";
			_za setMarkerSizelocal [((_mSets select _i) select 0),((_mSets select _i) select 1)];_za setMarkerColorlocal "ColorBlack";_i = _i + 1;
		};
		while {_run > 0} do
		{
			switch (_run) do
			{
				case 1:	{
							_m = format["_n_%1_%2",_zid,time];_marker2 = createMarkerlocal [_m, _mPos];
							_marker2 setMarkerShapelocal "RECTANGLE";_marker2 setMarkerSizelocal [_size1, _size2];
							_marker2 setMarkerColorlocal "ColorWhite";
							_m = format["_m_%1_%2",_zid,time];_marker1 = createMarkerlocal [_m, _pos2];
							_marker1 setMarkerShapelocal "RECTANGLE";_marker1 setMarkerSizelocal [_size1, 0.1];
							_marker1 setMarkerColorlocal "ColorBlack";_run = 2;
						};
				case 2:	{
							//SectorLoop
							_list = List _zone;
							_E = [];_F = [];
							sleep _ref;
							{if((alive _x) && (format["%1",side _x] in _sideF)) then {_F = _F + crew _x}} foreach _list;
							{if((alive _x) && (format["%1",side _x] in _sideE)) then {_E = _E + crew _x}} foreach _list;
							_WVal = ((count _F) * _incr);_EVal = ((count _E) * _incr);
							if(_WVal > 0) then {if(_EVal == 0) then {_run = 4} else {if(_EVal < _WVal) then {_run = 6} else {_run = 7}}} else {if(_EVal == 0) then {_run = 3} else {_run = 5}};
						};
				case 3:	{
							//Refresh
							if((DAC_Sectors select _zid) > 0) then
							{
								if(((DAC_Sectors select _zid) == 2) || ((DAC_Sectors select _zid) == 4)) then
								{
									if(_modeE == 0) then
									{
										if(_sect > 0) then
										{
											_sect = _sect - _decr;DAC_Sectors set [_zid, 2];
											_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
											_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];
										}
										else
										{
											if((DAC_Sectors select _zid) != 0) then {DAC_Sectors set [_zid, 0]};
										};
									}
									else
									{
										if(time > _htime) then
										{
											if(_sect > 0) then
											{
												_sect = _sect - _decr;
												_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
												_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];
											}
											else
											{
												if((DAC_Sectors select _zid) != 0) then {DAC_Sectors set [_zid, 0]};
											};
										};
									};
								}
								else
								{
									if(_modeF == 0) then
									{
										if(_sect > 0) then
										{
											_sect = _sect - _decr;DAC_Sectors set [_zid, 1];
											_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
											_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];
										}
										else
										{
											if((DAC_Sectors select _zid) != 0) then {DAC_Sectors set [_zid, 0]};
										};
									}
									else
									{
										if(time > _htime) then
										{
											if(_sect > 0) then
											{
												_sect = _sect - _decr;
												_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
												_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];
											}
											else
											{
												if((DAC_Sectors select _zid) != 0) then {DAC_Sectors set [_zid, 0]};
											};
										};
									};
								};
							};
							_run = 2;
						};
				case 4:	{
							//Set10
							if(((DAC_Sectors select _zid) == 2) || ((DAC_Sectors select _zid) == 4)) then
							{
								DAC_Sectors set [_zid, 1];_sect = 0;_marker1 setMarkerSizelocal [_size1, 0.1];_marker1 setMarkerPoslocal _pos2;_hTime = (time + _timeF);_run = 2;
							}
							else
							{
								if(_sect >= _yStep) then
								{
									DAC_Sectors set [_zid, 3];_marker1 setMarkerSizelocal [_size1,_size2];
									_zone setVariable ["SectorStatus", 3, true];
									_marker1 setMarkerPoslocal _mPos;
									if(_modeF > 0) then
									{
										_run = 0;
									}
									else
									{
										_hTime = (time + _timeF);_run = 2;
									};
								}
								else
								{
									DAC_Sectors set [_zid, 1];_marker1 setMarkerColorlocal "ColorGreen";
									_sVal = _WVal;_sect = _sect + _sVal;_hTime = (time + _timeF);
									_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
									_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];_run = 2;
								};
							};
						};
				case 5:	{
							//Set01
							if(((DAC_Sectors select _zid) == 1) || ((DAC_Sectors select _zid) == 3)) then
							{
								DAC_Sectors set [_zid, 2];_sect = 0;_marker1 setMarkerSizelocal [_size1, 0.1];_marker1 setMarkerPoslocal _pos2;_hTime = (time + _timeE);_run = 2;
							}
							else
							{
								if(_sect >= _yStep) then
								{
									DAC_Sectors set [_zid, 4];_marker1 setMarkerSizelocal [_size1,_size2];
									_zone setVariable ["SectorStatus", 4, true];
									_marker1 setMarkerPoslocal _mPos;
									if(_modeE > 0) then
									{
										_run = 0;
									}
									else
									{
										_hTime = (time + _timeE);_run = 2;
									};
								}
								else
								{
									DAC_Sectors set [_zid, 2];_marker1 setMarkerColorlocal "ColorRed";
									_sVal = _EVal;_sect = _sect + _sVal;_hTime = (time + _timeE);
									_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
									_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];_run = 2;
								};
							};
						};
				case 6:	{
							//Set21
							if(((DAC_Sectors select _zid) == 2) || ((DAC_Sectors select _zid) == 4)) then
							{
								DAC_Sectors set [_zid, 1];_sect = 0;_marker1 setMarkerSizelocal [_size1, 0.1];_marker1 setMarkerPoslocal _pos2;_hTime = (time + _timeF);_run = 2;
							}
							else
							{
								if(_sect >= _yStep) then
								{
									DAC_Sectors set [_zid, 3];_marker1 setMarkerSizelocal [_size1,_size2];
									_zone setVariable ["SectorStatus", 3, true];
									_marker1 setMarkerPoslocal _mPos;
									if(_modeF > 0) then
									{
										_run = 0;
									}
									else
									{
										_hTime = (time + _timeF);_run = 2;
									};
								}
								else
								{
									DAC_Sectors set [_zid, 1];_marker1 setMarkerColorlocal "ColorGreen";
									_sVal = _WVal;_sect = _sect + _sVal;_hTime = (time + _timeF);
									_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
									_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];_run = 2;
								};
							};
						};
				case 7:	{
							//Set12
							if(((DAC_Sectors select _zid) == 1) || ((DAC_Sectors select _zid) == 3)) then
							{
								DAC_Sectors set [_zid, 2];_sect = 0;_marker1 setMarkerSizelocal [_size1, 0.1];_marker1 setMarkerPoslocal _pos2;_hTime = (time + _timeE);_run = 2;
							}
							else
							{
								if(_sect >= _yStep) then
								{
									DAC_Sectors set [_zid, 4];_marker1 setMarkerSizelocal [_size1,_size2];
									_zone setVariable ["SectorStatus", 4, true];
									_marker1 setMarkerPoslocal _mPos;
									if(_modeE > 0) then
									{
										_run = 0;
									}
									else
									{
										_hTime = (time + _timeE);_run = 2;
									};
								}
								else
								{
									DAC_Sectors set [_zid, 2];_marker1 setMarkerColorlocal "ColorRed";
									_sVal = _EVal;_sect = _sect + _sVal;_hTime = (time + _timeE);
									_marker1 setMarkerPoslocal [(_pos2 select 0),(_pos2 select 1) + (_sect * _yVal)];
									_marker1 setMarkerSizelocal [_size1, (_sect * _yVal)];_run = 2;
								};
							};
						};
				Default{};
			};
		};
	};
};