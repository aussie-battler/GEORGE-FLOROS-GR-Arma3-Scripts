//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Arti_Fire         //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private	[
			"_unit","_r","_d","_b","_dummy","_wtime","_w","_u","_action","_ttime","_p","_eID",
			"_fireTime","_repeat","_a","_run","_ammo","_m","_n","_ma","_mb","_aFuel","_s","_oldWD"
		];

			_unit = _this select 0;_p = _this select 1;_dummy = _this select 2;_fireTime = 0;_mb = "";_m = "";
			_repeat = _this select 3;_d = _dummy distance _unit;_wtime = ((_d / 100) + (1000 / _d));_r = 0;
			_ammo = _this select 4;_w = "";_b = _this select 5;_a = objNull;_run = true;_u = 3;_ttime = 0;
			_ma = "";_aFuel = 0;_s = _this select 6;_n = _this select 7;_action = true;_oldWD = 0;_eID = 0;

if((count (weapons _unit)) > 0) then
{
	if((alive _unit) && (!((group _unit) in DAC_Fire_Groups))) then
	{
		_w = ((weapons _unit) select 0);
		_aFuel = fuel _unit;_unit disableAI "Autotarget";
		[36,10,(group _unit),"T",_dummy distance _unit] spawn DAC_fShowRadio;
		if(DAC_Marker > 0) then
		{
			if((DAC_Marker_Val select 12) > 0) then
			{
				_m = format["_z%1",_unit];_ma = createmarkerlocal [_m, position _unit];
				_ma setMarkerShapelocal "RECTANGLE";_ma setMarkerSizelocal [25,3];_ma setMarkerColorlocal "ColorBlack";
				[[_ma],0,_unit] spawn DAC_fFlashMarker;
			};
		};
		while {_run} do
		{
			if(_repeat == 0) then
			{
				_run = false;
			}
			else
			{
				if((alive _unit) && (!((group ((crew _unit) select 0)) in DAC_Fire_Groups))) then
				{
					if(_d < 100) then {_d = 100} else {if(_d > 1000) then {_d = 1000}};
					_unit forcespeed 0;(group _unit) setBehaviour "combat";(group _unit) setCombatMode "red";
					sleep 5;
					waituntil{(speed vehicle _unit) < 2};
					_oldWD = (((vehicle _unit) weaponDirection _w) select 2);
					if(alive _unit) then
					{
						_u = -1;_unit selectweapon (primaryweapon _unit);
						if(format["%1",driver _unit] != "<NULL-object>") then
						{
							_ttime = time + 30;
							while {_action} do
							{
								_unit forcespeed 0;
								(crew _unit) lookat [(_p select 0),(_p select 1),3000];
								sleep 5;
								if(alive _unit) then
								{
									if(((((vehicle _unit) weaponDirection _w) select 2) - _oldWD) > 0.2) then
									{
										_action = false;
									}
									else
									{
										(group _unit) setBehaviour "combat";(group _unit) setCombatMode "red";
										sleep 3;
										if(time > _ttime) then {_action = false;_u = 0};
									};
								}
								else
								{
									_action = false;
								};
							};
						}
						else
						{
							(crew _unit) lookat [(_p select 0),(_p select 1),3000];
							sleep 5;
						};
						if(_u < 0) then
						{
							if(alive _unit) then
							{
								_eID = _unit addeventhandler ["fired",{_this spawn DAC_fFireArti}];
								_unit setVariable ["dac_event", _eID, false];
								sleep 0.1;
								_unit fire _w;
								if(DAC_Marker > 0) then
								{
									if((DAC_Marker_Val select 12) > 0) then
									{
										_n setMarkerPosLocal _p;_n setMarkerSizelocal [0.3,0.3];
										[[_n],4] spawn DAC_fFlashMarker;
									};
								};
								sleep 1;
								_r = random 360;_p = [(_p Select 0) + (Sin (_r) * _b),(_p Select 1) + (Cos (_r) * _b),0];
								_fireTime = time + _wtime;_repeat = _repeat -1;reload _unit;
								if((_fireTime - time) < 6) then {_fireTime = time + 6};
								waituntil {time > _fireTime};
								switch (format["%1",side _unit]) do
								{
									case "WEST":	{DAC_Data_Array set[21, ((DAC_Data_Array select 21) + 1)]};
									case "EAST":	{DAC_Data_Array set[20, ((DAC_Data_Array select 20) + 1)]};
									default 		{};
								};
								{_a = _x createvehicle _p} foreach _ammo;
							}
							else
							{
								_run = false;
							};
						}
						else
						{
							_run = false;DAC_StartDummy globalchat format["%1 > We have some problems > not ready to fire",_unit];
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
		if(_n != "") then {deletemarkerlocal _n};
		if(alive _unit) then
		{
			_unit forcespeed -1;
			_unit enableAI "Autotarget";
			(crew _unit) lookat objNull;
		};
	};
};
DAC_Arti_Veh = DAC_Arti_Veh - [_unit];