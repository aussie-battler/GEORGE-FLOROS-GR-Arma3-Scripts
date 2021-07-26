


//________________  Author : GEORGE FLOROS [GR] ___________ 06.08.18 _____________

/*
________________ GF Blood Stains and SFX LITE Script ________________

https://forums.bohemia.net/forums/topic/218538-gf-blood-stains-and-sfx-lite-script/

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

WARNING!!!
This AddOn increases seriously the gore factor in ArmA.
It is not recommended for use by children under the age of 15 years.
*/


//	systemchat "GF_Blood_Pool_BIS_Blood";
	
//________________ Settings _____________
//________________ Set true or false  _____________


_Flies									= true; 	//	Spawns flies , around dead  
_Duration								= 20; 		//	Multiply the times (from 0 to ? ) with the sound (is 18 Sec)
													//	to find the Duration of the flies & SFX

													

											
//________________ Blood below the_body ________________		
_Blood_below_the_body =selectRandom[	
		"BloodPool_01_Large_New_F",			//1
		"BloodPool_01_Medium_New_F",		//2
		"BloodSplatter_01_Large_New_F",		//3
		"BloodSplatter_01_Medium_New_F",	//4
		"BloodSplatter_01_Small_New_F",		//5
		"BloodSpray_01_New_F",				//6
		"BloodTrail_01_New_F"				//7
		];	

		
sleep 1;
		
_Blood_Pool = createVehicle [_Blood_below_the_body, _this, [], 0, "CAN_COLLIDE"];
_Blood_Pool setDir (random 360);
//sleep 0.2;
//_Blood_Pool attachTo [_this, [0,0,0]];
//detach _Blood_Pool;



if (_Flies) then {

//	systemchat "_Flies";

if (!(underwater _this) or ((getPosASLW _this select 2) > -1.5)) then {

	//Spawns flies around position. 
	//https://community.bistudio.com/wiki/BIS_fnc_flies
	_Spawn_Flies = [position _this, 1.3, 0.2] call BIS_fnc_flies;
			
	_Flies_SFX = "#particlesource" createVehicleLocal [0,0,0];	
	_Flies_SFX attachTo [_this, [0,0,0]];

_x = 0;

//	Multiply the times (from 0 to ? ) with the sound (is 18 Sec)
//	to find the Duration of the flies & SFX

for "_x" from 1 to _Duration do {
	_Flies_SFX say3D "Flies_SFX";
	//	systemchat "say3D Flies_SFX";
    sleep 18; 
};

	//	systemchat "deleteVehicle _Flies_SFX";

	{deleteVehicle _x;} count _Spawn_Flies;

};

};