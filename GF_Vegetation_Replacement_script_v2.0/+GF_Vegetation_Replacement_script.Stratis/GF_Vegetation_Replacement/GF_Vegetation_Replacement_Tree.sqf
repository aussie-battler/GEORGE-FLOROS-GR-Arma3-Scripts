


//________________  Author : GEORGE FLOROS [GR] ___________	29.03.19	_____________


/*
________________	GF Vegetation Replacement Script - Mod	________________

https://forums.bohemia.net/forums/topic/221912-gf-vegetation-replacement-script-mod/

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

waituntil{GF_VR_Distance_Check_Loaded};

Waituntil{sleep 1;GF_VR_Preset_Trees_initialized};


if (GF_VR_Systemchat_info) then {
systemchat "GF Vegetation Replacement Tree Script initializing";			
};	


if (GF_VR_diag_log_info) then {
diag_log "//________________	GF_VR_Tree.sqf	________________";
diag_log "//________________	GF Vegetation Replacement Tree Script initializing	________________";
};


//________________	Debug info	_____________

if(GF_VR_Debug_info) then {

if (GF_VR_Systemchat_info) then {
systemchat "GF Vegetation Replacement Debug info Enabled";			
};	

if (GF_VR_diag_log_info) then {
diag_log "//________________	GF Vegetation Replacement Debug Enabled	_____________";
};
};



//________________ _Exclude_List , not for vanilla maps _____________

_Exclude_List = [

	"classname",
	"classname"
];




{
GF_VR_Tree_Count = GF_VR_Tree_Count + 1;

GF_VR_Tree_Objects = _x;

if (!(typeOf _x in _Exclude_List)) then {

private _pos = getPosATL _x;
private _dir = getDir _x;
private _vectorDirUp = [vectorDir _x, vectorUp _x];		 
hideObjectGlobal _x;

_createVehicle = createVehicle [selectrandom GF_VR_Tree_array, _pos, [], 0, "CAN_COLLIDE"];
_createVehicle setDir _dir;
_createVehicle setVectorDirAndUp _vectorDirUp;

if(GF_VR_Disable_Simulation)then{
	_createVehicle enableSimulationGlobal false;
};

//________________	Debug info	_____________

if(GF_VR_Debug_info) then {

hintsilent format["Replaced Trees : %1 \n Replaced Bushs : %2",GF_VR_Tree_Count,GF_VR_Bush_Count];
//	systemchat format["Replaced Trees : %1 ",GF_VR_Tree_Count];
};

};

}forEach GF_VR_Tree_Objects;




if (GF_VR_Systemchat_info) then {
systemchat "GF Vegetation Replacement Tree Script initialized";			
};	


if (GF_VR_diag_log_info) then {
diag_log "//________________	GF_VR_Tree.sqf	________________";
diag_log "//________________	GF Vegetation Replacement Tree Script initialized	________________";
};