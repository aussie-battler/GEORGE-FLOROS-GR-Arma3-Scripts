


//________________  Author : GEORGE FLOROS [GR] ___________ 10.08.18 _____________

/*
________________ GF Skinning Script ________________

https://forums.bohemia.net/forums/topic/218636-gf-skinning-script/

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


/*
Big thanks to Killzonekid , for his ArmA Scripting Tutorials
http://killzonekid.com/category/tutorials/
*/


//systemchat "GF Skinning Script";

//________________	You can add edit the exclude list here	________________
//	These are the Ravage zombies
_Exclude_List = [
	"zombie_bolter",
	"zombie_runner",
	"zombie_walker"
	]; 

{
if (
	((typeOf _x) in _Exclude_List)
	) then {
	_x setVariable ["GF_Skinning_Exclude_List", true];
	};
} forEach AllDead;


if 
	((GF_Skinning_Killed getVariable ["GF_Skinning_Exclude_List",false]))
	exitWith {

	systemchat"I'm not skinning that !";	
	cutText [format["I'm not skinning that !"], "PLAIN DOWN"];	
};

	

//________________	Check if there is a Knife inside the inventory  ( magazines or items )	________________
_Check_magazines = magazines GF_Skinning_Killer;
//or	
_Check_items = items GF_Skinning_Killer;


//________________	Check if it is already skinned	________________
if 
	((GF_Skinning_Killed getVariable ["GF_Skinning_Skinned",false]))
	exitWith {

	systemchat"There is nothing left";	
	cutText [format["There is nothing left"], "PLAIN DOWN"];	
};


if (
	//	Ravage
	("rvg_guttingKnife" in _Check_magazines) 
	or
	//	Heros Survive
	("herl_u_Knife" in _Check_items) 
	&& (!(GF_Skinning_Killed getVariable ["GF_Skinning_Skinned",false]))
	) then {

	systemchat"I've started skinning the body";	
	cutText [format["I've started skinning the body"], "PLAIN DOWN"];	//	DOWN
						
	GF_Skinning_Killer playActionNow "medicStartRightSide";

	//________________	add your desired game SFX here , i did't find anything good for this !	________________	
	_BIS_sfx = selectRandom[
	"A3\Missions_F_Bootcamp\data\sounds\assemble_target.wss"
	];			
	
	//[playSound3D [_BIS_sfx,GF_Skinning_Killed]] call BIS_fnc_MP;

	
	//________________	add your custom SFX 
	_GF_Skinning_SFX_pos = "#particlesource" createVehicleLocal [0,0,0];	
	_GF_Skinning_SFX_pos attachTo [GF_Skinning_Killed, [0,0,0]];
	
	_GF_Skinning_SFX =selectRandom[	
	"Skinning_1",
	"Skinning_2",
	"Skinning_3"
	];

	//This is not working in MP ?! if anyone knows , please inform me.	
	//[_GF_Skinning_SFX_pos,[_GF_Skinning_SFX,50]] remoteExec ["say3d"];

	_GF_Skinning_SFX_pos say3D _GF_Skinning_SFX;	

	sleep 2;
	
	//________________	Enable this to affect only the internal camera	________________
	//if (cameraView != "EXTERNAL") then {
	enableCamShake true;
	addCamShake [7, 4, 4];
	[100] call BIS_fnc_bloodEffect;
	sleep 4;
	addCamShake [10, 7, 2];	
	[50] call BIS_fnc_bloodEffect;
	sleep 4;
	addCamShake [8, 6, 3];
	[50] call BIS_fnc_bloodEffect;	
	sleep 5;
	enableCamShake false;
	//};	
	GF_Skinning_Killer playActionNow "medicStop";
	
	sleep 1;	

	systemchat"I've skinned and quarterd the body";	
	cutText [format["I've skinned and quarterd the body"], "PLAIN DOWN"];	


	_Drop_Items = createVehicle ["GroundWeaponHolder", position GF_Skinning_Killer, [], 0, "CAN_COLLIDE"];
	_Drop_Items setPosATL [(getPosATL GF_Skinning_Killer) select 0, (getPosATL GF_Skinning_Killer) select 1, ((getPosATL GF_Skinning_Killer) select 2) - 0.25];
	
	
	//________________	Select the meat loot and add below	________________		
	_Ravage_Loot_type = selectrandom ["rvg_Sheep_Meat","rvg_Rabbit_Meat","rvg_Chicken_Meat"];	
	_Heros_Survive_Loot_type = selectrandom ["herl_u_RawM","herl_u_RawM"];
	
	//________________	Drop the meat loot	________________	
	_Drop_Items addItemCargoGlobal [_Ravage_Loot_type, (1 + random 5)];
	//_Drop_Items addItemCargoGlobal [_Heros_Survive_Loot_type, (1 + random 5)];
		
	GF_Skinning_Killer action ["Gear", _Drop_Items];
	GF_Skinning_Killed setVariable ["GF_Skinning_Skinned", true];

} else {
	systemchat"I must find a knife";	
	cutText [format["I must find a knife"], "PLAIN DOWN"];	
};