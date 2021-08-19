


//________________  Author : [GR]GEORGE F ___________ 08.06.18 _____________

/*
________________ GF Ravage Status Bar Script ________________

https://forums.bohemia.net/forums/topic/215645-ravage-status-bar-gf-script/?tab=comments#comment-3279085

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


//________________ This is Extra ________________
//________________ Enemies will drop items when killed ________________
addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer"];	
	if (_killed isKindOf "CAManBase"  

/*	
	&& {(	
		(side group _killed) == east || 
		(side group _killed) == independent || 		
		(side group _killed) == west)	
		}
*/		
		) then
	{
	//systemChat format ["killed"];
	
	[[
		["killed","align = 'center' size = '1' font='PuristaBold'","#FBFCFE"]
	]]spawn BIS_fnc_typeText2;
	
			_unit 		= _this select 0;
			_uniform	= uniformContainer _unit;
			
			// add money to uniform
			_uniform addItemCargoGlobal		["rvg_money", 5];		
			
			_wh = "groundWeaponHolder" createVehicle (getpos _unit);
			_wh addItemCargoGlobal [
			[
			"rvg_money",
			"rvg_plasticBottlePurified", 
			"rvg_rice",			
			"FirstAidKit",
			"ItemCompass",
			"ItemWatch",
			"ItemMap",
			"ItemRadio",
			// Ravage_items
			"rvg_money",
			"rvg_money", 
			"rvg_money",
			"rvg_money",			
			"rvg_flare",
			"rvg_rustyCanEmpty",
			"rvg_beansEmpty",
			"rvg_baconEmpty",
			"rvg_spiritEmpty",
			"rvg_frantaEmpty",
			"rvg_plasticBottleEmpty",
			"rvg_canteenEmpty",  			
			"rvg_notepad", 
			"rvg_canOpener",
			"rvg_guttingKnife",
			"rvg_matches",
			"rvg_plasticBottle",
			"rvg_plasticBottlePurified", 
			"rvg_spirit", 
			"rvg_franta",
			"rvg_beans", 
			"rvg_bacon", 
			"rvg_milk", 
			"rvg_rice",
			"rvg_rustyCan",
			"rvg_antiRad",
			"rvg_purificationTablets"		
			]call BIS_fnc_selectRandom
			,2];			
	};
}];

