
	// GF Earplugs

		[] execVM "GF_Earplugs\Credits.sqf";	

		addMissionEventHandler ["Loaded", {
			params ["_saveType"];
			
			If(_saveType isEqualto "continue") then{
				[] execVM "GF_Earplugs\GF_Earplugs.sqf";
			};
		}];

		[] execVM "GF_Earplugs\GF_Earplugs.sqf";
