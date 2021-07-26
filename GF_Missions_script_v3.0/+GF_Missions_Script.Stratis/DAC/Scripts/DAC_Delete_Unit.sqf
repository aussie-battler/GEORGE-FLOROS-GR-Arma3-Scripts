//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Delete_Unit       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_TimeToDel","_DistToDel","_unit","_UnitTyp","_delpos","_waittime","_groupende","_EventList","_delOpt","_groupside",
			"_GlobalDel","_DelGroup","_pos","_check","_run","_go","_explo","_markerVal","_jArray","_GroupID","_action","_dist"
		];

_unit = _this select 0;_TimeToDel = _this select 1;_DistToDel = _this select 2;_UnitTyp = _this select 3;_dist = 0;_check = 0;_groupside = 3;
_markerVal = _this select 4;_delpos = getpos _unit;_run = 0;_go = true;_jArray = [];_EventList = [];_delOpt = 0;_action = true;
_DelGroup = objNull;_groupende = 0;_GroupID = 0;if(count _this < 8) then {_DelGroup = _this select 5;_delOpt = _this select 6};
			
if(count _this > 8) then {_groupende = _this select 6;_GroupID = ((_this select 7) - 1)} else {_groupside = _this select 7};

waituntil {((getdir DAC_StartDummy) > 170)};
if((isNil "_unit") || (format["%1",_unit] == "<NULL-object>")) exitwith {};
_unit removeAllEventHandlers "hit";
sleep (random 0.2);

if((_UnitTyp == 1) && (_unit != vehicle _unit) && (((position vehicle _unit) select 2) < 5)) then {_unit setpos (position (vehicle _unit))};
if(_unit in DAC_West_Units) then {DAC_West_Units = DAC_West_Units - [_unit];_groupside = 1};
if(_unit in DAC_East_Units) then {DAC_East_Units = DAC_East_Units - [_unit];_groupside = 0};

if(_groupende > 0) then
{
	_EventList = [_groupende] call DAC_fConfigEvents;
	if((count ((_EventList select _GroupID) select 3)) > 0) then
	{
		call compile (((_EventList select _GroupID) select 3) select 0);
	};
	if(!(isNull _DelGroup)) then
	{
		if((count ((_EventList select _GroupID) select 2)) > 0) then
		{
			call compile (((_EventList select _GroupID) select 2) select 0);
		};
	};
};

if((_TimeToDel + _DistToDel) == 0) exitwith {};

while{_action} do
{
	if(_UnitTyp == 2) then
	{
		_check = 0;
		if(count crew _unit > 0) then {_DelGroup = group (crew _unit select 0)};
		if(format["%1",gunner _unit] == "<NULL-object>") then {_check = 1};
		while{_run == 0} do
		{
			if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then
			{
				_run = 4;
			}
			else
			{
				if((getdammage _unit) == 1) then
				{
					switch (_groupside) do
					{
						case 0:	{DAC_Data_Array set[7, ((DAC_Data_Array select 7) + 1)];DAC_Data_Array set[6, ((DAC_Data_Array select 6) - 1)]};
						case 1:	{DAC_Data_Array set[15, ((DAC_Data_Array select 15) + 1)];DAC_Data_Array set[14, ((DAC_Data_Array select 14) - 1)]};
						Default {};
					};
					_run = 1;
				};
				if(({alive _x} count units _DelGroup) == 0) then {_run = 3};
				sleep (1 + random 1);
			};
		};
	}
	else
	{
		_run = 1;[_unit,0] spawn DAC_fAISpeak;[15,_unit] spawn DAC_fAIRadio;
	};

	while{_run > 0} do
	{
		switch (_run) do
		{
			case 1:	{
						if(_TimeToDel == 0) then
						{
							_run = 2;
						}
						else
						{
							_go = true;
							_waittime = daytime + (_TimeToDel / 4000);
							while{_go} do
							{
								sleep (1 + (random 1));
								if(daytime > _waittime) then {_run = 2;_go = false};
								if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then {_run = 4;_go = false};
							};
						};
					};
			case 2:	{
						if(_DistToDel > 0) then
						{
							_go = true;
							while{_go} do
							{
								if((({(((_x distance _unit) < _DistToDel) && (alive _x))} count call compile "DAC_Players") == 0)
								|| ((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1))) then
								{
									_run = 4;_go = false;
								};
								sleep (1 + random 1);
							};
						}
						else
						{
							_run = 4;
						};
					};
			case 3:	{
						if(_delOpt > 0) then
						{
							_go = true;
							_waittime = daytime + (_delOpt / 4000);
							while{_go} do
							{
								sleep (1 + (random 1));
								if(daytime > _waittime) then
								{
									_unit setdammage 1;
									_run = 1;_go = false;
								}
								else
								{
									if((getdammage _unit) == 1) then
									{
										_run = 1;_go = false;
									}
									else
									{
										if(count crew _unit > 0) then
										{
											_DelGroup = group (crew _unit select 0);_run = 0;_go = false;
										}
										else
										{
											if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then {_run = 4;_go = false};
										};
									};
								};
							};
						}
						else
						{
							_go = true;
							while{_go} do
							{
								sleep (1 + (random 1));
								if((getdammage _unit) == 1) then
								{
									_run = 1;_go = false;
								}
								else
								{
									if(count crew _unit > 0) then
									{
										_DelGroup = group (crew _unit select 0);_run = 0;_go = false
									}
									else
									{
										if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then {_run = 4;_go = false};
									};
								};
							};
						};
					};
			case 4:	{
						if(!(_UnitTyp == 2)) then
						{
							_run = 5;
						}
						else
						{
								sleep 1;
								waituntil{((count (crew _unit)) == 0)};_dist = round(_unit distance player);
								_UnitTyp = typeof _unit;if(format["%1",_UnitTyp] == "") then {_UnitTyp = "Unknown Vehicle";_dist = 0};
								if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was deleted (%2MTR)",_UnitTyp,_dist]};
								if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse set [count DAC_VehicleInUse,_unit]};
								switch (_groupside) do
								{
									case 0:	{DAC_Data_Array set[16, ((DAC_Data_Array select 16) + 1)]};
									case 1:	{DAC_Data_Array set[17, ((DAC_Data_Array select 17) + 1)]};
									Default {};
								};
								sleep 1;
								deletevehicle _unit;
								_run = 0;_action = false;
						};
					};
			case 5:	{
						if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then
						{
							deletevehicle _unit;_run = 0;_action = false;
							switch (_groupside) do
							{
								case 0:	{DAC_Data_Array set[3, ((DAC_Data_Array select 3) + 1)]};
								case 1:	{DAC_Data_Array set[11, ((DAC_Data_Array select 11) + 1)]};
								Default {};
							};
						}
						else
						{
							hideBody _unit;_dist = round(_unit distance player);
							_UnitTyp = typeof _unit;if(format["%1",_UnitTyp] == "") then {_UnitTyp = "Unknown Unit";_dist = 0};
							if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was deleted (%2MTR)",_UnitTyp,_dist]};
							sleep 3;
							deletevehicle _unit;
							switch (_groupside) do
							{
								case 0:	{DAC_Data_Array set[3, ((DAC_Data_Array select 3) + 1)]};
								case 1:	{DAC_Data_Array set[11, ((DAC_Data_Array select 11) + 1)]};
								Default {};
							};
							_run = 0;_action = false;
						};
					};
			Default {};
		};
	};
};