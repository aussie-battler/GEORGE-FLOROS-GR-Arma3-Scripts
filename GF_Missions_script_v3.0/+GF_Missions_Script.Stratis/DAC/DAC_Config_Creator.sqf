//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};

scalar = "any";DAC_Init_Camps = 0;

waituntil{time > 0.3};

if(isServer) then {if(local player) then {DAC_Code = 1} else {DAC_Code = 0}} else {if(isnull player) then {DAC_Code = 3} else {DAC_Code = 2}};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

if(isNil "DAC_STRPlayers")		then {		
	//	The array where all valid playernames are given. Attention, entrys must be put as string.
	//	Invalid entrys will be deleted automatically.
	//	You need to name your players variable name with the folowing , or add yours here
	DAC_STRPlayers		= [
	"s_1","s_2","s_3","s_4","s_5","s_6","s_7","s_8","s_9","s_10","s_11","s_12","s_13","s_14","s_15","s_16","s1_7","s_18","s_19",
	"s_20","s_21","s_22","s_23","s_24","s_25","s_26","s_27","s_28","s_29","s_30","s_31","s_32","s_33","s_34","s_35","s_36","s_37",
	"s_38","s_39","s_40","s_41","s_42","s_43","s_44","s_45","s_46","s_47","s_48","s_49","s_50","s_51","s_52","s_53","s_54","s_55",
	"s_56","s_57","s_58","s_59","s_60","s_61","s_62","s_63","s_64","s_65","s_66","s_67","s_68","s_69","s_70","s_71","s_72","s_73",
	"s_74","s_75"]};
	
if(isNil "DAC_AI_Count_Level")	then {		
	//	Here you can define the group sizes. The first value is used to specify the minimum size, the second value represents the 
	//	maximum size of a group. The group size will later be fetched from the DAC.
	DAC_AI_Count_Level  = [[2,4],[3,6],[4,8],[6,12],[1,0]]};
	
if(isNil "DAC_Dyn_Weather") 	then {		
	//	<<<< Use this only in SinglePlayer mode >>>
	//	This parameter controls DAC ́s dynamic weather system. If you do not want to use this feature,
	//	you have to set the  1st value to  0 .
	//	1. Timeframe for weather changes to set in
	//	2. Determines weather change persistency
	//	3. Maximum allowed weather intensity
	//	4. Maximum allowed fog density
	DAC_Dyn_Weather		= [0,0,0,[0, 0, 0],0]};
	
if(isNil "DAC_Reduce_Value") 	then {		
/*
	Here you ́ll find the parameters for unit/squad reduction. If you dont want to use this feature you have to set the 
	3rd value to  0 .
	1 . Distance setting defines when groups are being built up
	2 . Distance setting defines when groups become reduced (this value should be a tad higher than the first one).
	3.  The timeout DAC takes between units, when a group is recreated.
*/	
	DAC_Reduce_Value	= [1500,1750,0.3]};

if(isNil "DAC_AI_Spawn") 		then {		
/*	
	The basic settings and delay times of the AI
	- Respawn are given here. It is mandatory to have at least one DAC
	- Camp generated for the AI
	- Respawn to work at all.
	1 . Respawn delay for infantry = seconds min. + random variation + idling period until next respawn is allowed at camp
	2 . Respawn delay for  vehicles = seconds min. + random variation + idling period until next respawn is allowed at camp
	3 . Respawn global = 0, Respawn local = 1
	4 . Optional respawn camp destruction once no more respawns are available:
	0 = Camp objects will stay, 
	>0 = seconds until self destruction starts
	5 . Minimum required distance of all player units to a respawn camp. If  player units get closer than that no respawns will
	be executed meanwhile.
	6 . Behaviour of the Respwan
	- camps when no more respawn  available (to hold arti
	- support for example).
	0 = The camp group will give up the camp, 
	1 = The camp group will continue to guard the camp .
*/
	DAC_AI_Spawn		= [[10,5,5],[10,5,15],0,120,250,0]			};
	
if(isNil "DAC_Delete_Value") 	then {		
/*
This array defines the removal of dead units and destroyed vehicles . You can either use only one paramter  or combine both: 
[ 60,0 ] = only time is checked, 
[ 0,200 ] = only distance is checked, 
[ 30,150 ] = time first, then distance
1 .  Time (in sec.)  + minimum distance to all player units  before dead units get deleted
2 .  Time (in sec.)  + minimum distance to all player units  before  destroyed vehicles get deleted
3 .  Time in seconds, until an empty vehicle without a membership is destroyed (so that it can be deleted later)
*/
	DAC_Delete_Value	= [[3000,1500],[3000,1500],7200]};
	
if(isNil "DAC_Del_PlayerBody") 	then {		
/*
If needed you can activate the removal of dead player units (in MP) here. 
Occassionaly there ́s just too many corpses of dead players lying on the battlefield, depending on the used MP
- Respawn.
This function gets rid of them.
1 . soonest time in seconds for a dead player unit to be deleted
2 . minimum distance to all player nuits before a dead player unit gets deleted
*/
	DAC_Del_PlayerBody	= [0,0]};
	
if(isNil "DAC_Com_Values") 		then {	
/*	
With this array you enable/disable the output of system messages:
- The DAC system messages give you information about groups being reduced, units being deleted, 
zones being moved, groups being respawned, etc.
- During DAC initialization a popup hint will display waypoint & unit generation details aswell as DAC initialization time.
- DAC radio messages will inform you about actions/reactions of the AI, i.e. groups calling out contacts, 
request reinforcements, loose contacts, etc.
1 . DAC System messages: 0 = deactivated, 1 = activated
2 . DAC Initialization
- Hint: 0 = deactivated, 1 = minimal, 2 = maximal
3 . DAC Radio messages: 0 = Messages deactivated, 1 = opposing activated, 2 = friendly activated, 3 = all activated
4. DAC Monitor: 
0 = Monitor de - activated, 
1 = Monitor 
activated for all, 
“Name”= Only 
“Name”has Monitor
*/
	DAC_Com_Values		= [0,0,0,0]};

if(isNil "DAC_AI_AddOn") 		then {		
/*
At the moment only this setting is possible. Also the DAC AI cannot be deactivated.
You can do the following however: Make a copy of the  AI_1  folder and rename it to  AI_2 .
Thereafter this folder will be used whenever you set  DAC_AI_Add On =  2
This is useful if you want to modify some of the AI scripts without having to touch the original scipts.
That way you can easily switch between multiple AI folders.
*/	
	DAC_AI_AddOn		= 1};

if(isNil "DAC_AI_Level") 		then {		
/*
Values 1,2,3 & 4 are valid 
- with a value of 4 representeing the highest setting.
This setting influences AI behaviour. Lower values make the AI ́s reactions more sluggish and they will not notice you as fast.
The maximum number of reinforcement units is also influenced by this setting.
*/
	DAC_AI_Level		= 4};
	
if(isNil "DAC_Res_Side") 		then {	
/*
This  variable defines the side which  Independent are fighting for.
You must (!) apply the same settings that are given in the editor.
0 =  Independent friendly to EAST
1 =  Independent friendly to WEST
2 =  Independent friendly to NOBODY
Attention! With this setting independent will fight alone against EAST & WEST,  whereas EAST & WEST are friendly to each other!
*/	
DAC_Res_Side		= 0};

if(isNil "DAC_Marker") 			then {
/*
This paramter activates / deactivates the DAC marker.
You can load various marker configurations at any time by deactivating the markers and loading another configuration
afterwards.
Hint : 
In MP games, only Unit and zone - marker are displayed .
0 = DAC - marker deactivated , 
> 0 = valid configuration No . from the  DAC_Config_Marker
.  
Attention, you have to wait at least 3 seconds between activation & deactivation of markers.
*/
	DAC_Marker			= 0};
	
if(isNil "DAC_WP_Speed") 		then {	
/*
Waypoint generation speed. This value only affects this initialization phase.
Attention, value 0 causes a short stutte
r during initialization!
Upon moving of a zone always the default value 0.01 is used.
*/
	DAC_WP_Speed		= 0.01};

if(isNil "DAC_Join_Action")		then {	
/*
This option is currently just a test option and not fully supported. It’s also available for SP Mode only.
If this option has been activated (true), so you’ll receive an Action menu entry once you close up a friendly DAC - unit.
This menu entry would enable you to become that unit part of your group.	
*/
	DAC_Join_Action		= false};

if(isNil "DAC_Fast_Init") 		then {		
/*
This option is available in  Single player Mode only.
If this option has been activated (true), so while the DAC is about to get initiated the view distance will be reduced
to the most minimum value and the fog will be set on a maximum value.
This would cause a further CPU performance and would further help DAC to calculate the massive amount of 
operations without any massive lags. This would decrease the time of initialization on up to 40%.
If the initialization process has been finished,
the view distance and the fog value would be reset to the actual values.
*/
	DAC_Fast_Init		= false};
	
if(isNil "DAC_Player_Marker")	then {	
//	This options creates a marker for each player individually. This is for single player as well as for multiplayer Missions.	
	DAC_Player_Marker	= false};
	
if(isNil "DAC_Direct_Start")	then {		
/*
DAC is expecting  one DAC zone per default to become initiated. But if you  will activate this option (true), so you can
make the DAC initializing by the DAC Logic only.
This option is needed only if you want to become DAC zones created while a running mission, or if you want
to generate objects only.
*/
	DAC_Direct_Start	= true};

if(isNil "DAC_Activate_Sound")	then {		
//	This parameter is activating / deactivating DAC sounds, which are played in certain Situations.	
	DAC_Activate_Sound	= false};
	
if(isNil "DAC_Auto_UnitCount")	then {	
/*	
You can use this option to adjust the amount of DAC groups on the amount of player units dynamically. With other words : 
So more human players are present on the map (coop) so more DAC groups will be generated and conversely.
1. The amount of players which is set for the mission ( default setting for your mission).
2. The rate the DAC groups will increase or decrease in percent (for each player which is more or less participating the mission).
That doesn’t happen automatically, it  ́s furthermore possible to directly define the Zones resp.
the unit types, which are supposed to be part at automatism. May be you have a DAC
- Zone with following script call:

["z1",[1,0,0],[18,2,75,10],[ ],[ ],[ ],[1,1,1,1]] spawn DAC_Zone

That means, that exactly 18 infantry groups will be created right at missions start, whereas it makes no  difference how many players
are participating the mission.
To dynamically reduce or increase the amount of units of these 18 DAC
- groups, related to the number  of players, just set this number in quotes:

["z1",[1,0,0],["18",2,75,10],[ ],[ ],[ ],[1,1,1,1]] spawn DAC_Zone

You can use the se settings
individually in each zone for respective unit
- categories.
Below you find  some calculation examples about how 18 DAC groups would behave, outgoing from the  settings above [8,10]
If  8 players are participating the mission, DAC will create  18 groups (defined as default)
If  6 players are participating the mission, DAC will create  14 groups (18  – (2 x 10%))
If  4 players are participating the mission, DAC will create  10 groups (18  – (4 x 10%))
If  9 players are participating the mission, DAC will create  20 groups (18 + (1 x 10%))
If  11 players are participating the mission, DAC will create  23 groups (18 + (3 x 10%))
*/
	DAC_Auto_UnitCount	= [8,10]};
	
if(isNil "DAC_Player_Support")	then {	
/*
This option activates and configured the ground - and Artillery support for the Player.
To use this, a DAC Logic with the name "„ DAC_Support_Logic “ must be present.
1. Maximum amount of Artillery - requestions.
2. Maximum mount of ground support requestions.
3. Maximum range where a player is enable to request ground support (outgoing of the  position of the player)
4. Maximum amount of supporting groups which are providing ground support simultaneously
5. Maximum range where the System is searching for support groups. Further details about respective kind of support 
can be found on the pages : 
23 = The DAC - Artillery 24 = The DAC - ground support
*/	
	DAC_Player_Support	= [10,[4,2000,3,1000]]};
	
if(isNil "DAC_SaveDistance")	then {		
/*
Here you can define positions on the map, where no DAC - Waypoints and no units are supposed to be generated in these  areas
(during the start - phase).
May  be you want to start a Mission right within a huge DAC - Zone, so you can use following settings to make sure
that no DAC units will be created near your position.
1. The distance to given Objects, where no DAC waypoints have to be generated
2. The list of Objects (as string), which shall be considered while the distance measuring (e.g. a Logic)
It’s possible by the way to define several Objects: 
DAC_SaveDistance = [500,["savePos1","savePos2","savePos3"] ]
*/
	DAC_SaveDistance	= [500,["DAC_Save_Pos"]]};
	
if(isNil "DAC_Radio_Max")		then {		

	DAC_Radio_Max		= DAC_AI_Level};
	
//	One can enter types of buildings here which are either not used to be entered by the AI, or even not liked to get used by the creator for the mission.		
	DAC_BadBuildings 	= 	[];
	
//	This line declares the types of (empty) static weapons and vehicles  that  may not  be acquired by infantry units.
	DAC_GunNotAllowed	= 	[];
	DAC_VehNotAllowed	= 	[];
	
//	Here you can set editor placed vehicles, which may not be used by the AI.
	DAC_Locked_Veh		=	[];
	
//	The unit types which will provide supressed fire support, will be defined here.	
	DAC_SP_Soldiers     =   ["O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_Soldier_F",
							"O_G_Soldier_LAT_F","O_G_medic_F","O_G_Soldier_LAT2_F","O_G_Soldier_lite_F"
							 ];
							 
	DAC_Data_Array 		= 	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,[]];
	DAC_Marker_Val		= 	[];
	DAC_Zones			=	[];

	//=============================================================================================================|
	
	_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Start_Creator.sqf");
	waituntil {scriptdone _scr};
	sleep 0.1;
	waituntil {(DAC_Basic_Value > 0)};
	
if(DAC_Code < 2) then
{
	//===========================================|
	// StartScriptOnServer                       |
	//===========================================|
	//player sidechat "ServerStart"
	//[] execVM "myServerScript.sqf";
	//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
}
else
{
	if(DAC_Code == 3) then
	{
		//===========================================|
		// StartScriptOnJipClient                    |
		//===========================================|
		//player sidechat "JipClientStart"
		//[] execVM "myJipClientScript.sqf";
	}
	else
	{
		//===========================================|
		// StartScriptOnClient                       |
		//===========================================|
		//player sidechat "ClientStart"
		//[] execVM "myClientScript.sqf";
		//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
	};
};