


//________________  Author : [GR]GEORGE F ___________	24.01.19	_____________

/*
________________	GF Cargo Airdrops Script - Mod	________________

https://forums.bohemia.net/forums/topic/215257-cargo_airdrops_gf-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

ArmA 3 | Notepad ++ SQF tutorial
https://www.youtube.com/watch?v=aI5P7gp3x90

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


[] execVM "GF_Cargo_Airdrops\Credits.sqf";	// Please keep the Credits or add them to your Diary
[] execVM "GF_Cargo_Airdrops\GF_Cargo_Airdrops.sqf";


//	You can call this with radio trigger

//	GF_Cargo_Airdrops_Request.sqf
_radio_1 = createTrigger["EmptyDetector",[0,0]];
_radio_1 setTriggerActivation["Alpha","PRESENT",true];
_radio_1 setTriggerStatements["this","execVM 'GF_Cargo_Airdrops\GF_Cargo_Airdrops_Request.sqf'",""];
1 setRadioMsg "Cargo Airdrop Request";


//	GF_Cargo_Airdrops_ZAG_LORD.sqf
_radio_2 = createTrigger["EmptyDetector",[0,0]];
_radio_2 setTriggerActivation["Bravo","PRESENT",true];
_radio_2 setTriggerStatements["this","execVM 'GF_Cargo_Airdrops\GF_Cargo_Airdrops_ZAG_LORD.sqf'",""];
2 setRadioMsg "ZAG_LORD Airdrop";

//	OR

//	GF_Cargo_Airdrops_Request , add action in an item or player	https://community.bistudio.com/wiki/addAction
//player addAction ["Cargo Airdrop", "GF_Cargo_Airdrops\GF_Cargo_Airdrops_Request.sqf"];