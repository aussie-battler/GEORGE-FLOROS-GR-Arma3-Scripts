//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Waiting_for_Null  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_groupende","_groupside","_grouppara","_camparray",
			"_marker","_delarray","_rCamp","_dC","_ca","_c","_run","_ma"
		];

			_groupende = _this select 0;_groupside = _this select 1;_grouppara = _this select 2;_camparray = _this select 3;
			_marker = _this select 4;_delarray = [];_rCamp = [];_dC = [];_ca = [];_c = 0;_run = true;_ma = _this select 5;

sleep 3;

switch (_groupside) do
{
	case 0:	{_dC = call compile format["DAC_Spawn_CampsE"]};
	case 1:	{_dC = call compile format["DAC_Spawn_CampsW"]};
	case 2:	{
				if(DAC_Res_Side == 0) then
				{
					_dC = call compile format["DAC_Spawn_CampsE"];
				}
				else
				{
					_dC = call compile format["DAC_Spawn_CampsW"]
				};
			};
	Default {};
};

While {_c < count _dC} do
{
	_ca = _dC select _c;
	if((_ca select 1) == (_camparray select 0)) then
	{
		_c = (count _dC + 1);
	};
	_c = _c + 1;
};

sleep 1;

while {_run} do
{
	if(((getMarkerSize _ma) select 0) <= 4) then
	{
		_run = false;
	}
	else
	{
		if((((_ca select 5) select 0)+((_ca select 5) select 1)) == 0) then
		{
			if(count _marker > 0) then
			{
				(_marker select 0) setmarkertext "<--- [0,0] Respawn(s) left";
				sleep 3;
				deletemarkerlocal (_marker select 0);_run = false;
			};
		}
		else
		{
			if(count _marker > 0) then {(_marker select 0) setmarkertext format["<--- [%1,%2] Respawn(s) left",((_ca select 5) select 0),((_ca select 5) select 1)]};
		};
		sleep (0.5 + (random 0.5));
	};
};
sleep 0.1;
{deletevehicle _x} foreach _camparray;
deletemarkerlocal (_marker select 0);