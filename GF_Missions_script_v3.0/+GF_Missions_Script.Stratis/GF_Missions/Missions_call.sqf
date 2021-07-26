


/*
	________________	ADDED By lordfrith	________________
	https://forums.bohemia.net/profile/1079222-lordfrith/
	
	How to start the Missions when the player requests it i.e. by addaction from an officer/satellite phone at a base.	
	INFO here: 
	https://forums.bohemia.net/forums/topic/219080-gf-missions-script/?page=2&tab=comments#comment-3313618

	create an object or unit in 3D editor and add this:
	 
	this addAction ["<t color='#0099FF'>Request Mission</t>","GF_Missions\Missions_call.sqf",[],10,true,true,"","true", 3];														
*/


[GF_Missions_allPlayers,["GF_Missions"],["Have a good Game ! ","GF_Missions",""], objNull,1,1,true,"whiteboard"] call BIS_fnc_taskCreate;
["GF_Missions","ASSIGNED",true] spawn BIS_fnc_taskSetState;

if (count GF_Missions_Array > 0) 
	then {
	
_Random_Missions = floor (random count GF_Missions_Array);
_Random_Script = GF_Missions_Array select _Random_Missions;

null = [] execVM _Random_Script;
	
if (!GF_Missions_Repeat_Missions)  then {				
GF_Missions_Array = GF_Missions_Array - [_Random_Script];
	
if (GF_Missions_Systemchat_info) then {
systemchat "Next mission is generating";
};

diag_log "//________________ Next GF_Missions is generating	_____________";
		
	};
	}else{	

["GF_Missions","SUCCEEDED",true] spawn BIS_fnc_taskSetState;

if (GF_Missions_Systemchat_info) then {
systemchat "Well done! All the GF_Missions are Complete";
};	

diag_log "//________________ All the GF_Missions are Complete _____________";

sleep 3;

	if (GF_Missions_saveGame) then {
	saveGame;
	};	
};