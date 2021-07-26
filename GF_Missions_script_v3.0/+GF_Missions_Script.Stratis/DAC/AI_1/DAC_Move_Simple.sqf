//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Move_Simple       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_wparray","_action","_nextwp","_run"];
		
_group = _this select 0;_wparray = _this select 1;_action = true;_nextwp = [];_run = true;

waituntil{(!(_group in DAC_All_Groups))};

_group setVariable ["dacData",[0,(position (leader _group))],false];

while{_action} do
{
	_nextwp = call compile (_wparray select (random ((count _wparray) - 1)));
	_group setVariable ["dacData",[0,_nextwp],false];
	_group move _nextwp;_run = true;
	while{_run} do
	{
		sleep (1 + random 1);
		if((({alive _x} count units _group) == 0) || (_group in DAC_All_Groups)) then
		{
			_run = false;_action = false;
		}
		else
		{
			if(unitready (vehicle (leader _group))) then {_run = false};
		};
	};
};