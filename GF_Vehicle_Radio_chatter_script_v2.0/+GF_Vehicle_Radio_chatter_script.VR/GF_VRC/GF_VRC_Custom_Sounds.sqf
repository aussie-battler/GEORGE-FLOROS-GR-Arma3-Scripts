


//________________  Author : [GR]GEORGE F ___________ 27.12.18 _____________

/*
________________ GF Vehicle Radio chatter script ________________

https://forums.bohemia.net/forums/topic/218313-gf-vehicle-radio-chatter-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


if (GF_VRC_Systemchat_info) then {
systemchat "Custom_Radio_chatter";			
};
		
		
GF_VRC_Pos = "#particlesource" createVehicleLocal [0,0,0];	
GF_VRC_Pos attachTo [_this, [0,0,0]];
	
While {GF_VRC_Close}  do {

_array = selectRandom[	
	"GF_VRC_1",
	"GF_VRC_2",
	"GF_VRC_3",
	"GF_VRC_4",
	"GF_VRC_5",
	"GF_VRC_6",
	"GF_VRC_7"
	];

GF_VRC_Pos say3D _array;	

sleep GF_VRC_Time + random GF_VRC_Time_Random;	

if (GF_VRC_Systemchat_info) then {
systemchat "Custom_Radio_chatter repeat";			
};

};