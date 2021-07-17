//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Waiting_for_End   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_group","_groupid","_groupende","_groupside","_grouppara","_markerVal","_camparray","_marker","_tO","_tc",
			"_delarray","_rCamp","_dc","_ca","_delval0","_delval1","_sidearray","_c","_vehA","_unitA","_shet","_delPos",
			"_i","_temparray1","_temparray2","_rdmcamp","_tempcamp","_temptyp","_tempcount","_tempother","_spawncount",
			"_tempvalue","_tempvalue2","_wait","_camp","_t","_spawnpro","_building","_run","_go","_rTime",
			"_scriptTyp","_allcampobj","_eventid","_zone","_tempbuild"
		];

			_group = _this select 0;_groupid = _this select 1;_groupende = _this select 2;_groupside = _this select 3;
			_eventid = _groupid;_grouppara = _this select 4;_markerVal = _this select 5;_delarray  = [];_rCamp = [];
			_dc = [];_ca = [];_tO = [];_vehA = [];_unitA = [];_i = 0;_temparray1 = [];_temparray2 = [];_c = 0;_tempbuild = objNull;
			_rdmcamp = [];_delval0 = ((DAC_Delete_Value select 0) select 0);_delval1 = ((DAC_Delete_Value select 0) select 1);_rTime = 0.1;
			_sidearray = ["E","W","R","C"];_allcampobj = [];_spawncount = 0;_spawnpro = 0;_run = 0;_zone = [];
			_go = true;_scriptTyp = ["Soldier","Vehicle","Tank","Air","Camp"];_wait = 1;_delPos = [0,0,0];_tc = [];
			_tempcamp = objNull;_temptyp = objNull;_tempcount = objNull;_tempother = objNull;_tempvalue = objNull;_tempvalue2 = objNull;_building = objNull;_camp = objNull;_shet = objNull;
			

if(format["%1",_group] != "<NULL-group>") then
{			
	if(count _this == 8) then {_camparray = _this select 6;_marker = _this select 7;_delPos = position (_camparray select 0)};
	if(format["%1",driver vehicle (leader _group)] == "<NULL-object>") then {_groupid = 8};
	sleep 1;
	if(_groupside < 3) then {{_x addeventhandler ["hit",{_this spawn DAC_fHitByEnemy}]} foreach units _group};
	{if(count (weapons _x) > 0) then {_x selectweapon ((weapons _x) select 0)}} foreach units _group;
	if(format["%1",_group getVariable "getout_dac"] != "<NULL>") then {if((_group getVariable "getout_dac") == 1) then {_group setVariable ["getout_dac", 0, false]}};

	if(count _this < 8) then {_run = 2} else {_run = 1};

	if(_groupside == 0) then
	{
		_dc = "DAC_Spawn_CampsE";
	}
	else
	{
		if(_groupside == 1) then
		{
			_dc = "DAC_Spawn_CampsW";
		}
		else
		{
			if(_groupside == 2) then
			{
				if(DAC_Res_Side == 0) then {_dc = "DAC_Spawn_CampsE"} else {_dc = "DAC_Spawn_CampsW"};
			}
			else
			{
				//hintc "Error: DAC_Waiting_For_End.sqf";
				_run = 0;
			};
		};
	};
	while {_run > 0} do
	{
		switch (_run) do
		{
			case 1:	{
						_c = 0;
						While {_c < count (call compile _dc)} do
						{
							_ca = ((call compile _dc) select _c);
							if((_ca select 1) == (_camparray select 1)) then {_c = ((count (call compile _dc)) + 1)};
							_c = _c + 1;
						};
						_run = 2;
					};
			case 2:	{
						_go = true;_c = 0;
						while {_go} do
						{
							if((count _this == 8) && (_c == 0)) then
							{
								if((((_ca select 5) select 0)+((_ca select 5) select 1)) == 0) then
								{
									if(count _marker > 0) then
									{
										(_marker select 0) setmarkertext "<--- [0,0] Respawn(s) left";
										sleep 3;
										deletemarkerlocal (_marker select 0);_c = 1;
									};
								}
								else
								{
									if(count _marker > 0) then {(_marker select 0) setmarkertext format["<--- [%1,%2] Respawn(s) left",((_ca select 5) select 0),((_ca select 5) select 1)]};
								};
							};
							{
								if((not alive _x) && (!(_x in _delarray))) then
								{
									_delarray set [count _delarray,_x];
									switch (_groupside) do
									{
										case 0:	{DAC_Data_Array set[2, ((DAC_Data_Array select 2) + 1)]};
										case 1:	{DAC_Data_Array set[10, ((DAC_Data_Array select 10) + 1)]};
										Default {};
									};
									[_x,_delval0,_delval1,1,_markerVal,_group,_groupende,_eventid,0] spawn DAC_fDeleteUnit;
								};
							} 	foreach units _group;
							if((((getMarkerSize _markerVal) select 0) <= 4)
							|| (({alive _x} count units _group) == 0)) then
							{
								_run = 3;_go = false;
							};
							if(format["%1",_group getVariable "getout_dac"] != "<NULL>") then {if((_group getVariable "getout_dac") == 1) then {_run = 11;_go = false}};
							sleep (1 + (random 1));
						};
					};
			case 3:	{
						if((((getMarkerSize _markerVal) select 0) <= 4) || (_groupside == 3)) then
						{
							_run = 4;
						}
						else
						{
							[_group,_groupside,0] spawn DAC_fRemoveGroup;
							sleep 0.5;
							if(_groupid < 4) then
							{
								_run = 5;
							}
							else
							{
								if((_groupid == 8) || (_groupid == 6) || (_groupid == 4)) then
								{
									_run = 0;
								}
								else
								{
									if(_run == 3) then
									{
										_c = 0;
										While {_c < count (call compile _dc)} do
										{
											_tc = ((call compile _dc) select _c);
											if((_tc select 1) == (_camparray select 1)) then {(_tc select 5) set[0,0];(_tc select 5) set[1,0]};
											_c = _c + 1;
										};
										if(count _marker > 0) then {(_marker select 0) setmarkertext "<--- [0,0] Respawns left"};
										sleep 3;
										deletemarkerlocal (_marker select 0);
										_run = 0;
									};
								};
							};
						};
					};
			case 4:	{
						{
							if((!(typeof vehicle _x == typeof _x)) && (!(vehicle _x in _vehA))) then
							{
								_vehA set [count _vehA,vehicle _x];
							};
						}	foreach units _group;
						sleep (0.1 + random 0.1);
						{deletevehicle _x} foreach _vehA;
						sleep (1 + random 0.5);
						{deletevehicle _x} foreach units _group;
						sleep 0.1;
						if(((getMarkerSize _markerVal) select 0) <= 4) then {[_group,_groupside,0] spawn DAC_fRemoveGroup};
						if((DAC_Com_Values select 0) > 0) then
						{
							if(((getMarkerSize _markerVal) select 0) == 4) then
							{
								player groupchat format["%1 was deactivated",_group];
							}
							else
							{
								player groupchat format["%1 was deleted",_group];
							};
						};
						if(count _this != 8) then
						{
							_run = 0;
						}
						else
						{
							_c = 0;
							While {_c < count (call compile _dc)} do
							{
								_tc = ((call compile _dc) select _c);
								if((_tc select 1) == (_camparray select 1)) then {(_tc select 5) set[0,0];(_tc select 5) set[1,0]};
								_c = _c + 1;
							};
							sleep 0.1;
							_allcampobj = _allcampobj + [(_camparray select 0),(_camparray select 1),(_camparray select 2),(_camparray select 3)];
							{_allcampobj set [count _allcampobj,_x]} foreach (_camparray select 4);
							{_allcampobj set [count _allcampobj,_x]} foreach (_camparray select 6);
							if((count (_camparray select 8)) > 0) then {{_allcampobj set [count _allcampobj,_x]} foreach ((_camparray select 8) select 0)};
							{deletevehicle _x} foreach _allcampobj;deletemarkerlocal (_marker select 0);
							_tO = nearestObjects [_delPos, [], 100];
							{
								if((!(_x iskindof "Man")) && (!(_x iskindof "LandVehicle"))
								&& ((format["%1",typeof _x]) != "Logic")
								&& ((format["%1",typeof _x]) != "Camera")
								&& ((format["%1",typeof _x]) != "EmptyDetector")) then {deletevehicle _x};
							}	foreach _tO;
							if((count (_camparray select 8)) > 0) then
							{
								if((count ((_camparray select 8) select 1)) > 0) then
								{
									{deletemarkerlocal _x} foreach ((_camparray select 8) select 1);
								};
							};
							_run = 0;
						};
					};
			case 5:	{
						if(((count (call compile _dc)) == 0) || (_groupid > 3)) then
						{
							_run = 0;
						}
						else
						{
							_DAC_UnitTyp = 0;_zone = [];
							if(_groupid < 4) then
							{
								_DAC_UnitTyp = _grouppara select 11;_zone = position (call compile (_grouppara select 10));
							}
							else
							{
								_DAC_UnitTyp = _grouppara select 13;_zone = position (call compile (_grouppara select 12));
							};
							_i = 0;_temparray1 = [];_temparray2 = [];_rdmcamp = [];
							if((DAC_AI_Spawn select 2) == 0) then {_run = 7} else {_run = 6};
						};
					};
			case 6:	{
						_go = true;_i = 0;
						while {_go} do
						{
							if(_i >= count (call compile _dc)) then
							{
								_run = 8;_go = false;
							}
							else
							{
								_tempcamp = (((call compile _dc) select _i) select 0);
								_tempbuild = (((call compile _dc) select _i) select 1);
								_temptyp = (((call compile _dc) select _i) select 4);
								_tempcount = ((((call compile _dc) select _i) select 5) select 0);
								_tempother = (((call compile _dc) select _i) select 6);
								_tempvalue = format["%1 + %2",_zone select 0,_zone select 1];
								_tempvalue2 = format["%1 + %2",_tempcamp select 0,_tempcamp select 1];
								if(!(format["%1",_tempbuild] == "<NULL-object>")) then
								{
									if((format["%1",call compile _tempvalue] == format["%1",call compile _tempvalue2]) && (_tempcount > 0)) then
									{
										if(_temptyp == 0) then
										{
											_temparray1 set [count _temparray1,_i];
											_temparray2 set [count _temparray2,_i];
										}
										else
										{
											if(_temptyp == 1) then
											{
												_temparray1 set [count _temparray1,_i];
											}
											else
											{
												_temparray2 set [count _temparray2,_i];
											};
										};
									}
									else
									{
										if((count _tempother) > 0) then
										{
											if(({_x == (_zone select 0)} count _tempother) > 0) then
											{
												if(_temptyp == 0) then
												{
													if(!(_i in _temparray1)) then
													{
														_temparray1 set [count _temparray1,_i];
													};
													if(!(_i in _temparray2)) then
													{
														_temparray2 set [count _temparray2,_i];
													};
												}
												else
												{
													if(_temptyp == 1) then
													{
														if(!(_i in _temparray1)) then
														{
															_temparray1 set [count _temparray1,_i];
														};
													}
													else
													{
														if(!(_i in _temparray2)) then
														{
															_temparray2 set [count _temparray2,_i];
														};
													};
												};
											};
										};
									};
								};
							};
							_i = _i + 1;
						};
					};
			case 7:	{
						_go = true;_i = 0;
						while {_go} do
						{
							if(_i >= count (call compile _dc)) then
							{
								_run = 8;_go = false;
							}
							else
							{
								_tempbuild = (((call compile _dc) select _i) select 1);
								_temptyp = (((call compile _dc) select _i) select 4);
								_tempcount = ((((call compile _dc) select _i) select 5) select 0);
								if(!(format["%1",_tempbuild] == "<NULL-object>")) then
								{
									if(_tempcount > 0) then
									{
										if(_temptyp == 0) then
										{
											_temparray1 set [count _temparray1,_i];
											_temparray2 set [count _temparray2,_i];
										}
										else
										{
											if(_temptyp == 1) then
											{
												_temparray1 set [count _temparray1,_i];
											}
											else
											{
												_temparray2 set [count _temparray2,_i];
											};
										};
									};
								};
								_i = _i + 1;
							};
						};
					};
			case 8:	{
						if(_groupid < 2) then
						{
							if(count _temparray1 == 0) then
							{
								DAC_InSpawn = false;_run = 0;
							}
							else
							{
								_go = true;
								while {_go} do
								{
									sleep (random 1);
									_wait = daytime + ((((DAC_AI_Spawn select 0) select 0) + random (((DAC_AI_Spawn select 0) select 1) - ((DAC_AI_Spawn select 0) select 0))) / 4000);
									if(((DAC_AI_Spawn select 0) select 2) > 0) then {_rTime = ((DAC_AI_Spawn select 0) select 2)};
									sleep 0.5;
									waituntil {((daytime > _wait) || (((getMarkerSize _markerVal) select 0) <= 4))};
									if(((getMarkerSize _markerVal) select 0) <= 4) then
									{
										DAC_InSpawn = false;_run = 0;_go = false;
									}
									else
									{
										if(count _temparray1 == 0) then
										{
											DAC_InSpawn = false;_run = 0;_go = false;
										}
										else
										{
											_rdmcamp = _temparray1 select (random ((count _temparray1) - 1));
											_go = false;_run = 1;
										};
									};
								};
							};
						}
						else
						{
							if(count _temparray2 == 0) then
							{
								DAC_InSpawn = false;_run = 0;
							}
							else
							{
								_go = true;
								while {_go} do
								{
									sleep (random 1);
									_wait = daytime + ((((DAC_AI_Spawn select 1) select 0) + random (((DAC_AI_Spawn select 1) select 1) - ((DAC_AI_Spawn select 1) select 0))) / 4000);
									if(((DAC_AI_Spawn select 1) select 2) > 0) then {_rTime = ((DAC_AI_Spawn select 1) select 2)};
									sleep 0.5;
									waituntil {((daytime > _wait) || (((getMarkerSize _markerVal) select 0) <= 4))};
									if(((getMarkerSize _markerVal) select 0) <= 4) then
									{
										DAC_InSpawn = false;_run = 0;_go = false;
									}
									else
									{
										if(count _temparray2 == 0) then
										{
											DAC_InSpawn = false;_run = 0;_go = false;
										}
										else
										{
											_rdmcamp = _temparray2 select (random ((count _temparray2) - 1));
											_go = false;_run = 1;
										};
									};
								};
							};
						};
						if(_run != 0) then
						{
							if(((((call compile _dc) select _rdmcamp) select 5) select 0) == 0) then
							{
								sleep (random 1);
								_i = 0;_temparray1 = [];_temparray2 = [];_rdmcamp = [];
								if((DAC_AI_Spawn select 2) == 0) then {_run = 7} else {_run = 6};
							}
							else
							{
								_camp = (((call compile _dc) select _rdmcamp) select 0);_building = (((call compile _dc) select _rdmcamp) select 1);
								_shet = (((call compile _dc) select _rdmcamp) select 2);_spawnpro = (((call compile _dc) select _rdmcamp) select 3);
								_spawncount = ((((call compile _dc) select _rdmcamp) select 5) select 0);_t = random 100;
								sleep 1;
								if(_t > _spawnpro) then
								{
									_run = 0;
								}
								else
								{
									(((call compile _dc) select _rdmcamp) select 5) set [0,(((((call compile _dc) select _rdmcamp) select 5) select 0) - 1)];
									(((call compile _dc) select _rdmcamp) select 5) set [1,(((((call compile _dc) select _rdmcamp) select 5) select 1) + 1)];
									_run = 9;
								};
							};
						};
					};
			case 9:	{
						_go = true;
						while {_go} do
						{
							if(((getMarkerSize _markerVal) select 0) <= 4) then
							{
								_go = false;_run = 0;
							}
							else
							{
								if(({(((_x distance _building) < (DAC_AI_Spawn select 4))
								&& (alive _x))} count call compile "DAC_Players") > 0) then
								{
									(((call compile _dc) select _rdmcamp) select 5) set [0,(((((call compile _dc) select _rdmcamp) select 5) select 0) + 1)];
									(((call compile _dc) select _rdmcamp) select 5) set [1,(((((call compile _dc) select _rdmcamp) select 5) select 1) - 1)];
									sleep (random 1);
									_i = 0;_temparray1 = [];_temparray2 = [];_rdmcamp = [];_go = false;
									if((DAC_AI_Spawn select 2) == 0) then {_run = 7} else {_run = 6};
								}
								else
								{
									sleep (1 + random 1);
									if((!(_building in DAC_Camps_InUse)) && (!(DAC_InSpawn))) then {_run = 10;_go = false};
								};
							};
						};
					};
			case 10:{
						DAC_InSpawn = true;_grouppara set[12,_group];
						if(!(_building in DAC_Camps_InUse)) then {DAC_Camps_InUse set [count DAC_Camps_InUse,_building]};
						if(((position _shet) select 0) == 0) then {_shet setpos (_building modelToWorld [0,15,0]);player groupchat "Bad Spawn Position"};
						DAC_SpawnDummy setpos position _shet;
						call compile format["_grouppara execVM ""DAC\Scripts\DAC_Group_%1.sqf""",_scriptTyp select (_groupid - 1)];
						waituntil {(!(DAC_InSpawn))};
						if(((getMarkerSize _markerVal) select 0) <= 4) then
						{
							if(_building in DAC_Camps_InUse) then {DAC_Camps_InUse = DAC_Camps_InUse - [_building]};
							_run = 0;
						}
						else
						{
							(((call compile _dc) select _rdmcamp) select 5) set [1,(((((call compile _dc) select _rdmcamp) select 5) select 1) - 1)];
							if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was respawned",_group]};
							sleep _rTime;
							if(_building in DAC_Camps_InUse) then {DAC_Camps_InUse = DAC_Camps_InUse - [_building]};
							_run = 0;
						};
					};
			case 11:{
						[_group,_groupside,0] spawn DAC_fRemoveGroup;
						if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was released from DAC",_group]};
						_run = 0;
					};
			Default	{};
		};
	};
};