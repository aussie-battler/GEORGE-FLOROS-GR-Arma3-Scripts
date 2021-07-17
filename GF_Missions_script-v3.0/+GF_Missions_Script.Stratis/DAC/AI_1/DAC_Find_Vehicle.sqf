//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_Vehicle      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_i","_entry","_array","_temp","_group","_emptVeh",
			"_emptGun","_proVeh","_proGun","_curV","_curG"
		];

			_group = _this select 0;_emptVeh = _this select 1;_emptGun = _this select 2;_i = 0;
			_proVeh = _this select 3;_proGun = _this select 4;_curV = _this select 5;_curG = _this select 6;
			_temp = [];_entry = objNull;_array = [objNull,objNull,_curV,_curG];

_i = 0;_temp = (position (leader _group)) nearEntities [["Car","Tank","Helicopter"], _emptVeh];
if((count _temp > 0) && (_proVeh > 0)) then
{
	while {_i < count _temp} do
	{
		_entry = _temp select _i;
		if(((getdammage _entry) < 1) && ((locked _entry) in [0,1]) && (simulationEnabled _entry)) then
		{
			if(!(format["%1",(typeof _entry)] in DAC_VehNotAllowed)) then
			{
				if(isNull _curV) then
				{
					_array set [2,_entry];_i = count _temp;
					if((random 100) <= _proVeh) then
					{
						if((!(_entry in DAC_VehicleInUse)) && (!(_entry in DAC_Locked_Veh))) then {_array set [0,_entry]};
					};
				}
				else
				{
					if(_entry != _curV) then
					{
						_array set [2,_entry];_i = count _temp;
						if((random 100) <= _proVeh) then
						{
							if((!(_entry in DAC_VehicleInUse)) && (!(_entry in DAC_Locked_Veh))) then {_array set [0,_entry]};
						};
					};
				};
			};
		};
		_i = _i + 1;
	};
};

_i = 0;_temp = (position (leader _group)) nearEntities [["StaticWeapon"], _emptGun];
if((count _temp > 0) && (_proGun > 0)) then
{
	while {_i < count _temp} do
	{
		_entry = _temp select _i;
		if(((getdammage _entry) < 1) && (!(_entry in DAC_Static)) && (simulationEnabled _entry)) then
		{
			if(!(format["%1",(typeof _entry)] in DAC_GunNotAllowed)) then
			{
				if((_entry emptyPositions "Gunner") > 0) then
				{
					if(isNull _curG) then
					{
						_array set [3,_entry];_i = count _temp;
						if((random 100) <= _proGun) then
						{
							_array set [1,_entry];
						};
					}
					else
					{
						if(_entry != _curG) then
						{
							_array set [3,_entry];_i = count _temp;
							if((random 100) <= _proGun) then
							{
								_array set [1,_entry];
							};
						};
					};
				};
			};
		};
		_i = _i + 1;
	};
};
_array;