


//________________	Author : GEORGE FLOROS [GR]	___________	26.01.19	_____________

/*
________________	GF Temperature Script - Mod	________________

https://forums.bohemia.net/forums/topic/221531-gf-temperature-script-mod/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


/*
//________________	These are the Temperature Variables	________________

GF_Temperature_Sum_Air
GF_Temperature_Sum_Sea
*/


//________________	Settings	________________
//________________	Set true or false	________________


_Systemchat_info					= true;
_diag_log_info						= true;	

GF_Temperature_debug				= true;	
GF_Temperature_setDate				= false;

//	Select Type of Climate 	-->	  	1 = Hot Desert Climate , 2 = Mediterranean Climate , 3 = Subarctic Climate , 4 = custom
GF_Temperature_Climate_Type			= 2;	//	https://en.wikipedia.org/wiki/K%C3%B6ppen_Climate_classification	


//________________	Draw3D	________________

GF_Temperature_Draw3D				= true;
GF_Temperature_color				= [1,1,1,1];
GF_Temperature_position				= [15,-12,25];	
GF_Temperature_width				= 1;
GF_Temperature_height				= 1;
GF_Temperature_angle				= 0;
GF_Temperature_shadow				= 2;
GF_Temperature_textSize				= 0.05;
GF_Temperature_font					= "PuristaMedium";




if(_Systemchat_info) then {
systemchat "GF Temperature Script - Mod Initializing";
};

if(_diag_log_info) then {
diag_log "//________________	GF Temperature Script - Mod Initializing	_____________";
diag_log "//________________	GF_Temperature.sqf	_____________";
};

//	GF Temperature Script - Mod Initializing
GF_Temperature_Initialized = false;



//________________	GF_Temperature_setDate	________________

if(GF_Temperature_setDate) then {
//	Syntax:	setDate [year, month, day, hour, minute] 
[[], {setDate [2018, 10, 1, 8, 0]}] remoteExec ["call",0,"JIP_id_setDate"];
};





//________________	case	________________
	
_Loaded = false;

switch (GF_Temperature_Climate_Type) do {
							

case 1 : {

//________________	Mediterranean Climate	________________
//________________	Temperature Air	________________

/*
https://www.yr.no/place/Greece/Attica/Athens/statistics.html

Months 		Normal 	Warmest Coldest 	
January 	9.3°C 	12.9°C 	6.5°C 	
February 	9.8°C 	13.6°C 	6.9°C 	
March 		11.7°C 	16.0°C 	8.4°C 	
April 		15.5°C 	20.3°C 	11.6°C 	
May 		20.2°C 	25.3°C 	15.4°C 	
June 		24.6°C 	29.8°C 	20.1°C 	
July 		27.0°C 	32.6°C 	22.5°C 	
August 		26.6°C 	32.3°C 	22.3°C 	
September 	23.3°C 	28.9°C 	19.2°C 	
October 	18.3°C 	23.1°C 	14.9°C 	
November 	14.4°C 	18.6°C 	11.4°C 	
December 	11.1°C 	14.7°C 	8.3°C
*/

GF_Temperature_Air_January = selectrandom [6,7,8,9,10,11,12,13];
GF_Temperature_Air_February = selectrandom [7,8,9,10,11,12,13,14];
GF_Temperature_Air_March = selectrandom [8,9,10,11,12,13,14,15,16];
GF_Temperature_Air_April = selectrandom [11,12,13,14,15,16,17,18,19,20];
GF_Temperature_Air_May = selectrandom [15,16,17,18,19,20,21,22,23,24,25];
GF_Temperature_Air_June = selectrandom [20,21,22,23,24,25,26,27,28,29];
GF_Temperature_Air_July = selectrandom [22,23,24,25,26,27,28,29,30,31,32];
GF_Temperature_Air_August = selectrandom [23,24,25,26,27,28,29,30,31,32,33];
GF_Temperature_Air_September = selectrandom [19,20,21,22,23,24,25,26,27,28,29];
GF_Temperature_Air_October = selectrandom [15,16,17,18,19,20,21,22,23];
GF_Temperature_Air_November = selectrandom [11,12,13,14];
GF_Temperature_Air_December = selectrandom [8,9,10,11];


//________________	Temperature Sea	________________

/*
https://www.seatemperature.org/europe/greece/athens.htm

		Jan 	Feb 	Mar 	Apr 	May 	Jun 	Jul 	Aug 	Sep 	Oct 	Nov 	Dec
Min °C 	14.2 	14 		14.2 	13.8 	15.8 	20.8 	23.7 	24.4 	23.6 	20 		17.4 	14.8
Max °C 	16.6 	16.1 	16.3 	17.6 	21.2 	24.4 	27.8 	28.2 	26.4 	24.5 	20.8	18.4
*/

GF_Temperature_Sea_January = selectrandom [14,15,16,17];
GF_Temperature_Sea_February = selectrandom [14,15,16];
GF_Temperature_Sea_March = selectrandom [14,15,16];
GF_Temperature_Sea_April = selectrandom [13,14,15,16,17,18];
GF_Temperature_Sea_May = selectrandom [15,16,17,18,19,20,21];
GF_Temperature_Sea_June = selectrandom [21,22,23,24,25];
GF_Temperature_Sea_July = selectrandom [23,24,25,26,27,28];
GF_Temperature_Sea_August = selectrandom [24,25,26,27,28];
GF_Temperature_Sea_September = selectrandom [23,24,25,26];
GF_Temperature_Sea_October = selectrandom [20,21,22,23,24];
GF_Temperature_Sea_November = selectrandom [17,18,19,20,21];
GF_Temperature_Sea_December = selectrandom [14,15,16,17,18];

_Loaded = true;
};


case 2 : {

//________________	Hot desert Climate	________________
//________________	Temperature Air	________________
//	Sabha, Libya
/*
https://en.wikipedia.org/wiki/Desert_climate#Hot_desert_climates
*/

GF_Temperature_Air_January = selectrandom [6,7,8,9,10,11,12,13,14,15,16,17,18,19];
GF_Temperature_Air_February = selectrandom [8,9,10,11,12,13,14,15,16,17,18,19,20,21];
GF_Temperature_Air_March = selectrandom [12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
GF_Temperature_Air_April = selectrandom [17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32];
GF_Temperature_Air_May = selectrandom [22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
GF_Temperature_Air_June = selectrandom [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39];
GF_Temperature_Air_July = selectrandom [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
GF_Temperature_Air_August = selectrandom [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39];
GF_Temperature_Air_September = selectrandom [24,25,26,27,28,29,30,31,32,33,34,35,36,37,38];
GF_Temperature_Air_October = selectrandom [19,20,21,22,23,24,25,26,27,28,29];
GF_Temperature_Air_November = selectrandom [12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
GF_Temperature_Air_December = selectrandom [7,8,9,10,11,12,13,14,15,16,17,18,19,20];


//________________	Temperature Sea	________________
//	Lebanon Tripoli
/*
https://www.seatemperature.org/middle-east/lebanon/tripoli.htm

		Jan 	Feb 	Mar 	Apr 	May 	Jun 	Jul 	Aug 	Sep 	Oct 	Nov 	Dec
Min °C 	17.1 	16.9 	16.7 	16.7 	19 		23.1 	25.7 	27.5 	27.1 	24.2 	20.3 	18.4
Max °C 	20 		18.1 	18.5 	20.3 	23.8 	27 		29.3 	29.6 	28.9 	28 		25		21.6
*/

GF_Temperature_Sea_January = selectrandom [17,18,19,20];
GF_Temperature_Sea_February = selectrandom [16,17,18];
GF_Temperature_Sea_March = selectrandom [16,17,18,19];
GF_Temperature_Sea_April = selectrandom [16,17,18,19,20];
GF_Temperature_Sea_May = selectrandom [19,20,21,22,23,24];
GF_Temperature_Sea_June = selectrandom [23,24,25,26,27];
GF_Temperature_Sea_July = selectrandom [25,26,27,28,29];
GF_Temperature_Sea_August = selectrandom [27,28,29,30];
GF_Temperature_Sea_September = selectrandom [27,28,29];
GF_Temperature_Sea_October = selectrandom [24,25,26,27,28];
GF_Temperature_Sea_November = selectrandom [20,21,22,23,24,25];
GF_Temperature_Sea_December = selectrandom [18,19,20,21,22];

_Loaded = true;
};


case 3 : {

//________________	Subarctic Climate	________________
//________________	Temperature Air	________________
//	Anchorage, Alaska
/*
https://en.wikipedia.org/wiki/Subarctic_climate

*/

GF_Temperature_Air_January = selectrandom [-12,-11,-10,-9,-8,-7,-6,-5];
GF_Temperature_Air_February = selectrandom [-10,-9,-8,-7,-6,-5,-4,-3];
GF_Temperature_Air_March = selectrandom [-7,-6,-5,-4,-3,-2,-1,0,1];
GF_Temperature_Air_April = selectrandom [-2,-1,0,1,2,3,4,5,6,7];
GF_Temperature_Air_May = selectrandom [4,5,6,7,8,9,10,11,12,13,14];
GF_Temperature_Air_June = selectrandom [9,10,11,12,13,14,15,16,17,18];
GF_Temperature_Air_July = selectrandom [11,12,13,14,15,16,17,18,19];
GF_Temperature_Air_August = selectrandom [10,11,12,13,14,15,16,17,18];
GF_Temperature_Air_September = selectrandom [5,6,7,8,9,10,11,12,13];
GF_Temperature_Air_October = selectrandom [-2,-1,0,1,2,3,4,5];
GF_Temperature_Air_November = selectrandom [-9,-8,-7,-6,-5,-4,-3,-2];
GF_Temperature_Air_December = selectrandom [-10,-9,-8,-7,-6,-5,-4];


//________________	Temperature Sea	________________
//	Anchorage, Alaska
/*
https://www.seatemperature.org/north-america/united-states/anchorage.htm

		Jan 	Feb 	Mar 	Apr 	May 	Jun 	Jul 	Aug 	Sep 	Oct 	Nov 	Dec
Min °C 	1.7 	0.8 	1.4 	1.4 	3.4 	6.1 	9.5 	10.1 	9.6 	7.1 	4.3 	2.4
Max °C 	3.7 	3.4 	3.2 	4.7 	8.2 	11.3 	13.2 	13.3 	12.2 	10.1 	7.9		6

*/

GF_Temperature_Sea_January = selectrandom [1,2,3,4];
GF_Temperature_Sea_February = selectrandom [0,1,2,3];
GF_Temperature_Sea_March = selectrandom [1,2,3];
GF_Temperature_Sea_April = selectrandom [1,2,3,4,5];
GF_Temperature_Sea_May = selectrandom [3,4,5,6,7,8];
GF_Temperature_Sea_June = selectrandom [6,7,8,9,10,11];
GF_Temperature_Sea_July = selectrandom [9,10,11,12,13];
GF_Temperature_Sea_August = selectrandom [10,11,12,13];
GF_Temperature_Sea_September = selectrandom [9,10,11,12];
GF_Temperature_Sea_October = selectrandom [7,8,9,10];
GF_Temperature_Sea_November = selectrandom [4,5,6,7,8];
GF_Temperature_Sea_December = selectrandom [2,3,4,5,6];

_Loaded = true;
};


case 4 : {

//________________	Custom Climate	________________
//________________	Temperature Air	________________

GF_Temperature_Air_January = selectrandom [6,7,8,9,10,11,12,13,14,15,16,17,18,19];
GF_Temperature_Air_February = selectrandom [8,9,10,11,12,13,14,15,16,17,18,19,20,21];
GF_Temperature_Air_March = selectrandom [12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
GF_Temperature_Air_April = selectrandom [17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32];
GF_Temperature_Air_May = selectrandom [22,23,24,25,26,27,28,29,30,31,32,33,34,35,36];
GF_Temperature_Air_June = selectrandom [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39];
GF_Temperature_Air_July = selectrandom [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40];
GF_Temperature_Air_August = selectrandom [25,26,27,28,29,30,31,32,33,34,35,36,37,38,39];
GF_Temperature_Air_September = selectrandom [24,25,26,27,28,29,30,31,32,33,34,35,36,37,38];
GF_Temperature_Air_October = selectrandom [19,20,21,22,23,24,25,26,27,28,29];
GF_Temperature_Air_November = selectrandom [12,13,14,15,16,17,18,19,20,21,22,23,24,25,26];
GF_Temperature_Air_December = selectrandom [7,8,9,10,11,12,13,14,15,16,17,18,19,20];


//________________	Temperature Sea	________________

GF_Temperature_Sea_January = selectrandom [14,15,16,17];
GF_Temperature_Sea_February = selectrandom [14,15,16];
GF_Temperature_Sea_March = selectrandom [14,15,16];
GF_Temperature_Sea_April = selectrandom [13,14,15,16,17,18];
GF_Temperature_Sea_May = selectrandom [15,16,17,18,19,20,21];
GF_Temperature_Sea_June = selectrandom [21,22,23,24,25];
GF_Temperature_Sea_July = selectrandom [23,24,25,26,27,28];
GF_Temperature_Sea_August = selectrandom [24,25,26,27,28];
GF_Temperature_Sea_September = selectrandom [23,24,25,26];
GF_Temperature_Sea_October = selectrandom [20,21,22,23,24];
GF_Temperature_Sea_November = selectrandom [17,18,19,20,21];
GF_Temperature_Sea_December = selectrandom [14,15,16,17,18];

_Loaded = true;
};

};

waituntil {_Loaded};


//________________	GF_Temperature_SunElev	________________
//Big thanks to CarlGustaffa

GF_Temperature_SunElev = {
/*
	Author: CarlGustaffa
	https://forums.bohemia.net/profile/742616-carlgustaffa/
	https://forums.bohemia.net/forums/topic/106785-ai-shoots-flares-script-version-13/?tab=comments#comment-1778235
		
	Description:
	Returns the suns altitude for current day and hour of the year on any island (whos latitude may differ).

	Parameters:
	None needed.

	Returns:
	Suns altitude in degrees, positive values after sunrise, negative values before sunrise.
*/
private ["_lat", "_day", "_hour", "_angle"];
_lat = -1 * getNumber(configFile >> "CfgWorlds" >> worldName >> "latitude");
_day = 360 * (dateToNumber date);
_hour = (daytime / 24) * 360;
_angle = ((12 * cos(_day) - 78) * cos(_lat) * cos(_hour)) - (24 * sin(_lat) * cos(_day));
_angle
};




addMissionEventHandler ["EachFrame", {


//________________	GF_Temperature_Hour	________________
//	Array - date in format [year, month, day, hour, minute]

GF_Temperature_Year = date select 0;
GF_Temperature_Month = date select 1;
GF_Temperature_Day = date select 2;
GF_Temperature_Hour = date select 3;
GF_Temperature_Minute = date select 4;


//________________	GF_Temperature_Month	________________

switch true do {

	case(GF_Temperature_Month isEqualto 1) : {GF_Temperature_Air_Month = GF_Temperature_Air_January;GF_Temperature_Month_Date = "January";};
	case(GF_Temperature_Month isEqualto 2) : {GF_Temperature_Air_Month = GF_Temperature_Air_February;GF_Temperature_Month_Date = "February";};
	case(GF_Temperature_Month isEqualto 3) : {GF_Temperature_Air_Month = GF_Temperature_Air_March;GF_Temperature_Month_Date = "March";};
	case(GF_Temperature_Month isEqualto 4) : {GF_Temperature_Air_Month = GF_Temperature_Air_April;GF_Temperature_Month_Date = "April";};
	case(GF_Temperature_Month isEqualto 5) : {GF_Temperature_Air_Month = GF_Temperature_Air_May;GF_Temperature_Month_Date = "May";};
	case(GF_Temperature_Month isEqualto 6) : {GF_Temperature_Air_Month = GF_Temperature_Air_June;GF_Temperature_Month_Date = "June";};
	case(GF_Temperature_Month isEqualto 7) : {GF_Temperature_Air_Month = GF_Temperature_Air_July;GF_Temperature_Month_Date = "July";};
	case(GF_Temperature_Month isEqualto 8) : {GF_Temperature_Air_Month = GF_Temperature_Air_August;GF_Temperature_Month_Date = "August";};
	case(GF_Temperature_Month isEqualto 9) : {GF_Temperature_Air_Month = GF_Temperature_Air_September;GF_Temperature_Month_Date = "September";};
	case(GF_Temperature_Month isEqualto 10) : {GF_Temperature_Air_Month = GF_Temperature_Air_October;GF_Temperature_Month_Date = "October";};
	case(GF_Temperature_Month isEqualto 11) : {GF_Temperature_Air_Month = GF_Temperature_Air_November;GF_Temperature_Month_Date = "November";};
	case(GF_Temperature_Month isEqualto 12) : {GF_Temperature_Air_Month = GF_Temperature_Air_December;GF_Temperature_Month_Date = "December";};
};	


//________________	GF_Temperature_Sea_Month	________________

switch true do {

	case(GF_Temperature_Month isEqualto 1) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_January;GF_Temperature_Month_Date = "January";};
	case(GF_Temperature_Month isEqualto 2) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_February;GF_Temperature_Month_Date = "February";};
	case(GF_Temperature_Month isEqualto 3) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_March;GF_Temperature_Month_Date = "March";};
	case(GF_Temperature_Month isEqualto 4) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_April;GF_Temperature_Month_Date = "April";};
	case(GF_Temperature_Month isEqualto 5) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_May;GF_Temperature_Month_Date = "May";};
	case(GF_Temperature_Month isEqualto 6) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_June;GF_Temperature_Month_Date = "June";};
	case(GF_Temperature_Month isEqualto 7) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_July;GF_Temperature_Month_Date = "July";};
	case(GF_Temperature_Month isEqualto 8) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_August;GF_Temperature_Month_Date = "August";};
	case(GF_Temperature_Month isEqualto 9) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_September;GF_Temperature_Month_Date = "September";};
	case(GF_Temperature_Month isEqualto 10) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_October;GF_Temperature_Month_Date = "October";};
	case(GF_Temperature_Month isEqualto 11) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_November;GF_Temperature_Month_Date = "November";};
	case(GF_Temperature_Month isEqualto 12) : {GF_Temperature_Sea_Month = GF_Temperature_Sea_December;GF_Temperature_Month_Date = "December";};
};	


//________________	GF_Temperature_Sun_Elev	________________

GF_Temperature_Sun_Elev = [] call GF_Temperature_SunElev;
GF_Temperature_Sun_Elev = GF_Temperature_Sun_Elev * 0.1;


//________________	GF_Temperature_overcast	________________

GF_Temperature_overcast = overcastForecast * 10;
GF_Temperature_overcast = GF_Temperature_overcast / 2;


//________________	GF_Temperature_fog	________________

GF_Temperature_fog = fogForecast * 10;
GF_Temperature_fog = GF_Temperature_fog / 3;


//________________	GF_Temperature_rain	________________

GF_Temperature_rain = rain * 10;
GF_Temperature_rain = GF_Temperature_rain / 2;


//________________	GF_Temperature_gusts	________________

GF_Temperature_gusts = gusts * 10;
GF_Temperature_gusts = GF_Temperature_gusts / 3;


//________________	GF_Temperature_Altidude	________________

if((getPosASLW player select 2) > 0) then {
GF_Temperature_Altidude = round((getPosASL player) select 2);
GF_Temperature_Altidude = GF_Temperature_Altidude * 0.01;
}else{GF_Temperature_Altidude = 0};


//________________	GF_Temperature_Sea_Deep	________________

if((surfaceIsWater position player) or (underwater player) or ((getPosASLW player select 2) < -1)) then {
_TerrainHeight = getTerrainHeightASL (position player); 
GF_Temperature_Sea_Deep = _TerrainHeight;
}else{GF_Temperature_Sea_Deep = 0};

GF_Temperature_Sea_Deep = GF_Temperature_Sea_Deep / 10;
GF_Temperature_Sea_Deep = GF_Temperature_Sea_Deep / 5;


//________________	GF_Temperature_Sea_Depth	________________

if((surfaceIsWater position player) or (underwater player) or ((getPosASLW player select 2) < -1)) then {
GF_Temperature_Sea_Depth = getPosASLW player select 2;}else{GF_Temperature_Sea_Depth = 0};

GF_Temperature_Sea_Depth = GF_Temperature_Sea_Depth / 10;
GF_Temperature_Sea_Depth = GF_Temperature_Sea_Depth / 2;


//________________	GF_Temperature_Sum_Air	________________

GF_Temperature_Sum_Air_Decimals = 
	GF_Temperature_Air_Month 
	+ GF_Temperature_Sun_Elev
	- GF_Temperature_overcast
	- GF_Temperature_fog
	- GF_Temperature_rain
	- GF_Temperature_gusts
	- GF_Temperature_Altidude;

GF_Temperature_Sum_Air = [GF_Temperature_Sum_Air_Decimals, 1] call BIS_fnc_cutDecimals;


//________________	GF_Temperature_Sum_Sea	________________

GF_Temperature_Sum_Sea_Decimals = 
	GF_Temperature_Sea_Month 
	- GF_Temperature_overcast
	+ GF_Temperature_Sea_Deep
	+ GF_Temperature_Sea_Depth;

GF_Temperature_Sum_Sea = [GF_Temperature_Sum_Sea_Decimals, 1] call BIS_fnc_cutDecimals;




//________________	GF_Temperature_debug	________________

if(GF_Temperature_debug) then {

hintsilent format [
"
_____	Debug	_____	\n  
\n 
\n 
_____	Date	_____	\n  
\n 
Year : %1	\n 
Month : %2	\n 
Day : %3	\n 
Hour : %4 Minute : %5	\n 
\n 
\n 
_____	Values	_____ 	\n
\n 
Sun Elevation Value : %6	\n 
overcastForecast Value : %7	\n
fogForecast Value : %8	\n
rain Value : %9	\n
gusts Value : %10	\n
Altidude Value : %11	\n
Sea Deep : %12	\n
Sea Depth : %13	\n
\n
Average Temperature Air Month : %14	\n 
Average Temperature Sea Month : %15	\n
\n
\n 
_____	Temperature	_____ 	\n
_____	Sum	_____ 	\n
\n 
Temperature Sum Air : %16	\n
Temperature Sum Sea : %17
" ,
GF_Temperature_Year,
GF_Temperature_Month_Date,
GF_Temperature_Day,
GF_Temperature_Hour,
GF_Temperature_Minute,
floor GF_Temperature_Sun_Elev,
GF_Temperature_overcast,
GF_Temperature_fog,
GF_Temperature_rain,
GF_Temperature_gusts,
floor GF_Temperature_Altidude,
/*
if((surfaceIsWater position player) or (underwater player) or ((getPosASLW player select 2) < -1)) then {
GF_Temperature_Sea_Deep}else{0},

if((surfaceIsWater position player) or (underwater player) or ((getPosASLW player select 2) < -1)) then {
GF_Temperature_Sea_Depth}else{0},
*/
GF_Temperature_Sea_Deep,
GF_Temperature_Sea_Depth,

GF_Temperature_Air_Month,
GF_Temperature_Sea_Month,
GF_Temperature_Sum_Air,
GF_Temperature_Sum_Sea
];
};


}];


//	GF Temperature Script - Mod Initialized
GF_Temperature_Initialized = true;


/*
//________________	These are the Temperature Variables	________________
//	in order to use them with another script 

GF_Temperature_Sum_Air
GF_Temperature_Sum_Sea


To broadcast a variable to all clients :
//	https://community.bistudio.com/wiki/publicVariable

publicvariable "GF_Temperature_Sum_Air";
publicvariable "GF_Temperature_Sum_Sea";
*/






if(GF_Temperature_Draw3D) then {

//________________	MISSION_ROOT	________________

MISSION_ROOT = str missionConfigFile select [0, count str missionConfigFile - 15];


//________________	addMissionEventHandler	________________

addMissionEventHandler ["Draw3D", {

	
	_format = format ["Air : %1 Sea :%2",GF_Temperature_Sum_Air,GF_Temperature_Sum_Sea];
	_Pos = positionCameraToWorld GF_Temperature_position;		
			
	drawIcon3D [
	
		MISSION_ROOT + "GF_Temperature\images\Celcius.paa", 
		GF_Temperature_color, 		//	color
		_Pos,						//	pos
		GF_Temperature_width,		//	width
		GF_Temperature_height,		//	height
		GF_Temperature_angle,		//	angle
		_format,					//	text
		GF_Temperature_shadow,		//	shadow
		GF_Temperature_textSize,	//	textSize
		GF_Temperature_font			//	font
	];
	
}];

};



if(_Systemchat_info) then {
systemchat "GF Temperature Script - Mod Initialized";
};

if(_diag_log_info) then {
diag_log "//________________	GF Temperature Script - Mod Initialized	_____________";
};