


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


diag_log "//________________ GF_Blood_Shot Script _____________";

systemchat "GF_Blood_Shot Script    I n i t i a l i z e d";
  
GF_Set_Blood_Shot = { 
_this addEventHandler ["hitPart", {

	 	_target    = (_this select 0) select 0;
	 	_shooter   = (_this select 0) select 2;
				
		_target setBleedingRemaining 0;          
	
		//	systemchat "GF_Set_Blood_Shot";

//________________ Settings _____________
//________________ Set true or false  _____________


_1__Blood_Shot_Normal					= false; 	//	Create a Normal Blood Pool ( No addon requierements ) *** Not GOOD ! ***
												// 	It needs to be a horizontal object ( VR_GroundIcon_01_F ) ** UserTexture1m_F

//	To add more reflex or change size
_2__Blood_Shot_Normal_ORANGE_DLC			= true; 	//	Create a Normal Blood Pool ( "BloodSplatter_01_Small_New_F" from ORANGE DLC )
_3__Blood_Shot_Large_ORANGE_DLC			= false; 	//	Create a Large Blood Pool  ( "BloodSplatter_01_Large_New_F" from ORANGE DLC )
	
_4_Test_Surfaces						= false; 	// 	In order to test the selected spawn 3d object


		

//________________ Images  _____________
		
_Blood_Shot_List =selectRandom[	

			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\2_Blood_Shot.paa",	
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\6_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\8_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\9_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\10_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\11_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\12_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\13_Blood_Shot.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Shot\14_Blood_Shot.paa",						
					
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Spray\3_Blood_Spray.paa",	
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Spray\8_Blood_Spray.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Spray\9_Blood_Spray.paa",
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Spray\13_Blood_Spray.paa",				
			"GF_Blood_Stains_LITE\GF_Blood_Shot_LITE\GF_Blood_Shot_images_1024\GF_Blood_Spray\15_Blood_Spray.paa"	
			];
			
			
_Pos_shooter = eyePos _shooter;
_end_Pos = positionCameraToWorld [0,0,1000];
_end_PosASL = AGLToASL _end_Pos;			


_GF_lineIntersectsSurfaces = lineIntersectsSurfaces [	
	_Pos_shooter,
	_end_PosASL,		
	objNull,
    objNull,
	true,
	1,
	"VIEW",
	"NONE"
	];
if (count _GF_lineIntersectsSurfaces == 0) exitWith {
		_Blood_Shot_Normal_ORANGE_DLC setPos [0,0,0]
};			

//	hintSilent str _GF_lineIntersectsSurfaces;			


			
if (_1__Blood_Shot_Normal) then {	
			
_Blood_Shot_Normal = "VR_GroundIcon_01_F" createVehicle [0,0,0];
_Blood_Shot_Normal setObjectTexture [0,_Blood_Shot_List];
_Blood_Shot_Normal setDir random 360;

_Blood_Shot_Normal setPosASL (_GF_lineIntersectsSurfaces select 0 select 0); 
_Blood_Shot_Normal setVectorUp (_GF_lineIntersectsSurfaces select 0 select 1);			
			
};
			
			
if (_2__Blood_Shot_Normal_ORANGE_DLC) then {

_Blood_Shot_Normal_ORANGE_DLC = "BloodSplatter_01_Small_New_F" createVehicle [0,0,0];
_Blood_Shot_Normal_ORANGE_DLC setObjectTexture [0,_Blood_Shot_List];
_Blood_Shot_Normal_ORANGE_DLC setDir random 360;

_Blood_Shot_Normal_ORANGE_DLC setPosASL (_GF_lineIntersectsSurfaces select 0 select 0); 
_Blood_Shot_Normal_ORANGE_DLC setVectorUp (_GF_lineIntersectsSurfaces select 0 select 1);
	
};
	
	
if (_3_Blood_Shot_Large_ORANGE_DLC) then {

_Blood_Shot_Large_ORANGE_DLC = "BloodSplatter_01_Large_New_F" createVehicle [0,0,0];
_Blood_Shot_Large_ORANGE_DLC setObjectTexture [0,_Blood_Shot_List];
_Blood_Shot_Large_ORANGE_DLC setDir random 360;

_Blood_Shot_Large_ORANGE_DLC setPosASL (_GF_lineIntersectsSurfaces select 0 select 0); 
_Blood_Shot_Large_ORANGE_DLC setVectorUp (_GF_lineIntersectsSurfaces select 0 select 1);

};



//________________ _1__CHECK_Surfaces test _____________		
if (_4_Test_Surfaces) then {	
	
	_CHECK_Surfaces = "BloodSplatter_01_Small_New_F" createVehicle [0,0,0];
	onEachFrame {
	_ins_Test = lineIntersectsSurfaces [
		AGLToASL positionCameraToWorld [0,0,0], 
		AGLToASL positionCameraToWorld [0,0,1000], 
		player
	];
	if (count _ins_Test == 0) exitWith {_CHECK_Surfaces setPosASL [0,0,0]};
	_CHECK_Surfaces setPosASL (_ins_Test select 0 select 0); 
	_CHECK_Surfaces setVectorUp (_ins_Test select 0 select 1);
	
	//	hintSilent str _ins_Test;
	};
	
};	



}];};


[] spawn {
	while {true} do {
    _time = diag_tickTime + 1;
    _i = 0;
    waitUntil {
	sleep 2;
        _i = _i + 1;		
        diag_tickTime >= _time
    };	
    //	hint format ["Code executed %1 times per second", _i];
	
	{	
		if (((alive _x)) && (!(_x getVariable ["EΗ_GF_Set_Blood_Shot",false]))) then {
			_x call GF_Set_Blood_Shot};						
			_x setVariable ["EΗ_GF_Set_Blood_Shot",true];	

			{waitUntil {!alive _x};
			_x setVariable ["EΗ_GF_Set_Blood_Shot",false];		 
		};
	}forEach allUnits;	

	};
};