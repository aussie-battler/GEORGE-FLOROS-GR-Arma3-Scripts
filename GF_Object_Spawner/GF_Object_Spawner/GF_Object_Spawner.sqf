


//________________	Author : GEORGE FLOROS [GR]	___________	12.04.19	_____________ 


/*
________________	GF Object Spawner Script - Mod	________________

https://forums.bohemia.net/forums/topic/222840-gf-object-spawner-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


//________________ Settings _____________
//________________ Set true or false  _____________

GF_OS_Debug_Markers					= true;
GF_OS_Systemchat_info				= true;		
GF_OS_diag_log_info					= true;

GF_OS_Number						= 100;		//	Number of spawned objects
GF_OS_Minimum_Distance				= 1000;		//	Minimum Distance from the center , this can be changed to maximum by changing < (of the Map , _centerPosition)
GF_OS_DynamicSimulationSystem		= true;		//	enableDynamicSimulationSystem

GF_OS_Vehicles_Auto					= true;		//	Load every Mod + Bohemia Vehicles	( to exclude mods etc check on the GF Auto Loot Crashsites Script - Mod )
GF_OS_Ravage_addactions				= false;	//	add the Ravage addactions , to the spawned vehicles



if (GF_OS_Systemchat_info)then{
systemchat "GF Object Spawner Script initializing - Mod";			
};	

if (GF_OS_diag_log_info)then{
diag_log "//________________	GF Object Spawner Script - Mod initializing	________________";
};




//________________	autodetecting mods , creating lists	________________
//	Load every Mod + Bohemia Vehicles	( to exclude mods etc check on the GF Auto Loot Crashsites Script - Mod )


//________________	LandVehicle	________________

GF_OS_array_LandVehicle	= ("
	getNumber (_x >> 'scope') >= 1 
	&& (configName _x isKindof 'LandVehicle')
	&& (!(configName _x isKindof 'StaticWeapon'))
	&& (!(configName _x isKindof 'Ejection_Seat_Base_F'))
	&& (!(configName _x isKindof 'Kart_01_Base_F'))
	" configClasses (configFile >> "CfgVehicles")) apply {configName _x};
	//	copyToClipBoard str GF_ALRC_Vehicle_array;	//	uncomment to copy


//________________	Helicopter + plane	________________
//	for planes change this :
//	&& (configName _x isKindof 'Helicopter')
//	to :
//	&& ((configName _x isKindof 'Helicopter') or (configName _x isKindof 'plane'))


GF_OS_array_Air = ("
	getNumber (_x >> 'scope') >= 1 
	&& (configName _x isKindof 'Helicopter')
	&& (!(configName _x isKindof 'ParachuteBase')) 
	&& (!(configName _x isKindof 'UAV'))
	&& (!(configName _x isKindof 'B_UAV_01_F'))
	&& (!(configName _x isKindof 'O_UAV_01_F'))
	&& (!(configName _x isKindof 'I_UAV_01_F'))	
	&& (!(configName _x isKindof 'B_T_UAV_03_F'))
	&& (!(configName _x isKindof 'B_T_UAV_03_dynamicLoadout_F')) 
	&& (!(configName _x isKindof 'UAV_06_base_F'))
	&& (!(configName _x isKindof 'C_IDAP_UAV_01_F'))
	" configClasses (configFile >> "CfgVehicles")) apply {configName _x};
	//	copyToClipBoard str GF_ALC_Vehicle_array;	//	uncomment to copy


	
if(GF_OS_DynamicSimulationSystem)then{
	enableDynamicSimulationSystem true;
};	


//________________	The center of the spawn	_____________
//	It can be changed , to any position

_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");


_a = 0;
while {_a < GF_OS_Number} do {
	
	//________________	The spawn position is random ( no water )	_____________
	_pos = [] call BIS_fnc_randomPos;

	_nearestRoad = [_pos, 50] call BIS_fnc_nearestRoad;	
	_nearest_House = nearestObject [_Pos, "House"];
	_nearest_Building = nearestObject [_Pos, "Building"];
	
	//________________	add Distance from _nearestRoad - House - Building	________________
	
	if (
		((_pos distance _nearestRoad) > 20) 
		&& ((_pos distance _nearest_House) > 15) 
		&& ((_pos distance _nearest_Building) > 15) 
		)then{

	if (_pos distance _centerPosition > GF_OS_Minimum_Distance)then{	//	this can be changed to maximum by changing <

	_a = _a + 1;
	
	
	//________________	add here your cases	_____________
	
	_select = selectrandom [
				
				1,	//	Vehicles
				2,	//	Wrecks
				3	//	Structures
				];
	
	
	private ["_array","_Color"];
	
	if(_select isEqualto 1)then {
			
			
		if(GF_OS_Vehicles_Auto)then{
		
			_array = GF_OS_array_LandVehicle + GF_OS_array_Air;
	
		}else{
	
		_array = [
		
			//________________	Vehicles	________________
			
			//	Armoured
			"B_APC_Wheeled_01_cannon_F",
			"B_APC_Tracked_01_CRV_F",
			"B_APC_Tracked_01_rcws_F",
			"B_MBT_01_arty_F",
			"B_MBT_01_mlrs_F",
			"B_MBT_01_cannon_F",
			"B_MBT_01_TUSK_F",
			"B_APC_Tracked_01_AA_F",
			"O_APC_Tracked_02_AA_F",
			"O_APC_Tracked_02_cannon_F",
			"O_APC_Wheeled_02_rcws_v2_F",
			"O_MBT_02_arty_F",
			"O_MBT_02_cannon_F",
			"I_APC_Wheeled_03_cannon_F",
			"I_APC_tracked_03_cannon_F",
			"I_Truck_02_MRL_F",
			"I_MBT_03_cannon_F",
			
			//	Wheeled Vehicles
			"B_MRAP_01_F",
			"B_MRAP_01_gmg_F",
			"B_MRAP_01_hmg_F",
			"B_Quadbike_01_F",
			"B_G_Offroad_01_AT_F",
			"B_G_Offroad_01_armed_F",
			"O_MRAP_02_F",
			"O_MRAP_02_gmg_F",
			"O_MRAP_02_hmg_F",
			"O_G_Offroad_01_AT_F",
			"O_G_Offroad_01_armed_F",
			"O_G_Quadbike_01_F",
			"I_MRAP_03_F",
			"I_MRAP_03_gmg_F",
			"I_MRAP_03_hmg_F",
			"I_G_Offroad_01_AT_F",
			"I_G_Offroad_01_armed_F",
			
			//	Wheeled Vehicles transport
			"B_G_Offroad_01_F",
			"B_G_Quadbike_01_F",
			"B_G_Van_01_transport_F",
			"B_Truck_01_transport_F",
			"B_Truck_01_covered_F",
			"O_Truck_03_transport_F",
			"O_Truck_03_covered_F",
			"O_Truck_02_transport_F",
			"O_Truck_02_covered_F",
			"O_G_Offroad_01_F",
			"O_G_Offroad_01_repair_F",
			"O_G_Van_01_transport_F",
			"I_Quadbike_01_F",
			"I_Truck_02_transport_F",
			"I_Truck_02_covered_F",
			"I_G_Offroad_01_F",
			"I_G_Quadbike_01_F",
			"I_G_Van_01_transport_F",
			
			//	Helicopters
			"O_Heli_Light_02_armed_F",
			"I_Heli_light_03_dynamicLoadout_F",
			"B_Heli_Transport_03_F",
			"B_Heli_Transport_01_F",
			"O_Heli_Light_02_dynamicLoadout_F",
			"O_Heli_Light_02_v2_F",
			"O_Heli_Transport_04_bench_black_F",
			"O_Heli_Transport_04_covered_F",
			"B_Heli_Light_01_F",
			"O_Heli_Attack_02_dynamicLoadout_F",
			"O_Heli_Transport_04_bench_F",
			"I_Heli_Transport_02_F",
			"B_Heli_Transport_03_unarmed_F",
			"O_Heli_Light_02_unarmed_F",
			"I_Heli_light_03_unarmed_F"			
		];
		
		};
		
		_Color = "ColorBlue";	//	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
	};
	
	
	if(_select isEqualto 2)then {
	
		_array = [
			
			//________________	Wrecks	________________
			
			"Land_Wreck_BMP2_F",
			"Land_Wreck_BRDM2_F",
			"Land_Wreck_HMMWV_F",
			"Land_Wreck_Skodovka_F",
			"Land_Wreck_CarDismantled_F",
			"Land_Wreck_Truck_F",
			"Land_Wreck_Car2_F",
			"Land_Wreck_Car_F",
			"Land_Wreck_Car3_F",
			"Land_Wreck_Hunter_F",
			"Land_Wreck_Van_F",
			"Land_Wreck_Offroad_F",
			"Land_Wreck_Offroad2_F",
			"Land_Wreck_UAZ_F",
			"Land_Wreck_Ural_F",
			"Land_Wreck_Truck_dropside_F",
			"Land_Wreck_Heli_Attack_02_F",
			"Land_Wreck_Heli_Attack_01_F",
			"Land_Wreck_Plane_Transport_01_F",
			"Land_Wreck_Slammer_F",
			"Land_Wreck_Slammer_hull_F",
			"Land_Wreck_Slammer_turret_F",
			"Land_Wreck_T72_hull_F",
			"Land_Wreck_T72_turret_F"
		];

		_Color = "ColorWhite";	//	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
	};
	
	
	if(_select isEqualto 3)then {
	
		_array = [
		
			//________________	Structures	________________
			
			"Land_Unfinished_Building_01_F",
			"Land_Unfinished_Building_02_F",
			"Land_u_House_Big_02_V1_F",
			"Land_d_House_Big_02_V1_F",
			"Land_d_Shop_01_V1_F",
			"Land_Castle_01_tower_F",
			"Land_d_Windmill01_F",
			"Land_i_Windmill01_F",
			"Land_BagBunker_Large_F",
			"Land_BagBunker_Small_F",
			"Land_BagBunker_Tower_F",
			"Land_Cargo_Tower_V3_F",
			"Land_Cargo_Tower_V1_F",
			"Land_Cargo_Tower_V2_F",
			"Land_Chapel_Small_V2_F",
			"Land_GH_House_1_F",
			"Land_GH_House_2_F",
			"Land_ReservoirTower_F",
			"Land_spp_Tower_F",
			"Land_wpp_Turbine_V2_F",
			"Land_wpp_Turbine_V1_F",
			"Land_Metal_Shed_F",
			"Land_u_House_Small_01_V1_F",
			"Land_d_House_Small_01_V1_F",
			"Land_u_House_Small_02_V1_F",
			"Land_d_House_Small_02_V1_F",
			"Land_i_House_Small_02_V3_F",
			"Land_i_House_Small_02_V1_F",
			"Land_i_House_Small_02_V2_F",
			"Land_i_House_Small_01_V3_F",
			"Land_i_House_Small_01_V1_F",
			"Land_i_Addon_02_V1_F",
			"Land_u_Addon_02_V1_F",
			"Land_Slum_House02_F",
			"Land_Slum_House03_F",
			"Land_i_Stone_HouseBig_V3_F",
			"Land_d_Stone_HouseBig_V1_F",
			"Land_i_Stone_HouseBig_V1_F",
			"Land_i_Stone_HouseBig_V2_F",
			"Land_i_Stone_Shed_V2_F",
			"Land_i_Stone_Shed_V1_F",
			"Land_i_Stone_Shed_V3_F"
		];

		_Color = "ColorOrange";	//	https://community.bistudio.com/wiki/CfgMarkerColors_Arma_3
	};	
	
		_object = selectrandom _array;		
		_createVehicle = createVehicle [_object, _pos, [], 0, "CAN_COLLIDE"];
		_Text = getText (configFile >> "cfgVehicles" >> _object >> "vehicleClass");
		_createVehicle setVariable ["Var_GF_OS",true];
		_createVehicle setDir random 360;
		_createVehicle setfuel random 1;
		_createVehicle setDamage random 1;
		
		
		if(GF_OS_DynamicSimulationSystem)then{
			_createVehicle enableDynamicSimulation true;
		};
		
		
		_format = format ["GF_OS_%1",_pos];
		_createVehicle setVehicleVarName _format;
		
		
		if(GF_OS_Debug_Markers)then{
			
			_Marker_pos = format ["GF_OS_%1",_pos];
			_Marker = createMarker [_Marker_pos,_pos];		
			_Marker setMarkerShape "ICON"; 
			_Marker setMarkerType "mil_dot"; 
			_Marker setMarkerColor _Color; 
			_Marker setMarkerText format ["%1 : %2",_Text,_a];	
			_Marker setMarkerSize [0.6,0.6]; 	
		};
		

		if (GF_OS_Systemchat_info)then{
		systemchat format ["objects : %1",_a];				
		};	
		
		if (GF_OS_diag_log_info)then{
		diag_log format ["objects : %1",_a];		
		};
	
		};
	};
	
};


if (GF_OS_Ravage_addactions)then{
	{
		[_x, "InitPost", {_this call rvg_fnc_setVehicleActions}, true, [], true] call CBA_fnc_addClassEventHandler
	}forEach ["LandVehicle", "Helicopter", "Plane", "Ship"];
};


if (GF_OS_Systemchat_info)then{
systemchat "GF Object Spawner Script - Mod initialized";			
};	

if (GF_OS_diag_log_info)then{
diag_log "//________________	GF Object Spawner Script - Mod initialized	________________";
};