


//________________	Author : GEORGE FLOROS [GR]	___________	29.03.19	___________


/*
________________	GF Earplugs Script - Mod	________________

https://forums.bohemia.net/forums/topic/215844-gf-earplugs-script-mod/

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
(this way will be better , it will give also some certain colors to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


class CfgPatches {
	class GF_Earplugs_mod {

		units[] = {};
		weapons[] = {};
		requiredAddons[] = {};
		author[] = {"GEORGE FLOROS[GR]"};
		authorUrl="https://forums.bohemia.net/profile/1141978-george-floros-gr/";
	};
};

class CfgFunctions {
	class GF_Earplugs_mod {
		class GF_Earplugs {
			class Init {
				file = "\GF_Earplugs\init.sqf";
				postInit = 1;
			};
		};
	};
};

class RscTitles
{
	#include "\GF_Earplugs\GF_Earplugs_HPP.hpp"	
};