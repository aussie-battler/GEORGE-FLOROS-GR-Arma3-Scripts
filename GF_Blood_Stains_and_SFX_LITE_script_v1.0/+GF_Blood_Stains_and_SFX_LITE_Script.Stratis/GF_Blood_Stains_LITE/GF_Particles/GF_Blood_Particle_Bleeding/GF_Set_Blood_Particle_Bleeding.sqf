


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


diag_log "//________________ GF_Blood_Particle_Bleeding Script _____________";

systemchat "GF_Blood_Particle_Bleeding Script    I n i t i a l i z e d";

Detect_Bullet_Hit_Particle_Bleeding = {

	_target			= _this select 0;
	_Detect_Hit		= _this select 5;
	
    //	systemChat format ["%1", _Detect_Hit];
	
	//"spine3","head","body","hands","legs"
	
	_target setBleedingRemaining 0;   
	if ((damage _target > 0.20		//	the code will run in 80% Life (0.20) , 1 is dead
	) && (damage _target < 0.99 )	//	don't run the code if dead
	)then {
	
call {


	//________________	1.	head	________________
	
	if ("head" in _Detect_Hit) exitWith {
	
	//https://community.bistudio.com/wiki/ParticleArray 	\a3\Data_f\ParticleEffects\Universal\Universal
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.4 - (random 0.6)),(0.4 - (random 0.6)),(0.4 + (random 0.6))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"head"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";		
	};

	
	//________________	2.	spine1 and spine3	________________
	//________________	otherwise spine1 doesn't attach	________________
	
	if (("spine1" in _Detect_Hit) or ("spine3" in _Detect_Hit)) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.4 - (random 0.4)),(0.4 - (random 0.4)),(0.4 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"spine3"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";		
	
	};

	
	//________________	3.	rightarm and rightforearm == rightforearm	________________
	//________________	otherwise it doesn't attach to arms	________________
	
	if (("rightarm" in _Detect_Hit) or ("rightforearm" in _Detect_Hit)) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"rightforearm"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};

	
	//________________	4.	leftarm and leftforearm == leftforearm	________________
	//________________	otherwise it doesn't attach to arms	________________
	
	if (("leftarm" in _Detect_Hit) or ("leftforearm" in _Detect_Hit)) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"leftforearm"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};
	
	
	//________________	5.	leftupleg 	________________
		
	if ("leftupleg" in _Detect_Hit) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"leftupleg"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};	
	

	//________________	6.	leftleg	________________
	
	if ("leftleg" in _Detect_Hit) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"leftleg"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};	
	
	//________________	7.	rightupleg 	________________
		
	if ("rightupleg" in _Detect_Hit) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"rightupleg"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};	
	

	//________________	8.	rightleg	________________
	
	if ("rightleg" in _Detect_Hit) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"rightleg"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};		
	
	
		//________________	9.	leftfoot 	________________
		
	if ("leftfoot" in _Detect_Hit) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"leftfoot"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};	
	

	//________________	8.	rightfoot	________________
	
	if ("rightfoot" in _Detect_Hit) exitWith {
		
	GF_Blood_Particle_Bleeding = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Bleeding setParticleParams	[
	["\a3\Data_f\ParticleEffects\Universal\Universal", 16, 14, 0, 0],	
	"",
	"Billboard",
	1,																	
	0.4,																	
	[0,0,0],															
	[(0.2 - (random 0.4)),(0.2 - (random 0.4)),(0.2 + (random 0.4))],	
	1,0.32,0.2,0.05,												
	[0.03,0.25],														
	[[0.3,0.01,0.01,1],[0.2,0.01,0.01,0]],								
	[0.1],																
	1,																	
	0.5,															
	"",																	
	"",																	
	GF_Blood_Particle_Bleeding															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Bleeding setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 1],		
	1,					
	1,					
	10					
	];

	
	GF_Blood_Particle_Bleeding setDropInterval 0.02;		
	GF_Blood_Particle_Bleeding attachTo [_target,[0,0,0.1],"rightfoot"];	
	_target setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Bleeding];		
	_target execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
	
	};	
	
	
};	
};
};


GF_Set_Blood_Particle_Bleeding = { 
_this addEventHandler ["hitpart", {(_this select 0) call Detect_Bullet_Hit_Particle_Bleeding}];
};


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
		if (((alive _x)) && (!(_x getVariable ["EΗ_GF_Set_Blood_Particle_Bleeding",false]))) then {
			_x call GF_Set_Blood_Particle_Bleeding};						
			_x setVariable ["EΗ_GF_Set_Blood_Particle_Bleeding",true];	

			{waitUntil {!alive _x};
			_x setVariable ["EΗ_GF_Set_Blood_Particle_Bleeding",false];				
		};
	}forEach allUnits;	

	};
};