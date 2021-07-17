//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Find_EllipsPos    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private	[
			"_DAC_EnemyZone","_DAC_ZoneRadiusX","_DAC_ZoneRadiusY","_newPos","_action","_rx","_ry","_RandomX",
			"_RandomY","_posZoneX","_posZoneY","_dirZone","_firstResult","_secondResult","_lastResult","_addDir","_thirdResult"
		];
		
_DAC_EnemyZone = _this select 0;_DAC_ZoneRadiusX = _this select 1;_DAC_ZoneRadiusY = _this select 2;
_newPos = [];_action = true;_posZoneX = position _DAC_EnemyZone select 0;_posZoneY = position _DAC_EnemyZone select 1;
_rx = 0;_ry = 0;_rsin = [];_rcos = [];_RandomX = [];_RandomY = [];_dirZone = direction _DAC_EnemyZone;
_firstResult = 0;_secondResult = 0;_lastResult = 0;_addDir = 0;_thirdResult = [];

while{_action} do
{
	_dirZone = ((triggerarea _DAC_EnemyZone) select 2);
	_rx = random (_DAC_ZoneRadiusX * 2);_ry = random (_DAC_ZoneRadiusY * 2);
	
	_rsin =	[
				(position _DAC_EnemyZone Select 0) + (Sin ((triggerarea _DAC_EnemyZone) select 2) * ((-_DAC_ZoneRadiusY) + _ry)),
				(position _DAC_EnemyZone Select 1) + (Cos ((triggerarea _DAC_EnemyZone) select 2) * ((-_DAC_ZoneRadiusY) + _ry))
			];
	_rcos =	[
				(_rsin Select 0) + (Sin (((triggerarea _DAC_EnemyZone) select 2) + 90) * ((-_DAC_ZoneRadiusX) + _rx)),
				(_rsin Select 1) + (Cos (((triggerarea _DAC_EnemyZone) select 2) + 90) * ((-_DAC_ZoneRadiusX) + _rx))
			];
			
	_RandomX = (_rcos Select 0);_RandomY = (_rcos Select 1);
	_firstResult = ((_RandomX) - (_posZoneX)) atan2 ((_RandomY) - (_posZoneY));
	_secondResult = [_RandomX,_RandomY] distance [_posZoneX,_posZoneY];
	_thirdResult = [_posZoneX + (Sin (_firstResult - _dirZone) * _secondResult),_posZoneY + (Cos (_firstResult - _dirZone) * _secondResult),0];
	_lastResult = (((_thirdResult select 0)-_posZoneX) ^ 2) / (_DAC_ZoneRadiusX ^ 2) + (((_thirdResult select 1)-_posZoneY) ^ 2) / (_DAC_ZoneRadiusY ^ 2);
	if (_lastResult < 1) then
	{
		_newPos = [_RandomX,_RandomY];
		_action = false;
	};
};
_newPos