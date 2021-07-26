


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

			
//________________	GF_Missions_Police_Offroad	________________
/*
	Set the position inside the mission
	define the pos
	ex : GF_Missions_Police_Offroad_Pos = getpos player;
	and to use this :
	
	//________________	GF_Missions_Police_Offroad	________________

	_Offroad = "C_Offroad_01_white_F" createVehicle _Pos_1;

	GF_Missions_Police_Offroad_Pos = _Pos_1;
	_Offroad spawn GF_Missions_Police_Offroad;
*/


GF_Missions_Police_Offroad = {

//________________	Randomization options	________________

[_this, false, [
	"HidePolice", 0, 
	"HideServices", 1, 
	"HideBackpacks", 1, 
	"HideBumper1", 1, 
	"HideBumper2", 0, 
	"HideConstruction", 0
]] call BIS_fnc_initVehicle;

//________________	addItemCargo	________________
_this addItemCargo ["H_Beret_blk_POLICE", 2];
_this addItemCargo ["H_Cap_police", 2];
_this addItemCargo ["V_TacVest_blk_POLICE", 4];

//________________	_Primary_Weapon	________________

_Primary_Weapon = selectRandom GF_SCL_GF_Missions_primaryWeapon_array;

//________________	add _Primary_Weapon's mags	________________

_Primary_Weapon_Magazines_Array = getArray (configFile / "CfgWeapons" / _Primary_Weapon / "magazines");
_Primary_Weapon_magazines = selectRandom _Primary_Weapon_Magazines_Array; 

_this addItemCargo [_Primary_Weapon, 4];
_this addItemCargo [_Primary_Weapon_magazines, 20];
};