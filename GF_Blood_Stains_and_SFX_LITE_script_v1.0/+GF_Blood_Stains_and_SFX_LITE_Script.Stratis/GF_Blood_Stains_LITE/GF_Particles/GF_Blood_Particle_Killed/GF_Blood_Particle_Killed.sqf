


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


	//systemchat "GF_Blood_Particle_Killed";
	
	
	//https://community.bistudio.com/wiki/ParticleArray 	\a3\Data_f\ParticleEffects\Universal\Universal
	GF_Blood_Particle_Killed = "#particlesource" createVehicleLocal Position CursorTarget;
	GF_Blood_Particle_Killed setParticleParams	[
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
	GF_Blood_Particle_Killed															
	];
	
	
	//https://community.bistudio.com/wiki/setParticleRandom
	GF_Blood_Particle_Killed setParticleRandom	[
	3,					
	[0, 0, 0],			
	[0.0, 0.0, 0.0],	
	0,					
	0.1,					
	[0, 0, 0, 0],		
	1,					
	0,					
	10					
	];
	
	GF_Blood_Particle_Killed setDropInterval 0.02;
		
	_this setVariable ["GF_Blood_Particle_Bleeding_Source", GF_Blood_Particle_Killed];	
	
	_bloodeffect_attachTo =selectRandom["neck","head","body","hands","legs"];
	GF_Blood_Particle_Killed attachTo [_this,[0,0,0.1],_bloodeffect_attachTo];
	
	//systemchat "delete GF_Blood_Particle_Killed";
	
	_this execVM "GF_Blood_Stains_LITE\GF_Particles\GF_Set_time_to_delete_Particle.sqf";
