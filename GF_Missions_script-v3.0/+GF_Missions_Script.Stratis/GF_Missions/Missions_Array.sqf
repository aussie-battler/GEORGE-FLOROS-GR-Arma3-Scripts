


//________________  Author : GEORGE FLOROS [GR] ___________ 16.12.18 _____________

/*
________________ GF Missions Script ________________

https://forums.bohemia.net/forums/topic/219080-gf-missions-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


diag_log "//________________ GF_Missions_Array _____________";

//________________	You can comment below the missions that you don't want to use :	________________

	
GF_Missions_Array = [

//________________ Missions Folder _____________

"GF_Missions\Mission_Pack\Missions\1_Eliminate_Spy.sqf",
"GF_Missions\Mission_Pack\Missions\2_Eliminate_Spy_2.sqf",
"GF_Missions\Mission_Pack\Missions\3_Eliminate_Suspects.sqf",
"GF_Missions\Mission_Pack\Missions\4_Snipers_Hide.sqf",
"GF_Missions\Mission_Pack\Missions\5_Search_Stolen.sqf",
"GF_Missions\Mission_Pack\Missions\6_Trader_Camp.sqf",
"GF_Missions\Mission_Pack\Missions\7_Clear_Bunker.sqf",
"GF_Missions\Mission_Pack\Missions\8_Prisoners_Escaped.sqf",
"GF_Missions\Mission_Pack\Missions\9_Move_to.sqf",
"GF_Missions\Mission_Pack\Missions\10_Move_to_Escort.sqf",
"GF_Missions\Mission_Pack\Missions\11_Rescue_Hostage.sqf",
"GF_Missions\Mission_Pack\Missions\12_Find_Intel.sqf",
"GF_Missions\Mission_Pack\Missions\13_Transport_Prisoners.sqf",
"GF_Missions\Mission_Pack\Missions\14_Escort_Special_Police_Unit.sqf",
"GF_Missions\Mission_Pack\Missions\15_Find_the_Prisoners.sqf",


//________________ Missions_Big Folder _____________

"GF_Missions\Mission_Pack\Missions_Big\1_Big_Clear_Area.sqf",
"GF_Missions\Mission_Pack\Missions_Big\2_Big_Clear_Residential_Area.sqf",
"GF_Missions\Mission_Pack\Missions_Big\3_Big_Clear_City.sqf",
"GF_Missions\Mission_Pack\Missions_Big\4_Big_Clear_Village.sqf",
"GF_Missions\Mission_Pack\Missions_Big\5_Big_Clear_Mount.sqf",
"GF_Missions\Mission_Pack\Missions_Big\6_Big_Clear_Hill.sqf",
"GF_Missions\Mission_Pack\Missions_Big\7_Big_Clear_Area_2.sqf",
"GF_Missions\Mission_Pack\Missions_Big\8_Big_Clear_Area_Airport_Tanoa_Only.sqf",
"GF_Missions\Mission_Pack\Missions_Big\9_Big_Destroy_Weaponry.sqf",
"GF_Missions\Mission_Pack\Missions_Big\10_Big_Destroy_Storage_Tank.sqf",
"GF_Missions\Mission_Pack\Missions_Big\11_Big_Destroy_Weapon_Caches.sqf",
"GF_Missions\Mission_Pack\Missions_Big\12_Big_Disable_Transmitter.sqf",
"GF_Missions\Mission_Pack\Missions_Big\13_Big_Disable_Communications.sqf",
"GF_Missions\Mission_Pack\Missions_Big\14_Big_Search_Airdrop.sqf",
"GF_Missions\Mission_Pack\Missions_Big\15_Big_Search_Crashsite.sqf",
"GF_Missions\Mission_Pack\Missions_Big\16_Big_Search_Device.sqf",
"GF_Missions\Mission_Pack\Missions_Big\17_Big_Search_for_Supplies.sqf",


//________________ Missions_Air Folder _____________

"GF_Missions\Mission_Pack\Missions_Air\1_Big_Clear_Air_Zone.sqf",
"GF_Missions\Mission_Pack\Missions_Air\1_Big_Clear_Air_Zone_Helicopters.sqf",
"GF_Missions\Mission_Pack\Missions_Air\1_Big_Clear_Air_Zone_Planes.sqf",


//________________ Missions_Water Folder _____________

"GF_Missions\Mission_Pack\Missions_Water\1_Big_Clear_Area_Water.sqf"	
];


//________________	To test a certain mission you can comment the above and use :	________________

//	GF_Missions_Array = ["GF_Missions\Mission_Pack\Missions\1_Eliminate_Spy.sqf"];	