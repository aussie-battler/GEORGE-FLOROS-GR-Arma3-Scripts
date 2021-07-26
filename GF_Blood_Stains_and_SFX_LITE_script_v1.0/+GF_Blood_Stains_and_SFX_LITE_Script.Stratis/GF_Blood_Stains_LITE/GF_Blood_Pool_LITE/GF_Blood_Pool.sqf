


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


//	systemchat "GF_Blood_Pool";

//________________ Settings _____________
//________________ Set true or false  _____________


_1_Normal_Blood_Pool					= false; 	//	Create a Normal Blood Pool ( No addon requierements )	UserTexture1m_F

//	To add more reflex or change size
_2_Normal_Blood_Pool_ORANGE_DLC			= true; 	//	Create a Normal Blood Pool ( "BloodSplatter_01_Small_New_F" from ORANGE DLC )
_3_Large_Blood_Pool_ORANGE_DLC			= false; 	//	Create a Large Blood Pool  ( "BloodSplatter_01_Large_New_F" from ORANGE DLC )

_Flies									= true; 	//	Spawns flies , around dead  
_Duration								= 20; 		//	Multiply the times (from 0 to ? ) with the sound (is 18 Sec)
													//	to find the Duration of the flies & SFX
	

	
	
//big thanks to KK and davidoss
//https://forums.bohemia.net/forums/topic/145648-how-to-create-blood-stains-on-ground-bullet-hit-blood-fx-and-burning-shard-fx/?page=2&tab=comments#comment-3089531

fnc_randomPerpVector = compile
"
 _x1 = _this select 0;
 _y1 = _this select 1;
 _z1 = _this select 2;
 _dir = _this select 3;
 
 if (_z1 == 0) then {_z1 = selectRandom [-0.00000001, 0.00000001];};
 
_h = 450 - _dir;
_dir2 = 0;
if ( _h >= 360) then { _dir2 = _h - 360 ;} else {_dir2 = _h;};

 _x2 = cos _dir2;
 _y2 = sin _dir2;
 _z2 = (-(_x1 * _x2) - (_y1  * _y2)) / _z1;
 
 vectorNormalized [_x2, _y2, _z2] 
";


//________________ Images  _____________

_Blood_Pool_List =selectRandom[	

		"GF_Blood_Stains_LITE\GF_Blood_Pool_LITE\GF_Blood_Pool_images_1024\9_Blood_Pool.paa",
		"GF_Blood_Stains_LITE\GF_Blood_Pool_LITE\GF_Blood_Pool_images_1024\10_Blood_Pool.paa",
		"GF_Blood_Stains_LITE\GF_Blood_Pool_LITE\GF_Blood_Pool_images_1024\13_Blood_Pool.paa",
		"GF_Blood_Stains_LITE\GF_Blood_Pool_LITE\GF_Blood_Pool_images_1024\28_Blood_Pool.paa",
		"GF_Blood_Stains_LITE\GF_Blood_Pool_LITE\GF_Blood_Pool_images_1024\30_Blood_Pool.paa"
		];


		
if (_1_Normal_Blood_Pool) then {

sleep 1;

_Blood_Pool = createVehicle ["UserTexture1m_F",[getPosATL _this select 0,getPosATL _this select 1,(getPosATL _this select 2) + 0.01],[],0,"CAN_COLLIDE"];
_Blood_Pool setObjectTexture [0,_Blood_Pool_List];
_Blood_Pool setDir (random 360);

_Blood_Pool setVectorDirAndUp [(surfaceNormal position _Blood_Pool) vectorMultiply -1, [(surfaceNormal position _Blood_Pool) select 0, (surfaceNormal position _Blood_Pool) select 1, (surfaceNormal position _Blood_Pool) select 2, getdir player] call fnc_randomPerpVector];

};


if (_2_Normal_Blood_Pool_ORANGE_DLC) then {

sleep 1;

_Blood_Pool = createVehicle ["BloodSplatter_01_Small_New_F",[getPosATL _this select 0,getPosATL _this select 1,(getPosATL _this select 2) + 0.01],[],0,"CAN_COLLIDE"];
_Blood_Pool setObjectTexture [0,_Blood_Pool_List];
_Blood_Pool setDir (random 360);

};


if (_3_Large_Blood_Pool_ORANGE_DLC) then {

sleep 1;

_Blood_Pool = createVehicle ["BloodSplatter_01_Large_New_F",[getPosATL _this select 0,getPosATL _this select 1,(getPosATL _this select 2) + 0.01],[],0,"CAN_COLLIDE"];
_Blood_Pool setObjectTexture [0,_Blood_Pool_List];
_Blood_Pool setDir (random 360);

};


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