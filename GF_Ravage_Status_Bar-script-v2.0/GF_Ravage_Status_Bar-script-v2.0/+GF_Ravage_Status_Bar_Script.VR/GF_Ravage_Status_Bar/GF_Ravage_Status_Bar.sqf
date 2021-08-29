


//________________  Author : [GR]GEORGE F ___________ 08.06.18 _____________

/*
________________ GF Ravage Status Bar Script ________________

https://forums.bohemia.net/forums/topic/215645-ravage-status-bar-gf-script/?tab=comments#comment-3279085

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

include this in your initPlayerLocal :

[] execVM "Ravage_Status_Bar_GF\Ravage_Status_Bar_GF.sqf";
*/


waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

[] spawn
{
	_uid = getPlayerUID player;

	while {true} do
	{
	
	sleep 0.01;
	
	_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];
	

	if(isNull ((uiNamespace getVariable "RscStatusBar")displayCtrl 55554)) then
	{
	diag_log "statusbar is null create";
	disableSerialization;
	_rscLayer = "RscStatusBar" call BIS_fnc_rscLayer;
	_rscLayer cutRsc ["RscStatusBar","PLAIN",1,false];

	};
			
			
_unit = _this select 0;

//________________ IMPORTANT ! edit your selection for MP or SP score ________________
_Kills = score player; //Returns the person's score in MP. 
_count_dead = format ["%1 ",count allDeadMen];//Returns the person's score in SP. 


_health = round ((1 - (damage player)) * 100);
_hydration = player getVariable ["thirst", 100];
_nutrition = player getVariable ["hunger", 100];
_money = {_x isEqualTo "rvg_money"} count magazines player;
_serverFPS = round diag_fps;
_radiation = player getVariable ["radiation", 0];
//_maxHealth = (_radiation / 10000) - 0.3;
_rad = round ((player getVariable ["radiation",0]) / 100);


_pos = getPosATL player;
_dir = round (getDir (vehicle player));
_Bearing = _dir;
_grid = mapGridPosition  player; _xx = (format[_grid]) select  [0,3];
_Time= format ["%1", ([dayTime, "HH:MM:SS"] call BIS_fnc_timeToString)];


switch true do {
case(((_dir >= 355) && (_dir <=359)) || ((_dir >= 0) && (_dir <= 5))) : {_Bearing = "N";}; //Bearing North
case((_dir > 5) && (_dir < 85)) : {_Bearing = "NE";}; 		//Bearing North-East
case((_dir >= 85) && (_dir <= 95)) : {_Bearing = "E";}; 	//Bearing East
case((_dir > 95) && (_dir < 175)) : {_Bearing = "SE";}; 	//Bearing South-East
case((_dir >= 175) && (_dir <= 185)) : {_Bearing = "S";}; 	//Bearing South
case((_dir > 185) && (_dir < 265)) : {_Bearing = "SW";};	//Bearing South-West
case((_dir >= 265) && (_dir <= 275)) : {_Bearing = "W";}; 	//Bearing West
case((_dir > 275) && (_dir < 355)) : {_Bearing = "NW";};	//Bearing North-West
};	

//________________ Color Gradient ________________
//Additional color codes can be found here:  http://html-color-codes.com/
_colour_Default 	= parseText "#FBFCFE"; 
_colour90 			= parseText "#F5E6EC"; 
_colour80 			= parseText "#F0D1DB"; 
_colour70 			= parseText "#EBBBC9"; 
_colour60 			= parseText "#E6A6B8"; 
_colour50 			= parseText "#E191A7"; 
_colour40 			= parseText "#DB7B95"; 
_colour30 			= parseText "#D66684"; 
_colour20 			= parseText "#D15072"; 
_colour10 			= parseText "#CC3B61"; 
_colour0 			= parseText "#C72650"; 
_colourDead 		= parseText "#000000";


//________________ Changing Colour based on health  ________________
_colour_Health = _colour_Default;
if(_health >= 100) then{_colour_Health = _colour_Default;};
if((_health >= 90) && (_health < 100)) then {_colour_Health =  _colour90;};
if((_health >= 80) && (_health < 90)) then {_colour_Health =  _colour80;};
if((_health >= 70) && (_health < 80)) then {_colour_Health =  _colour70;};
if((_health >= 60) && (_health < 70)) then {_colour_Health =  _colour60;};
if((_health >= 50) && (_health < 60)) then {_colour_Health =  _colour50;};
if((_health >= 40) && (_health < 50)) then {_colour_Health =  _colour40;};
if((_health >= 30) && (_health < 40)) then {_colour_Health =  _colour30;};
if((_health >= 20) && (_health < 30)) then {_colour_Health =  _colour20;};
if((_health >= 10) && (_health < 20)) then {_colour_Health =  _colour10;};
if((_health >= 1) && (_health < 10)) then {_colour_Health =  _colour0;};
if(_health < 1) then{_colour_Health =  _colourDead;};


//________________ Changing Colour based on Thirst ________________
_colour_Hydration = _colour_Default;
switch true do
	{
	case(_hydration >= 100) : {_colour_Hydration = _colour_Default;};
	case((_hydration >= 90) && (_hydration < 100)) :  {_colour_Hydration =  _colour90;};
	case((_hydration >= 80) && (_hydration < 90)) :  {_colour_Hydration =  _colour80;};
	case((_hydration >= 70) && (_hydration < 80)) :  {_colour_Hydration =  _colour70;};
	case((_hydration >= 60) && (_hydration < 70)) :  {_colour_Hydration =  _colour60;};
	case((_hydration >= 50) && (_hydration < 60)) :  {_colour_Hydration =  _colour50;};
	case((_hydration >= 40) && (_hydration < 50)) :  {_colour_Hydration =  _colour40;};
	case((_hydration >= 30) && (_hydration < 40)) :  {_colour_Hydration =  _colour30;};
	case((_hydration >= 20) && (_hydration < 30)) :  {_colour_Hydration =  _colour20;};
	case((_hydration >= 10) && (_hydration < 20)) :  {_colour_Hydration =  _colour10;};
	case((_hydration >= 1) && (_hydration < 10)) :  {_colour_Hydration =  _colour0;};
	case(_hydration < 1) : {_colour_Hydration =  _colourDead;};
	};

	
//________________ Changing Colour based on Hunger ________________
_colour_Nutrition = _colour_Default;
if(_nutrition >= 100) then{_colour_Nutrition = _colour_Default;};
if((_nutrition >= 90) && (_nutrition < 100)) then {_colour_Nutrition =  _colour90;};
if((_nutrition >= 80) && (_nutrition < 90)) then {_colour_Nutrition =  _colour80;};
if((_nutrition >= 70) && (_nutrition < 80)) then {_colour_Nutrition =  _colour70;};
if((_nutrition >= 60) && (_nutrition < 70)) then {_colour_Nutrition =  _colour60;};
if((_nutrition >= 50) && (_nutrition < 60)) then {_colour_Nutrition =  _colour50;};
if((_nutrition >= 40) && (_nutrition < 50)) then {_colour_Nutrition =  _colour40;};
if((_nutrition >= 30) && (_nutrition < 40)) then {_colour_Nutrition =  _colour30;};
if((_nutrition >= 20) && (_nutrition < 30)) then {_colour_Nutrition =  _colour20;};
if((_nutrition >= 10) && (_nutrition < 20)) then {_colour_Nutrition =  _colour10;};
if((_nutrition >= 1) && (_nutrition < 10)) then {_colour_Nutrition =  _colour0;};
if(_nutrition < 1) then{_colour_Nutrition =  _colourDead;};


//________________ FPS Colour ________________
_colour_Blue		= parseText "#0033FF";
_colour_Blue_light	= parseText "#3399FF";
_colour_Green		= parseText "#339933";
_colour_Yellow		= parseText "#FFFF33";
_colour_Red			= parseText "#FF3333";


//________________ Changing Colour based on FPS ________________
_colour_Fps = _colour_Default;
switch true do {
case(_serverFPS >= 60) : {_colour_Fps = _colour_Blue;};
case((_serverFPS >= 45) && (_serverFPS < 60)) : {_colour_Fps = _colour_Blue_light;};
case((_serverFPS >= 30) && (_serverFPS < 45)) : {_colour_Fps = _colour_Green;};
case((_serverFPS >= 15) && (_serverFPS < 30)) : {_colour_Fps = _colour_Yellow;};
case((_serverFPS >= 1) && (_serverFPS < 15)) : {_colour_Fps = _colour_Red;};
case(_serverFPS < 1) : {_colour_Fps = _colourDead;};
};			
	
						
//________________ display information ________________
/*
You can delete the Line that you dont want. The numbers at the end of the lines , are defined  below
At the end of the lines , are the spaces between the next number and logo

IMPORTANT ! as mentioned above , edit your selection for MP or SP score
________________ Switch your Selection below ________________
_Kills = score player; //Returns the person's score in MP. 
_count_dead = format ["%1 ",count allDeadMen];//Returns the person's score in SP. 
*/


((uiNamespace getVariable "RscStatusBar")displayCtrl 55554) ctrlSetStructuredText
parseText format
	["
<t shadow='1' shadowColor='#000000' color='%12'>%2<img size='1.5' 	image='GF_Ravage_Status_Bar\images\Players.paa' />				</t>	
<t shadow='1' shadowColor='#000000' color='%13'>%3%1<img size='1.5' image='GF_Ravage_Status_Bar\images\Health.paa' />				</t>
<t shadow='1' shadowColor='#000000' color='%14'>%4%1<img size='1.5' image='GF_Ravage_Status_Bar\images\Hydration.paa' />				</t>
<t shadow='1' shadowColor='#000000' color='%15'>%5%1<img size='1.5' image='GF_Ravage_Status_Bar\images\Nutrition.paa' />				</t>
<t shadow='1' shadowColor='#000000'	color='%12'>%6%7<img size='1.5' image='GF_Ravage_Status_Bar\images\Compass.paa' />				</t>
<t shadow='1' shadowColor='#000000' color='%12'>%8<img size='1.5' 	image='GF_Ravage_Status_Bar\images\Kills.paa' />				</t>
<t shadow='1' shadowColor='#000000' color='%12'>%9<img size='1.5' 	image='GF_Ravage_Status_Bar\images\Money.paa' />				</t>				
<t shadow='1' shadowColor='#000000' color='%12'>%10<img size='1.5' 	image='GF_Ravage_Status_Bar\images\Radiation.paa' />				</t>								
<t shadow='1' shadowColor='#000000' color='%16'>%11<img size='1.5' 	image='GF_Ravage_Status_Bar\images\FPS.paa' />
</t>",
		"%",					//1
		count playableUnits,	//2
		_health,				//3
		_hydration,				//4
		_nutrition,				//5
		_Bearing,				//6
		_dir,					//7
		_Kills,					//8	
		_money,					//9	
		_rad,					//10	
		_serverFPS,				//11
		_colour_Default,		//12
		_colour_Health,			//13
		_colour_Hydration,		//14
		_colour_Nutrition,		//15
		_colour_Fps				//16
		];
	};
};