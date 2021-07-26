


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

			
//________________	GF_Missions_Intel	________________
/*
	Set the position inside the mission
	define the pos
	ex : GF_Missions_Intel_Pos = getpos player;
	and to use this :
	[] spawn GF_Missions_Intel;
*/


GF_Missions_addAction_Intel = {
//	Add Picture
_this setVariable ["RscAttributeDiaryRecord_texture","a3\structures_f_epc\Items\Documents\Data\document_secret_01_co.paa", true];

//	Add	Diary
[_this,"RscAttributeDiaryRecord",["Intel Found","Intel Found about enemies",""]] call BIS_fnc_setServerVariable;	

//	addaction
[_this,[
    "<t size=""1.2"" font=""RobotoCondensedBold"" color=""#FF9933"">" + "Get Intel", 
    {
		[_this,"action"] spawn BIS_fnc_initIntelObject;
    },
    [],1.5,true,true,"","true",8,false,"", ""
]] remoteExec ["addAction",0,true];
};

GF_Missions_Intel = {

_array = [
	
	"Land_Document_01_F",
	"Land_File1_F",
	"Land_FilePhotos_F",
	"Land_File2_F",
	"Land_File_research_F",
	"Land_Notepad_F",
	"Land_HandyCam_F",
	"Land_Laptop_F",
	"Land_Laptop_device_F",
	"Land_Laptop_unfolded_F",
	"Land_MobilePhone_smart_F",
	"Land_Tablet_02_F",
	"Land_SatellitePhone_F",
	"Land_DataTerminal_01_F"
];
	
_selectRandom = selectRandom _array;

_Intel = createVehicle [_selectRandom, [GF_Missions_Intel_Pos select 0, GF_Missions_Intel_Pos select 1,GF_Missions_Intel_Pos select 2], [], 0, "NONE"];

_Intel call GF_Missions_addAction_Intel;
};