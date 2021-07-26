//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_No_Camp           //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_unitcount","_vehcount","_wparray","_groupid","_groupside","_groupstart","_groupende","_maxwps","_heloarray",
			"_groupvar","_marker","_homezone","_TempUnitsB","_DAC_MColor","_isM","_clogic","_randomcount","_camparray",
			"_run","_go","_cs1","_cs2","_cs3","_cs5","_homezone","_camp","_spawnpro","_spawntyp","_spawncount","_wpstart","_startpos","_ma"
		];

			_unitcount = _this select 0;_vehcount = _this select 1;_wparray = _this select 2;_groupid = _this select 3;_camp = objNull;
			_groupside = _this select 4;_groupstart = _this select 5;_groupende = _this select 6;_maxwps = _this select 7;
			_heloarray = _this select 8;_groupvar = _this select 9;_marker = _this select 10;
			_homezone = _this select 11;_TempUnitsB = _this select 12;_DAC_MColor = ["ColorRed","ColorBlue","ColorYellow","ColorGreen"];
			_isM = [];_clogic = _TempUnitsB select 0;_randomcount = random 999;_run = 1;_go = true;_cs1 = 0;_cs2 = 0;_cs3 = 0;_cs5 = 0;_camparray = [];
			_ma = _this select 13;

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					if(((getMarkerSize _ma) select 0) <= 4) then
					{
						_run = 8;
					}
					else
					{
						_run = 2;
					};
				};
		case 2:	{
					if(count _TempUnitsB < 3) then
					{
						hintc format["Attention, in an Unit Config for Infantry,\nnot all required entries exist.\n\nAt least 3 entries must be\n contained. The first entry should\nbe always a pilot,\nthe second entry should be\nalways a driver, the third entry\nshould be always a group leader.\nFrom the fourth entry\nall Units can be taken."];
						sleep 1;
						DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
					}
					else
					{
						if((count _TempUnitsB < 4) && (count _TempUnitsB > 1)) then
						{
							hintc format["Attention,\nin an Unit Config for Camps,\nnot all required entries exist."];
							sleep 1;
							DAC_Basic_Value = 4;publicvariable "DAC_Basic_Value";_run = 0;
						}
						else
						{
							DAC_Init_Group set [count DAC_Init_Group,_randomcount];
							DAC_Init_Values set [0,(DAC_Init_Values select 0) + 1];
							DAC_Init_Unit set [4,(DAC_Init_Unit select 4) + 1];
							if(DAC_StartDummy in DAC_Init_Group) then {DAC_Init_Group = DAC_Init_Group - [DAC_StartDummy]};
							_spawnpro = _heloarray select 3;_spawntyp = _heloarray select 2;_spawncount = _heloarray select 4;
							_wpstart = call compile (_wparray select (random ((count _wparray) - 1)));
							_startpos = [(_wpstart select 0),(_wpstart select 1),0];_ctyp = format["%1",(_TempUnitsB select 0)];
							_camp = createTrigger ["EmptyDetector", [(_wpstart select 0),(_wpstart select 1)]];
							_cs1 = 0;_cs2 = 0;_cs5 = ((_homezone select 0) + (_homezone select 1));_camparray = [_camp];
							
							if(DAC_Marker > 0) then
							{
								if((DAC_Marker_Val select 13) > 0) then
								{
									_m = format["_m%1",_camp];_mf = createmarkerlocal [_m, position _camp];
									_mf setMarkerTypelocal "mil_flag";_mf setMarkerSizelocal [0.8,0.8];
									_mf setMarkerColorlocal (_DAC_MColor select _groupside);_isM set [count _isM,_mf];
								};
							};
							
							[_groupende,_groupside,[],_camparray,_isM,_ma]execVM format["%1DAC_Waiting_for_Null.sqf",DAC_AI_Path];
							DAC_Init_Camps = DAC_Init_Camps - 1;

							switch (_groupside) do
							{
								case 0:{_run = 3};
								case 1:{_run = 4};
								case 2:{_run = 5};
								default	{_run = 0};
							};
						};
					};
				};
		case 3:	{
					While {_cs1 < count DAC_Spawn_CampsE} do
					{
						_cs3 = DAC_Spawn_CampsE select _cs1;
						if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
						&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
						&& (_cs2 == 0)) then
						{
							(DAC_Spawn_CampsE select _cs1) set[1,_camp];
							(DAC_Spawn_CampsE select _cs1) set[2,_camp];
							((DAC_Spawn_CampsE select _cs1) select 5) set[0,_spawncount];
							((DAC_Spawn_CampsE select _cs1) select 5) set[1,0];_cs2 = 1;
						};
						_cs1 = _cs1 + 1;
					};
					sleep 0.1;
					if(_cs2 == 0) then
					{
						DAC_Spawn_CampsE set [count DAC_Spawn_CampsE,[_homezone,_camp,_camp,_spawnpro,_spawntyp,[_spawncount,0],[]]];
					};
					_run = 7;
				};
		case 4:	{
					While {_cs1 < count DAC_Spawn_CampsW} do
					{
						_cs3 = DAC_Spawn_CampsW select _cs1;
						if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
						&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
						&& (_cs2 == 0)) then
						{
							(DAC_Spawn_CampsW select _cs1) set[1,_camp];
							(DAC_Spawn_CampsW select _cs1) set[2,_camp];
							((DAC_Spawn_CampsW select _cs1) select 5) set[0,_spawncount];
							((DAC_Spawn_CampsW select _cs1) select 5) set[1,0];_cs2 = 1;
						};
						_cs1 = _cs1 + 1;
					};
					sleep 0.1;
					if(_cs2 == 0) then
					{
						DAC_Spawn_CampsW set [count DAC_Spawn_CampsW,[_homezone,_camp,_camp,_spawnpro,_spawntyp,[_spawncount,0],[]]];
					};
					_run = 7;
				};
		case 5:	{
					While {_cs1 < count DAC_Spawn_CampsE} do
					{
						_cs3 = DAC_Spawn_CampsE select _cs1;
						if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
						&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
						&& (_cs2 == 0)) then
						{
							(DAC_Spawn_CampsE select _cs1) set[1,_camp];
							(DAC_Spawn_CampsE select _cs1) set[2,_camp];
							((DAC_Spawn_CampsE select _cs1) select 5) set[0,_spawncount];((DAC_Spawn_CampsE select _cs1) select 5) set[1,0];_cs2 = 1;
						};
						_cs1 = _cs1 + 1;
					};
					sleep 0.1;
					if(DAC_Res_Side > 0) then
					{
						_run = 6;
					}
					else
					{
						if(_cs2 == 0) then
						{
							DAC_Spawn_CampsE set [count DAC_Spawn_CampsE,[_homezone,_camp,_camp,_spawnpro,_spawntyp,[_spawncount,0],[]]];
						};
						_run = 7;
					};
				};
		case 6:	{
					While {_cs1 < count DAC_Spawn_CampsW} do
					{
						_cs3 = DAC_Spawn_CampsW select _cs1;
						if(((((_cs3 select 0) select 0) + ((_cs3 select 0) select 1)) == _cs5)
						&& (format["%1",(_cs3 select 1)] == "<NULL-object>")
						&& (_cs2 == 0)) then
						{
							(DAC_Spawn_CampsW select _cs1) set[1,_camp];
							(DAC_Spawn_CampsW select _cs1) set[2,_camp];
							((DAC_Spawn_CampsW select _cs1) select 5) set[0,_spawncount];((DAC_Spawn_CampsW select _cs1) select 5) set[1,0];_cs2 = 1;
						};
						_cs1 = _cs1 + 1;
					};
					sleep 0.1;
					if(_cs2 == 0) then
					{
						DAC_Spawn_CampsW set [count DAC_Spawn_CampsW,[_homezone,_camp,_camp,_spawnpro,_spawntyp,[_spawncount,0],[]]];
					};
					_run = 7;
				};
		case 7:	{
					sleep 0.1;
					DAC_InCreate = false;
					sleep 0.5;
					DAC_Init_Group = DAC_Init_Group - [_randomcount];
					DAC_Init_Unit set [4,(DAC_Init_Unit select 4) - 1];
					DAC_Master_Init = DAC_Master_Init - 1;DAC_InSpawn = false;_run = 0;
				};
		case 8:	{
					DAC_InCreate = false;DAC_InSpawn = false;
					DAC_Master_Init = DAC_Master_Init - 1;_go = true;
					while {_go} do
					{
						sleep (1 + (random 1));
						if(((getMarkerSize _ma) select 0) == 5) then {_go = false;_run = 9};
					};
				};
		case 9:	{
					_go = true;
					while {_go} do
					{
						sleep (random 0.2);
						if(!(DAC_InCreate)) then {_go = false};
					};
					DAC_InCreate = true;
					if((DAC_Com_Values select 0) > 0) then {player groupchat "New spawnpoint was activated"};
					_run = 2;
				};
		default {};
	};
};