//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Arti_Conditions   //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_callGroup","_enemyGroup","_artiArray","_parameter","_i","_color","_v","_nPos","_addcondition","_maxI","_maxA",
			"_a","_c","_s","_leader","_veh","_random","_list","_h","_artiVeh","_artiUnit","_nObj","_condition","_countbullets",
			"_target","_usercondition","_tempV","_tempA","_n","_f","_d","_cArray","_val","_sArray","_uArray","_tArray","_maxDistance","_deba"
		];

			_callGroup = _this select 0;_enemyGroup = _this select 1;_i = 0;_veh = [];_random = 0;_a = 0;_v = 0;_condition = [];_deba = [];
			_artiArray = _this select 2;_color = _this select 3;_parameter = [];_artiUnit = DAC_StartDummy;_addcondition = [];
			_leader = leader _callGroup;_s = 0;_h = 0;_c = 0;_artiVeh = [];_nObj = [];_nPos = position DAC_StartDummy;_maxI = 0;
			_tArray = [];_tempV = [];_tempA = [];_n = 0;_f = 0;_target = _this select 4;_d = _this select 5;_maxDistance = 0;_maxA = 0;
			_cArray = [];_sArray = [];_val = 0;_uArray = [];_countbullets = 0;

if((_enemyGroup in DAC_Arti_Array) || (((_artiArray select 2) select 3) == 0)) then
{
	if(time > 0) then
	{
		if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", 13, true]};
		_parameter
	};
}
else
{
	_uArray set [count _uArray,format["%1",side _leader]];
	switch (format["%1",side _leader]) do
	{
		case "WEST":	{if(DAC_Res_Side == 1) then {_uArray set [count _uArray,"GUER"]}};
		case "EAST":	{if(DAC_Res_Side == 0) then {_uArray set [count _uArray,"GUER"]}};
		case "GUER":	{
							if(DAC_Res_Side == 1) then {_uArray set [count _uArray,"WEST"]};
							if(DAC_Res_Side == 0) then {_uArray set [count _uArray,"EAST"]};
						};
		default {_i = 3;_a = 0};
	};
	DAC_Arti_Array set [count DAC_Arti_Array,_enemyGroup];
	if((typeof _target) == "LOGIC") then {_i = 1;_a = 1};
	while {_i < 3} do
	{
		switch (_i) do
		{
			case 0:	{
						_condition = (_artiArray select _i);
						if(({((alive _x) && ((speed _x) > (_condition select 0)))} count (units _enemyGroup)) > 0) then {_i = 4;_h = 1};
						if(_i < 3) then {if(({alive _x} count (units _enemyGroup)) < (_condition select 1)) then {_i = 4;_h = 2}};
						if(_i < 3) then {{if((_x != vehicle _x) && (!((vehicle _x) in _veh))) then {_veh set [count _veh,vehicle _x]}} foreach (units _enemyGroup)};
						if(_i < 3) then {if(count _veh < (_condition select 2)) then {_i = 4;_h = 3}};
						if(_i != 4) then {_i = _i + 1;_a = _a + 1};
					};
			case 1:	{
						_condition = (_artiArray select _i);
						if(({alive _x} count (units _callGroup)) < (_condition select 0)) then {_i = 4;_h = 4};
						if(_i < 3) then {if({(alive _x) && ((_leader distance _x) < (_condition select 2))} count (units _enemyGroup) > 0) then {_i = 4;_h = 5}};
						if((_i < 3) && ((count (_condition select 3)) > 0)) then {if(({(alive _x) && (format["%1",typeof _x] in (_condition select 3))} count (units _callGroup)) == 0) then {_i = 4;_h = 6}};
						if(_i < 3) then {{if(alive _x) then {_c = _c + 1;_s = _s + (skill _x)}} foreach (units _callGroup)};
						if(_i < 3) then {if((_s / _c) < (_condition select 1)) then {_i = 4;_h = 7}};
						if(_i != 4) then {_i = _i + 1;_a = _a + 1};
					};
			case 2:	{
						_condition = (_artiArray select _i);_random = random 100;
						_addcondition = (_artiArray select (_i + 1));
						_usercondition = (_artiArray select (_i + 6));
						_countbullets = (_condition select 5);
						_maxDistance = (_artiArray select (_i + 8));
						if(_random > (_condition select 0)) then {_i = 4;_h = 8};
						if((_i < 3) && ((_condition select 2) > 0)) then
						{
							_nPos = position (leader _enemyGroup);
							_nObj = _nPos nearEntities [["Man"], ((_condition select 2) + _d)];
							if(count _nObj > 0) then
							{
								if((_leader countFriendly _nObj) > 0) then {_i = 4;_h = 9};
							};
						};
						if((_i < 3) && (count _usercondition > 0)) then
						{
							{
								if((alive (_x select 0))
								&& (((_x select 0) distance _target) > ((_condition select 1) + _d))
								&& (!((_x select 0) in DAC_Arti_Veh))
								&& (format["%1",side (gunner (_x select 0))] in _uArray)
								&& (format["%1",gunner (_x select 0)] != "<NULL-object>")) then
								{
									_maxA = _maxA + 1;
									if(((_x select 0) distance _target) < _maxdistance) then
									{
										if((_condition select 6) >= 1) then
										{
											_artiVeh set [count _artiVeh,[(_x select 0),(_x select 1)]];
											DAC_Arti_Veh set [count DAC_Arti_Veh,(_x select 0)];
										}
										else
										{
											if(format["%1",driver (_x select 0)] == "<NULL-object>") then
											{
												_artiVeh set [count _artiVeh,[(_x select 0),(_x select 1)]];
												DAC_Arti_Veh set [count DAC_Arti_Veh,(_x select 0)];
											}
											else
											{
												_maxA = _maxA - 1;
											};
										};
									}
									else
									{
										_maxI = _maxI + 1;
									};
								};
							} 	foreach _usercondition;
						};
						if((_i < 3) && (((count _addcondition) > 0) || ((count _artiVeh) > 0))) then
						{
							while {_n < count _addcondition} do
							{
								_tempV set [count _tempV,((_addcondition select _n) select 0)];
								_tempA set [count _tempA,((_addcondition select _n) select 1)];
								_n = _n + 1;
							};
							_list = list DAC_Trigger;_v = 0;
							while {_v < count _list} do
							{
								_artiUnit = _list select _v;
								if(format["%1",gunner _artiUnit] != "<NULL-object>") then
								{
									if(format["%1",side (gunner _artiUnit)] in _uArray) then
									{
										if((alive _artiUnit)
										&& (someammo _artiUnit)
										&& (format["%1",typeof _artiUnit] in _tempV)
										&& ((_artiUnit distance _target) > ((_condition select 1) + _d))) then
										{
											_maxA = _maxA + 1;
											if((_artiUnit distance _target) < _maxDistance) then
											{
												if(!(_artiUnit in DAC_Arti_Veh)) then
												{
													if(!(_artiUnit in _tArray)) then
													{
														if((_condition select 6) >= 1) then
														{
															_f = _tempV find format["%1",typeof _artiUnit];
															if(_f >= 0) then
															{
																_artiVeh set [count _artiVeh,[_artiUnit,(_tempA select _f)]];
																_tArray set [count _tArray,_artiUnit];
															};
														}
														else
														{
															if(format["%1",driver _artiUnit] == "<NULL-object>") then
															{
																_f = _tempV find format["%1",typeof _artiUnit];
																if(_f >= 0) then
																{
																	_artiVeh set [count _artiVeh,[_artiUnit,(_tempA select _f)]];
																	_tArray set [count _tArray,_artiUnit];
																};
															}
															else
															{
																_maxA = _maxA - 1;
															};
														};
													}
													else
													{
														_maxA = _maxA - 1;
													};
												}
												else
												{
													_maxA = _maxA - 1;
												};
											}
											else
											{
												_maxI = _maxI + 1;
											};
										}
										else
										{
											//
										};
									}
									else
									{
										//
									};
								}
								else
								{
									//
								};
								_v = _v + 1;
							};
							if(_i != 4) then {_i = 3};
						};
					};
			default	{};
		};
	};
	if(_i == 4) then
	{
		_a = 0;
	}
	else
	{
		if(count _artiVeh == 0) then
		{
			if(_maxI > 0) then
			{
				if(_maxI == _maxA) then
				{
					_a = 0;_h = 12;
				}
				else
				{
					_a = 0;_h = 10;
				};
			}
			else
			{
				_a = 0;_h = 10;
			};
		}
		else
		{
			_a = _a + 1;
		};
	};
	if(_a == 3) then
	{
		if((({alive _x} count units _enemyGroup) > 0) || ((typeof _target) == "LOGIC")) then
		{	
			if(count _artiVeh > (_condition select 4)) then
			{
				while {(count _sArray < (_condition select 4))} do
				{
					_val= round (random ((count _artiVeh) - 1));
					if(!(_val in _cArray)) then
					{
						_cArray set [count _cArray,_val];
						_sArray set [count _sArray,(_artiVeh select _val)];
						DAC_Arti_Veh set [count DAC_Arti_Veh,((_artiVeh select _val) select 0)];
					};
				};
			}
			else
			{
				_sArray = _artiVeh;
				{DAC_Arti_Veh set [count DAC_Arti_Veh,(_x select 0)]}foreach _artiVeh;
			};
			_parameter = [position _target,_sArray];
			_oldValue = ((_artiArray select 2) select 3);
			(_artiArray select 2) set [3, (_oldValue - 1)];
			if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", 0, true]};
			if((DAC_Com_Values select 0) > 0) then {if(format["%1",(side (leader _callGroup))] != "CIV") then {DAC_StartDummy globalchat format["Call arti support (%2x%4 %3) succesfully. Target to Player %1m",(_target distance player),count (_parameter select 1),side (leader _callGroup),_countbullets]}};
			if(local player) then {[10,(leader _callGroup),5] spawn DAC_fAIRadio} else {[10,(leader _callGroup),8] spawn DAC_fAIRadio};
			_parameter;
		}
		else
		{
			_parameter;
		};
	}
	else
	{	
		if(!(isNil "DAC_Support_Logic")) then {DAC_Support_Logic setVariable ["arti_error", _h, true]};
		DAC_Arti_Array = DAC_Arti_Array - [_enemyGroup];
		if((DAC_Com_Values select 0) > 0) then {if(format["%1",(side (leader _callGroup))] != "CIV") then {DAC_StartDummy globalchat format["Call arti support [%2] aborted - reason %1",_h,side (leader _callGroup)]}};
		[16,(leader _callGroup)] spawn DAC_fAIRadio;
		_parameter;
	};
};