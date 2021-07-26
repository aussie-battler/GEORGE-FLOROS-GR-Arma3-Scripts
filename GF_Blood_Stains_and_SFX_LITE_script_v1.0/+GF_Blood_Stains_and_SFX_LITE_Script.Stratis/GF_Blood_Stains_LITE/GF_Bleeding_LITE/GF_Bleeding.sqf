


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


//	systemchat "START GF_Bleeding";

//________________ Settings _____________
//________________ Set true or false  _____________


_1_Normal_Blood_Bleeding				= false; 	//	Create a Normal Bleeding ( No addon requierements )	UserTexture1m_F

//	To add more reflex or change size
_2_Normal_Blood_Bleeding_ORANGE_DLC		= true; 	//	Create a Normal Bleeding ( "BloodSplatter_01_Small_New_F" from ORANGE DLC )
_3_Large_Blood_Bleeding_ORANGE_DLC		= false; 	//	Create a Large Bleeding  ( "BloodSplatter_01_Large_New_F" from ORANGE DLC )




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


		
if (_1_Normal_Blood_Bleeding) then {
_x = 0;

// The number of the blood drops to spawn (on random)
for "_x" from 0 to (15 + (random 50)) do {

// How much time to wait for the next blood drop
sleep (0.5 + random 4);

//	systemchat "GF_Bleeding";

//________________ Images  _____________

_Blood_Bleeding_List =selectRandom[	

		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\1_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\2_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\6_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\9_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\10_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\14_Blood_Bleeding.paa",						
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\17_Blood_Bleeding.paa",			
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\29_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\30_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\31_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\32_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\32_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\54_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\55_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\56_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\57_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\58_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\59_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\60_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\61_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\64_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\72_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\74_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\80_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\92_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\95_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\97_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\99_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\100_Blood_Bleeding.paa"
		];
		
_Blood_Bleeding = createVehicle ["UserTexture1m_F",[getPosATL _this select 0,getPosATL _this select 1,(getPosATL _this select 2) + 0.01],[],0,"CAN_COLLIDE"];
_Blood_Bleeding setObjectTexture [0,_Blood_Bleeding_List];
_Blood_Bleeding setDir (random 360);

_Blood_Bleeding setVectorDirAndUp [(surfaceNormal position _Blood_Bleeding) vectorMultiply -1, [(surfaceNormal position _Blood_Bleeding) select 0, (surfaceNormal position _Blood_Bleeding) select 1, (surfaceNormal position _Blood_Bleeding) select 2, getdir player] call fnc_randomPerpVector];

};
};


if (_2_Normal_Blood_Bleeding_ORANGE_DLC) then {
_x = 0;

// The number of the blood drops to spawn (on random)
for "_x" from 0 to (15 + (random 50)) do {

// How much time to wait for the next blood drop
sleep (0.5 + random 4);

//	systemchat "GF_Bleeding";
		
//________________ Images  _____________

_Blood_Bleeding_List =selectRandom[	

		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\1_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\2_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\6_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\9_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\10_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\14_Blood_Bleeding.paa",						
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\17_Blood_Bleeding.paa",			
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\29_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\30_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\31_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\32_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\32_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\54_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\55_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\56_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\57_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\58_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\59_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\60_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\61_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\64_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\72_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\74_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\80_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\92_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\95_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\97_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\99_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\100_Blood_Bleeding.paa"
		];
		
_Blood_Bleeding = createVehicle ["BloodSplatter_01_Small_New_F",[getPosATL _this select 0,getPosATL _this select 1,(getPosATL _this select 2) + 0.01],[],0,"CAN_COLLIDE"];
_Blood_Bleeding setObjectTexture [0,_Blood_Bleeding_List];
_Blood_Bleeding setDir (random 360);

};
};


if (_3_Large_Blood_Bleeding_ORANGE_DLC) then {
_x = 0;

// The number of the blood drops to spawn (on random)
for "_x" from 0 to (15 + (random 50)) do {

// How much time to wait for the next blood drop
sleep (0.5 + random 4);

//	systemchat "GF_Bleeding";
		
//________________ Images  _____________

_Blood_Bleeding_List =selectRandom[	

		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\1_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\2_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\6_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\9_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\10_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\14_Blood_Bleeding.paa",						
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\17_Blood_Bleeding.paa",			
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\29_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\30_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\31_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\32_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\32_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\54_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\55_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\56_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\57_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\58_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\59_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\60_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\61_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\64_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\72_Blood_Bleeding.paa",	
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\74_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\80_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\92_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\95_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\97_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\99_Blood_Bleeding.paa",
		"GF_Blood_Stains_LITE\GF_Bleeding_LITE\GF_Bleeding_images_1024\100_Blood_Bleeding.paa"
		];
		
_Blood_Bleeding = createVehicle ["BloodSplatter_01_Large_New_F",[getPosATL _this select 0,getPosATL _this select 1,(getPosATL _this select 2) + 0.01],[],0,"CAN_COLLIDE"];
_Blood_Bleeding setObjectTexture [0,_Blood_Bleeding_List];
_Blood_Bleeding setDir (random 360);

};
};