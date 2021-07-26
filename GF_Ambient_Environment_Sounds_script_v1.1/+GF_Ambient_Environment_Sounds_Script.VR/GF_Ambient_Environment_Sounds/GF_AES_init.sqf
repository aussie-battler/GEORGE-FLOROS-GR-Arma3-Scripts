


//________________  Author : GEORGE FLOROS [GR] ___________ 09.12.18 _____________

/*
________________ GF Ambient Environment Sounds Script ________________

https://forums.bohemia.net/forums/topic/219857-gf-ambient-environment-sounds-script/

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
	

diag_log "//________________ GF Ambient Environment Sounds Script ________________";


//________________ Settings ________________
//________________ Set true or false  ________________

GF_AES_Systemchat_info						= true;					//	Show Systemchat information
GF_AES_hintsilent_info						= true;					//	Show hint information


GF_AES_Sounds_Ambiance						= true;					//	Ambiance Sounds

//________________ say3D ________________

GF_AES_Sounds_3D_Birds						= true;					//	Birds Sounds
GF_AES_Sounds_3D_Insects					= true;					//	Insects Sounds
GF_AES_Sounds_3D_SFX_Forest					= true;					//	SFX Forest Sounds


//________________ number of Spawns ________________

GF_AES_Sounds_Birds_Spawn_x_Number			= 2;					//	Change the number of Spawned loops at the same time 
GF_AES_Sounds_Insects_Spawn_x_Number		= 2;					//	Change the number of Spawned loops at the same time 
GF_AES_Sounds_SFX_Forest_Spawn_x_Number		= 1;					//	Change the number of Spawned loops at the same time


//________________ seconds to loop ________________

GF_AES_Sounds_Birds_Loop					= 25 + random 50;		//  Set the seconds to loop sounds
GF_AES_Sounds_Insects_Loop					= 25 + random 25;		//  Set the seconds to loop sounds
GF_AES_Sounds_SFX_Forest_Loop				= 100 + random 100;		//  Set the seconds to loop sounds



if (GF_AES_Systemchat_info) then {
systemchat "GF Ambient Environment Sounds Script initialized";			
};	



//________________ GF_AES_Sounds_Ambiance ________________

if (GF_AES_Sounds_Ambiance) then {
[] execVM "GF_Ambient_Environment_Sounds\GF_AES_Sounds_Ambiance.sqf";
};


//________________ say3D ________________

//________________ GF_AES_Sounds_3D_Birds ________________

if (GF_AES_Sounds_3D_Birds) then {
[] execVM "GF_Ambient_Environment_Sounds\say3D\GF_AES_Sounds_3D_Birds.sqf";
};

//________________ GF_AES_Sounds_3D_Insects ________________

if (GF_AES_Sounds_3D_Insects) then {
[] execVM "GF_Ambient_Environment_Sounds\say3D\GF_AES_Sounds_3D_Insects.sqf";
};

//________________ GF_AES_Sounds_3D_SFX_Forest ________________

if (GF_AES_Sounds_3D_SFX_Forest) then {
[] execVM "GF_Ambient_Environment_Sounds\say3D\GF_AES_Sounds_3D_SFX_Forest.sqf";
};