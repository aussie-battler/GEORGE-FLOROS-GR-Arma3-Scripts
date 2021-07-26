


//________________  Author : [GR]GEORGE F ___________ 27.12.18 _____________

/*
________________ GF Vehicle Radio chatter script ________________

https://forums.bohemia.net/forums/topic/218313-gf-vehicle-radio-chatter-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


diag_log "//________________ GF_VRC Script initializing ________________";


//________________ Settings ________________
//________________ Set true or false  ________________

GF_VRC_Systemchat_info					= true;	
	
GF_VRC_BIS_Sounds						= false; 	
GF_VRC_Custom_Sounds  					= true; 

GF_VRC_Distance 						= 15;
GF_VRC_Time								= 200;		//	How much time to wait until the next transmition
GF_VRC_Time_Random						= 150;		//	+ random		


//________________	Exclude certain Vehicles	________________
		
GF_VRC_Exclude_List = [
	"B_Heli_Light_01_dynamicLoadout_F"
]; 


if (GF_VRC_Systemchat_info) then {
systemchat "GF_VRC Script initializing";			
};	


GF_VRC_allPlayers = allUnits select {isPlayer _x && {!(_x isKindOf "HeadlessClient_F")}};
GF_VRC_centerPosition = getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition");


//________________	Special Thanks to :	TPW ________________ 
//	https://forums.bohemia.net/profile/762937-tpw/?do=content&type=forums_topic&change_section=1
//	DON'T PLAY MILITARY RADIO IN CIVILIAN VEHICLES
private ["_cfg"];
GF_VRC_tpw_radio_carlist = [];
_cfg = (configFile >> "CfgVehicles");
for "_i" from 0 to ((count _cfg) -1) do {
	if (isClass ((_cfg select _i) ) ) then {
		_cfgName = configName (_cfg select _i);
		if ( 
			(_cfgName isKindOf "car") 
			&& {getNumber ((_cfg select _i) >> "scope") == 2} 
			&& {getNumber ((_cfg select _i) >> "side") == 3}
		) then {
	GF_VRC_tpw_radio_carlist set [count GF_VRC_tpw_radio_carlist,_cfgname];
	};
	};
};


GF_VRC_Play = { 
		
	
//________________ GF_VRC_BIS_Sounds _____________		

if (GF_VRC_BIS_Sounds) then {	
			
if (GF_VRC_Systemchat_info) then {
systemchat "BIS_Radio_chatter";			
};

_this execVM "GF_VRC\GF_VRC_BIS_Sounds.sqf";
};		


//________________ GF_VRC_Custom_Sounds _____________	
	
if (GF_VRC_Custom_Sounds) then {		

if (GF_VRC_Systemchat_info) then {
systemchat "Custom_Radio_chatter";			
};
	
_this execVM "GF_VRC\GF_VRC_Custom_Sounds.sqf";
};

};	

GF_VRC_Pos = "#particlesource" createVehicleLocal [0,0,0];	

GF_VRC_Stop = {	
GF_VRC_Pos spawn {
    deleteVehicle _this;
};		
};


[] spawn {
	while {true} do	{

GF_VRC_Vehicles = nearestObjects [GF_VRC_centerPosition, ["Landvehicle","Air","Ship"], worldSize];	

	{
	_Vehicle = _x;
    if ( 
	(!(typeof  _Vehicle in GF_VRC_tpw_radio_carlist)) 
	&& {!(_Vehicle iskindof "StaticWeapon")} 
	&& {!(_Vehicle iskindof "ParachuteBase")} 
	&& (isNull (attachedTo _Vehicle)) 
	&& (!((typeOf _x) in GF_VRC_Exclude_List)) 
	) then {
	
	GF_VRC_Vehicles = GF_VRC_Vehicles - [_x];   
	
	if ( 
		(({((_x distance _Vehicle) > GF_VRC_Distance)} count GF_VRC_allPlayers) isEqualTo 0) 
		&& (!(_x getVariable ["Var_GF_VRC_ON",false]))
		) then {
									
			_x setVariable ["Var_GF_VRC_ON",true];
			_x call GF_VRC_Play;
			GF_VRC_Close = true;
			
			if (GF_VRC_Systemchat_info) then {
			systemchat "Radio ON";		
			};	

			}else{
			
	if  ( 
		(({((_x distance _Vehicle) < GF_VRC_Distance)} count GF_VRC_allPlayers) isEqualTo 0) 
		&& ((_x getVariable ["Var_GF_VRC_ON",true]))  
		) then {
							
			_x setVariable ["Var_GF_VRC_ON",false];
			_x call GF_VRC_Stop;
			GF_VRC_Close = false;	
			
			if (GF_VRC_Systemchat_info) then {
			systemchat "Radio OFF";		
			};	
			
		};			
	};	
	};
	} forEach GF_VRC_Vehicles;
	sleep 3;
};
				
};


if (GF_VRC_Systemchat_info) then {
systemchat "GF_VRC Script initialized";			
};	

diag_log "//________________ GF_VRC Script initialized ________________";