


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
	

diag_log "//________________ GF_AES_Sounds_Ambiance initialized ________________";


if (GF_AES_Systemchat_info) then {
systemchat "GF_AES_Sounds_Ambiance initialized";			
};	


//________________ GF_AES_Sounds_Ambiance ________________

GF_AES_Sounds_Ambiance_Spawn = {


if (GF_AES_Systemchat_info) then {
systemchat "GF_AES_Sounds_Ambiance";			
};	

[] spawn {
	while {true} do {
	
	//________________	daytime and nighttime	________________
	
	if ((date select 3) < 6 or (date select 3) > 19) then {
	
if (GF_AES_hintsilent_info) then {
hintsilent "nightime";		
};	
	
	//________________	nighttime	________________
	
	if ((!(surfaceIsWater getPos player)) && (!(vehicle player != player))) then {
		
	playSound "Ambiance_night_1";
	
	sleep 45;
	
if (GF_AES_hintsilent_info) then {
hintsilent "loop";	
};	
		
	}else{

	//________________	surfaceIsWater	________________
	
if (GF_AES_hintsilent_info) then {
hintsilent "surfaceIsWater or inside vehicle";	
};	

	sleep 1;
};	

	} else {

if (GF_AES_hintsilent_info) then {
hintsilent "daytime";	
};	
	
	//________________	daytime	________________
	
	if ((!(surfaceIsWater getPos player)) && (!(vehicle player != player))) then {
	
	playSound "Ambiance_day_1";

	sleep 23;
		
if (GF_AES_hintsilent_info) then {
hintsilent "loop";	
};	

	}else{

	//________________	surfaceIsWater	________________
	
if (GF_AES_hintsilent_info) then {
hintsilent "surfaceIsWater or inside vehicle";	
};	

	sleep 1;
	};		
};	

};
};
};


[] spawn GF_AES_Sounds_Ambiance_Spawn;