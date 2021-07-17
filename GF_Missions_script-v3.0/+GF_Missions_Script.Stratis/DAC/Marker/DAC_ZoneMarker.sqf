//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_ZoneMarker        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_aizone","_mxvalue","_myvalue","_zoneside","_mPos",
			"_i","_r","_m","_zm","_mSide1","_mSide2","_mSets","_cm",
			"_n","_settings","_zs","_a","_c","_p","_polyData",
			"_ld","_lp","_lr","_p1","_p2"
		];	

			_aizone = _this select 0;_zoneside = _this select 1;_mxvalue = _this select 2;_myvalue = _this select 3;_mSide1 = [];_mSide2 = [];
			_settings = _this select 4;_mPos = position _aizone;_i = 0;_ma = [];_n = 0;_zs = "";_a = objNull;_c = 0;_cm = [];
			_mSets = [];_r = 0;_m = "";_zm = objNull;_mSetr = [];_p = 0;_polyData = _this select 3;_lp = [];_lr = 0;_ld = 0;_p1 = [];_p2 = [];
		
sleep 0.1;

if(isDedicated) exitwith {};

if(DAC_Marker > 0) then
{
	if((DAC_Marker_Val select 0) > 0) then
	{
		_mSide1 = (DAC_Marker_Val select 14);
		_mSide2 = [(_mSide1 select 2),(_mSide1 select 0),(_mSide1 select 1),(_mSide1 select 3)];
		
		if(_mxvalue > 0) then
		{
			_mSetr = 	[
							0,11.25,22.5,33.75,45,56.25,67.5,78.75,90,101.25,112.5,123.75,135,146.25,157.5,168.75,180,
							191.25,202.5,213.75,225,236.25,247.5,258.75,270,281.25,292.5,303.75,315,326.25,337.5,348.75
						];
			_mSets = 	[
							[(_mxvalue + (DAC_Marker_Val select 11)),(DAC_Marker_Val select 11),_myvalue,180],
							[(DAC_Marker_Val select 11),(_myvalue + (DAC_Marker_Val select 11)),_mxvalue,90],
							[(_mxvalue + (DAC_Marker_Val select 11)),(DAC_Marker_Val select 11),_myvalue,0],
							[(DAC_Marker_Val select 11),(_myvalue + (DAC_Marker_Val select 11)),_mxvalue,270]
						];

			if((triggerarea _aizone) select 3) then
			{		
				while {_i < ((count _mSide1) - 4)} do
				{
					_r = random 100;
					_m = format["_zm%1%2%3",_aizone,_i,_r];
					_zm = createmarkerlocal [_m, [(position _aizone Select 0) + (Sin (((triggerarea _aizone) select 2) + ((_mSets select _i) select 3)) * ((_mSets select _i) select 2)),(position _aizone Select 1) + (Cos (((triggerarea _aizone) select 2) + ((_mSets select _i) select 3)) * ((_mSets select _i) select 2))]];
					_zm setMarkerShapelocal "RECTANGLE";
					_zm setMarkerSizelocal [((_mSets select _i) select 0),((_mSets select _i) select 1)];
					_zm setMarkerDirlocal ((triggerarea _aizone) select 2);
					if(_zoneside < 4) then
					{
						_zm setMarkerColorlocal (_mSide1 select _zoneside);
					}
					else
					{
						if(_zoneside < 10) then
						{
							_zm setMarkerColorlocal (_mSide2 select _i);
						}
						else
						{
							_zm setMarkerColorlocal "ColorBlue";
						};
					};
					_ma set [count _ma,_zm];
					_i = _i + 1;
				};
			}
			else
			{
				if(_mxvalue == _myvalue) then
				{
					while {_i < count _mSetr} do
					{
						_r = random 100;
						_m = format["_zm%1%2%3",_aizone,_i,_r];
						_zm = createmarkerlocal [_m, [(position _aizone Select 0) + (Sin (_mSetr select _i) * ((triggerarea _aizone) select 0)),(position _aizone Select 1) + (Cos (_mSetr select _i) * ((triggerarea _aizone) select 0))]];
						_zm setMarkerShapelocal "RECTANGLE";
						_zm setMarkerSizelocal [(((pi * _mxvalue) / 32) + (((pi * _mxvalue) / 32) / 30)),(DAC_Marker_Val select 11)];
						_zm setMarkerDirlocal (_mSetr select _i);
						if(_zoneside < 4) then
						{
							_zm setMarkerColorlocal (_mSide1 select _zoneside);
						}
						else
						{
							if(_zoneside < 10) then
							{
								if(_p == 4) then {_p = 0};
								_zm setMarkerColorlocal (_mSide2 select _p);
							}
							else
							{
								_zm setMarkerColorlocal "ColorBlue";
							};
						};
						_ma set [count _ma,_zm];
						_i = _i + 1;_p = _p + 1;
					};
				}
				else
				{
					_r = random 100;
					_m = format["_zm%1%2%3",_aizone,_i,_r];
					_zm = createmarkerlocal [_m, position _aizone];
					_zm setMarkerShapelocal "ELLIPSE";
					_zm setMarkerSizelocal [_mxvalue,_myvalue];
					_zm setMarkerDirlocal ((triggerarea _aizone) select 2);
					_zm setMarkerBrushlocal "BORDER";
					if(_zoneside < 4) then
					{
						_zm setMarkerColorlocal (_mSide1 select _zoneside);
					}
					else
					{
						if(_zoneside < 10) then
						{
							_zm setMarkerColorlocal (_mSide2 select _i);
						}
						else
						{
							_zm setMarkerColorlocal "ColorBlue";
						};
					};
					_ma set [count _ma,_zm];
				};
			};
		}
		else
		{
			while {_i < count _polyData} do
			{
				if(_i == (count _polyData - 1)) then
				{
					_p1 = (_polyData select _i);_p2 = (_polyData select 0);
				}
				else
				{
					_p1 = (_polyData select _i);_p2 = (_polyData select (_i + 1));
				};
				_r = random 100;
				_m = format["_zm%1%2%3",_aizone,_i,_r];
				_zm = createmarkerlocal [_m, (_polyData select _i)];
				_zm setMarkerShapelocal "RECTANGLE";
				_zm setMarkerSizelocal [30,30];
				_ld = ((_p1 distance _p2) / 2);
				_lr = ((_p2 select 0) - (_p1 select 0)) atan2 ((_p2 select 1) - (_p1 select 1));
				_lp = [(_p1 select 0) + (Sin (_lr) * _ld),(_p1 select 1) + (Cos (_lr) * _ld),0];
				_zm setMarkerSizelocal [_ld,(DAC_Marker_Val select 11)];
				_zm setMarkerPoslocal _lp;
				_zm setMarkerDirlocal (_lr - 90);				
				if(_zoneside < 4) then
				{
					_zm setMarkerColorlocal (_mSide1 select _zoneside);
				}
				else
				{
					if(_zoneside < 10) then
					{
						_zm setMarkerColorlocal (_mSide2 select _i);
					}
					else
					{
						_zm setMarkerColorlocal "ColorBlue";
					};
				};
				_ma set [count _ma,_zm];
				_i = _i + 1;
			};
		};
		waituntil {((getdir DAC_StartDummy) > 170)};
		sleep 1;
		if((DAC_Marker_Val select 0) == 1) then
		{
			sleep 5;
			{deletemarker _x}foreach _ma;
		}
		else
		{
			while {_c < count DAC_Zones} do
			{
				_a = DAC_Zones select _c;
				if((call compile (_a select 0)) == _aizone) then
				{
					_cm = (_a select 9);
					_c = ((count DAC_Zones) + 1);
				}
				else
				{
					_c = _c + 1;
				};
			};
			[_ma,5,(_cm select 0),_zoneside] spawn DAC_fFlashMarker;
			[_ma,6,_aizone,_cm] spawn DAC_fFlashMarker;
		};
	};
};

