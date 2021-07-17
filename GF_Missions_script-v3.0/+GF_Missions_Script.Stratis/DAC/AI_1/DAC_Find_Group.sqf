//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_Group        //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_i","_group","_side","_entry","_array","_temp","_run",
			"_dist","_sideArray","_actArray","_d","_checkgroup","_cond"
		];
		
		_run = 0;_cond = ["==","!="];

while {_run >= 0} do
{
	_group = _this select 0;_array = [];_temp = [];_i = 0;_side = (side ((units _group) select 0));
	_sideArray = ["DAC_West_Units","DAC_East_Units"];_actArray = "";_checkgroup = group player;
				
	if(((units _group) select 0) in DAC_West_Units) then
	{
		_actArray = "DAC_West_Units";
	}
	else
	{
		if(((units _group) select 0) in DAC_East_Units) then
		{
			_actArray = "DAC_East_Units";
		};
	};
	if(_actArray != "") then
	{
		while {_i < count DAC_All_Groups} do
		{
			_entry = DAC_All_Groups select _i;
			if(({alive _x} count units _entry) > 0) then
			{
				if(((leader _entry) in (call compile _actArray))
				&& (!((vehicle (leader _entry)) iskindof "Air"))) then
				{
					if(!(_group == _entry)) then {_temp set [count _temp,_entry]};
				};
			};
			_i = _i + 1;
		};
		_i = 0;_dist = 10000;
		while {_i < count _temp} do
		{
			_entry = _temp select _i;
			_d = (((units _entry) select 0) distance ((units _group) select 0));
			if(_d < _dist) then {_dist = _d;_checkgroup = _entry};
			_i = _i + 1;
		};
		if(_dist < 10000) then
		{
			_array set [count _array,_checkgroup];_run = -1;
		}
		else
		{
			if(_run == 0) then
			{
				_run = _run + 1;
			}
			else
			{
				_run = -1;
			};
		};
	}
	else
	{
		_run = -1;
	};
};

_array;