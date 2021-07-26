


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


//	systemchat "GF_SFX_Screaming";


//________________ Settings _____________
//________________ Set true or false  _____________

_1_BIS_Screaming_SFX				= false; 
_2_Custom_Screaming_SFX  			= true; 
	

	
//________________ Move Lips _____________	
	
//	systemchat "setRandomLip true";
_this setRandomLip true;	


//________________ _1_BIS_Screaming_SFX _____________		
if (_1_BIS_Screaming_SFX) then {	

//________________ playSound3D ________________
//Sounds
//https://forums.bohemia.net/forums/topic/213322-where-are-ingame-sounds-for-pain-grunt/?tab=comments#comment-3264409
//playSound3D ["a3\sounds_f\characters\human-sfx\Person0\P0_hit_05.wss",_this];

_BIS_Screaming_Sound = format ["A3\sounds_f\characters\human-sfx\P0%1\Hit_Mid_%2.wss", selectRandom [4,5,6,7,8,9], selectRandom [1,2,3,4,5]];

//	OR You can add your desired game sfx here	
_BIS_Screaming_Sound_2 =selectRandom[
	
		//Hit
		"A3\sounds_f\characters\human-sfx\P05\Hit_Low_1.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Low_2.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Low_3.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Low_4.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Low_5.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Mid_1.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Mid_2.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Mid_3.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Mid_4.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Mid_5.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Max_1.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Max_2.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Max_3.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Max_4.wss",
		"A3\sounds_f\characters\human-sfx\P05\Hit_Max_5.wss",
			
		//moan words
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_13_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_14_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_15_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_16_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_17_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_18_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_19_words.wss",
		"a3\sounds_f\characters\human-sfx\Person0\P0_moan_20_words.wss"
		];
			
		//	systemchat "_1_BIS_Screaming_SFX";
		
		[playSound3D [_BIS_Screaming_Sound,_this]] call BIS_fnc_MP;

};		
			

			
//________________ _2_Custom_Screaming_SFX _____________		
if (_2_Custom_Screaming_SFX) then {		


_Custom_Screaming_SFX =selectRandom[	
		"Screaming_1",
		"Screaming_2",
		"Screaming_3",
		"Screaming_4",
		"Screaming_5",
		"Screaming_6",
		"Screaming_7",
		"Screaming_8",
		"Screaming_9",
		"Screaming_10",
		"Screaming_11",
		"Screaming_12",
		"Screaming_13",
		"Screaming_14",
		"Screaming_15",
		"Screaming_16",
		"Screaming_17",
		"Screaming_18",
		"Screaming_19",
		"Screaming_20",
		"Screaming_21",
		"Screaming_22",
		"Screaming_23",
		"Screaming_24",
		"Screaming_25"
		];
			
		//	systemchat "_2_Custom_Screaming_SFX";
		
		_Custom_Killed_SFX_pos = "#particlesource" createVehicleLocal ASLToAGL getPosWorld _this;
		_Custom_Killed_SFX_pos say3D _Custom_Screaming_SFX;			 
				
		//Not working ?
		//[_Custom_Killed_SFX_pos,_Custom_Screaming_SFX] remoteExec ["say3d", 0, true]; 
				
};		

sleep 1.5;

//	systemchat "setRandomLip false";
_this setRandomLip false;