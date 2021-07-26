//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 1.2 - 2007    //
//--------------------------//
//    DAC_Check_ObjScr      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_DAC_WP_Typ","_DAC_Count_WP","_KiZone",
			"_scr","_DAC_WP_Nr","_obj_Nr","_objArray",
			"_arrayName"
		];
		
			_KiZone = objNull;_scr = "";_DAC_Count_WP = _this select 1;_wpc = _this select 2;
			_arrayName = _this select 7;_DAC_WP_Typ = _this select 3;_obj_Nr = _this select 4;
			_inst = _this select 5;_objArray = _this select 6;

if((typeName (_this select 0)) != "STRING") then
{
	hintc format["The name of an object zone is not correct !\n\nThe Name of a zone in the Script call must be a string."];
	DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
}
else
{
	_KiZone = call compile (_this select 0);
	if(format["%1",_KiZone] == scalar) then
	{
		hintc format["The name of an object zone is not correct !\n\nEither in the Script call,\nor the name of one Trigger\nis not right."];
		DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
	}
	else
	{
		if(format["%1%2",_KiZone,count _this] in DAC_Obj_Init) then
		{
			hintc format["The name of an object zone is not correct !\n\nThere are at least two zones, which contain the same zone name."];
			DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
		}
		else
		{
			if((typeName (_this select 6)) != "ARRAY") then
			{
				hintc format["The script call within an object zone is not correct !\n\nOne value must be an array."];
				DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
			}
			else
			{
				if(_DAC_WP_Typ > 5) then
				{
					hintc format["The script call within an object zone is not correct !\n\nOnly values between 0 and 5 are allowed.\n(Waypoit type)"];
					DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
				}
				else
				{
					if(format["%1",(_this select 7)] == "ANY") then
					{
						hintc format["The script call within an object zone is not correct !\n\nThe last value must be a string."];
						DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
					}
					else
					{
						if((typeName (_this select 7)) != "STRING") then
						{
							hintc format["The script call within an object zone is not correct !\n\nThe last value must be a string."];
							DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
						}
						else
						{
							if(count _this == 8) then
							{
								//script call ok;
							}
							else
							{
								if(count _this < 8) then
								{
									hintc format["The script call within an object zone is not correct !\n\nIt is missing at least 1 parameter."];
									DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
								}
								else
								{
									if((count _this > 8) && (count _this != 11)) then
									{
										hintc format["The script call within an object zone is not correct !\n\nTo many parameters."];
										DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
									}
									else
									{
										if(!(isNull (_this select 9))) then
										{
											hintc format["The script call within an object zone is not correct !\n\nTo many parameters."];
											DAC_Basic_Value = 10;publicvariable "DAC_Basic_Value";
										}
										else
										{
											//script call ok;
										};
									};
								};
							};
						};
					};
				};
			};
		};
	};
};