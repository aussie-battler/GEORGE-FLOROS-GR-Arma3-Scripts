//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Group_Getin       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_group","_vehvalue","_cu","_nu","_cv","_ca","_fp","_go"];

_group = _this select 0;_vehvalue = _this select 1;_cu = 0;_cv = 0;_ca = 0;_go = 1;

while {_go > 0} do
{
	if((_cu >= count units _group)
	|| (({((_x select 1) + (_x select 2)) > 0} count _vehvalue) == 0)) then
	{
		_go = 0;
	}
	else
	{
		_nu = units _group select _cu;
		if((not alive _nu) || (not canmove _nu) || (!(vehicle _nu == _nu))) then
		{
			_cu = _cu + 1;
		}
		else
		{
			if(_cv >= count _vehvalue) then
			{
				if(_ca < 2) then {_cv = 0;_ca = _ca + 1} else {_cv = 0};
			};
			switch (_ca) do
			{
				case 0:	{
							_nv = ((_vehvalue select _cv) select 0);
							if(_nu == leader _group) then {_nu move (_nv modelToWorld [-5,0,0])} else {_nu commandmove (_nv modelToWorld [-5,0,0])};
							_nu assignasdriver _nv;[_nu] ordergetin true;[_nu] allowgetin true;[1,(leader _group)] spawn DAC_fAIRadio;
							_cv = _cv + 1;_cu = _cu + 1;
						};
				case 1:	{
							_fp = ((_vehvalue select _cv) select 1);
							if(_fp > 0) then
							{
								_nv = ((_vehvalue select _cv) select 0);
								if(_nu == leader _group) then {_nu move (_nv modelToWorld [-5,0,0])} else {_nu commandmove (_nv modelToWorld [-5,0,0])};
								_nu assignasgunner _nv;[_nu] ordergetin true;[_nu] allowgetin true;
								(_vehvalue select _cv) set [1, (_fp - 1)];
								_cv = _cv + 1;_cu = _cu + 1;
							}
							else
							{
								_cv = _cv + 1;
							};
						};
				case 2:	{
							_fp = ((_vehvalue select _cv) select 2);
							if(_fp > 0) then
							{
								_nv = ((_vehvalue select _cv) select 0);
								if(_nu == leader _group) then {_nu move (_nv modelToWorld [-5,0,0])} else {_nu commandmove (_nv modelToWorld [-5,0,0])};
								_nu assignascargo _nv;[_nu] ordergetin true;[_nu] allowgetin true;
								(_vehvalue select _cv) set [2, (_fp - 1)];
								_cv = _cv + 1;_cu = _cu + 1;
							}
							else
							{
								_cv = _cv + 1;
							};
						};
				default	{};
			};
		};
	};
};