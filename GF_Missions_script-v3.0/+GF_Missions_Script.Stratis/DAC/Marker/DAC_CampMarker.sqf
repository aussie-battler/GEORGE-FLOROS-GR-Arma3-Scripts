//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_CampMarker        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_cc1","_cc2","_cc3","_cc4","_campV","_posx","_zone","_zpos","_temp","_array","_flag",
			"_l","_la","_ld","_lr","_lp","_lt","_p","_entry","_SideID","_SideCP","_CampList","_rnd"
		];

if((DAC_Marker == 0) || ((DAC_Marker_Val select 10) <= 0) || (isDedicated)) exitwith {};

_cc1 = 0;_cc2 = 0;_cc3 = 0;_cc4 = 0;_array = [];_temp = [];_campV = DAC_StartDummy;
_SideID = _this select 0;_SideCP = ["DAC_Spawn_CampsE","DAC_Spawn_CampsW"];_zone = "";_l = "";_entry = "";
_CampList = format["%1",_SideCP select _SideID];_p = [0,0,0];_rnd = 0;_posx = 0;_zpos = 0;_la = "";_ld = 0;_lr = 0;_lp = 0;_lt = 0;
_dummy  = "logic" createvehiclelocal [0,0,0];_flag = _this select 1;

while {_cc1 < count (call compile _CampList)} do
{
	_temp = [];
	_campV = ((call compile _CampList) select _cc1);
	if((_campV select 1) == _flag) then
	{
		if((count (_campV select 6)) == 0) then
		{
			_cc1 = ((count (call compile _CampList)) + 1);
		}
		else
		{
			_cc2 = 0;
			while {_cc2 < (count (_campV select 6))} do
			{
				_posx = ((_campV select 6) select _cc2);
				_cc3 = 0;
				while {_cc3 < count DAC_Zones} do
				{
					_zone = call compile ((DAC_Zones select _cc3) select 0);
					_zpos = (position _zone select 0);
					if(_posx != _zpos) then
					{
						_cc3 = _cc3 + 1;
					}
					else
					{
						_temp set [count _temp,_zone];
						_cc3 = _cc3 + 1;
					};
				};
				_cc2 = _cc2 + 1;
			};
			if(count _temp > 0) then
			{
				_cc4 = 0;
				while {_cc4 < count _temp} do
				{
					_p  = position (_campV select 1);_entry = _temp select _cc4;
					_dummy setpos _p;_rnd = random 10000;
					_l  = format["_cma%1%2",(_p select 0),_rnd];_la = createmarkerlocal [_l, _p];
					_la setMarkerShapelocal "RECTANGLE";_la setMarkerSizelocal [10,10];_la setMarkerColorlocal "ColorBlack";
					_ld = ((_dummy distance _entry) / 2);_lt = position _entry;
					_lr = ((position _entry select 0) - (position _dummy select 0)) atan2 ((position _entry select 1) - (position _dummy select 1));
					_lp = [(position _dummy select 0) + (Sin (_lr) * _ld),(position _dummy select 1) + (Cos (_lr) * _ld),0];
					_la setMarkerSizelocal [_ld,(DAC_Marker_Val select 10)];_la setMarkerPoslocal _lp;_la setMarkerDirlocal (_lr - 90);
					_array set [count _array,_la];
					_cc4 = _cc4 + 1;
				};
				_cc1 = ((count (call compile _CampList)) + 1);
			};
		};
		_cc1 = _cc1 + 1;
	}
	else
	{
		_cc1 = _cc1 + 1;
	};
};
deletevehicle _dummy;

if((DAC_Marker_Val select 0) == 1) then
{
	sleep 5;
	{deletemarkerlocal _x}foreach _array;
};