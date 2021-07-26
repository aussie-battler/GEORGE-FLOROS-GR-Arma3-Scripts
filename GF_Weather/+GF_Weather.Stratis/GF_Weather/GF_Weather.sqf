


//________________  Author : GEORGE FLOROS [GR] ___________ 21.10.18 _____________

/*
________________ GF Weather Script ________________

https://forums.bohemia.net/forums/topic/219922-gf-weather-script/

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


diag_log "//________________ GF Weather Script ________________";


//________________ Settings ________________
//________________ Set true or false  ________________
//________________ Set your own Values to GF_Weather_Overcast_Value and GF_Weather_Fog_Value   ________________

GF_Weather_Debug							= true;
GF_Weather_systemchat_info					= false;

GF_Weather_setDate							= true;

GF_Weather_Overcast 						= true;
GF_Weather_Time_to_setOvercast 				= 120;	//	To change the weather dynamic , uncomment ,	forceweatherchange;	check below		
GF_Weather_Overcast_Value 					= selectrandom [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];	//	More than 0.7 to rain
GF_Weather_Overcast_Loop 					= 900;

GF_Weather_Fog 								= true;
GF_Weather_Time_to_setFog 					= 90;
GF_Weather_Fog_Value 						= selectrandom [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1];	
GF_Weather_Fog_Loop						 	= 900;


publicVariable "GF_Weather_Time_to_setOvercast";
publicVariable "GF_Weather_Overcast_Value";
publicVariable "GF_Weather_Time_to_setFog";
publicVariable "GF_Weather_Fog_Value";




//________________ setDate ________________

if(GF_Weather_setDate) then {
//	Syntax:	setDate [year, month, day, hour, minute] 
[[], {setDate [2018, 11, 1, 8, 0]}] remoteExec ["call",0,"JIP_id_setDate"];
};


if(GF_Weather_Debug) then {
[]spawn{
while {true} do {
hintsilent format["overcastForecast: %1 \n fogForecast: %2",overcastForecast,fogForecast];
diag_log format["overcastForecast: %1 \n fogForecast: %2",overcastForecast,fogForecast];
sleep 5; 
};
};
};


//________________ Weather ________________

if(GF_Weather_Overcast) then {
[]spawn{
while {true} do {
	 
GF_Weather_Time_to_setOvercast setOvercast GF_Weather_Overcast_Value;
waituntil {time>GF_Weather_Time_to_setOvercast};

//	setOvercast 1 only reaches full overcast after about 50 minutes.
//	To change the weather dynamic , uncomment
//	forceweatherchange;

if(GF_Weather_systemchat_info) then {	
systemchat format ["Overcast Value :	%1", GF_Weather_Overcast_Value];
};

sleep GF_Weather_Overcast_Loop;
};
};
};


//________________ Fog ________________

if(GF_Weather_Fog) then {
[]spawn{
while {true} do {

GF_Weather_Time_to_setFog setFog GF_Weather_Fog_Value;
waituntil {time>GF_Weather_Time_to_setFog};	

if(GF_Weather_systemchat_info) then {
systemchat format ["Fog Value :	%1", GF_Weather_Fog_Value];
};

sleep GF_Weather_Fog_Loop;
};
};
};