


//________________	Author : GEORGE FLOROS [GR]	___________	02.04.19	___________


/*
________________	GF Auto Population Script - Mod	________________

https://forums.bohemia.net/forums/topic/221987-gf-auto-population-script-mod/

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
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


Changelog:

Version 2.3

Script Author :
 
by GEORGE FLOROS [GR]


Description:

GF Auto Population Script - Mod , will work automatically and populate every Map and Water Maps as well , with enemies on infinite.
You are free to do anything but i would like to give me Credits for this!
Simple and easy to use and adapt .
Have Fun !


Installation / Usage:

For usage instructions and information of how to use the GF Auto Population Script - Mod please refer to the included documentation and/or example mission.
Place in your mission the files . There is everything included , in the initServer.sqf  , to copy paste in your mission .

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

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/


Notes:

GF Auto Population Script - Mod  , will work automatically and populate every Map and Water Maps as well , with enemies on infinite , 
according the selected spawn distance and the max number of enemy.

It is created with a concept of , players being in a hostile territory.
The intention of this Script - Mod ,
is to be played alone or even boost your mission and enchase generally the game play.

There is a variety , over 75 different spawn possible settings , 
from spawning a single unit , transported infantry with land vehicles and helicopters , attacking planes , speed boats patroling , 
divers and every kind of spawn possibillity , except UAV and drones.

There are arrays , for the Units used , where everything is sorted from every possible type and usage of infantry and vehicles, 
in order to change them easy , to your faction desired enemies , like CUP and RHS or Custom etc.

There is no editing needed in the 3d editor with markes , triggers etc.
It's created in mind , to be as configurable as possible , easy to read , use and edit.

There is a dynamic unit spawn and despawn depended on maximum number of enemies and distance.
There are options about the spawn positions of the units.
There are Safe distances and Blacklist Zones , from players and spawned units .

Everything will be total random , according the selected options and the spawn settings.

Get prepared for anything , 
because the enemy will defend and attack , patrol , reckon , garrison for the infantry and the same , for all the type of vehicles units as well.


There is a Script and a Mod version available.
The Mod version , is using a userconfig , to set your desired settings.

For the Script version :

To adjust the settings :
GF_Auto_Population_Settings.sqf

and for the spawn types :
GF_Auto_Population_Spawn_Settings.sqf


For the Mod version :

userconfig Installation :

Place the "userconfig" folder into your Arma 3 main folder.
You may already have "userconfig" folder from other addons and/or mods in which case it is safe to merge the contents from this archive.


There are also incuded 2 scipts:
GF Auto Random Loadout Script -Mod https://forums.bohemia.net/forums/topic/220873-gf-auto-random-loadout-script/
GF Units Map Markers and Symbols Script - Mod https://forums.bohemia.net/forums/topic/219763-gf-units-map-markers-and-symbols-script/


DO NOT use with :
ZBE_Cache AI and Vehicle caching script/addon 


Credits and Thanks to :

Thanks to All script contributors
Thanks to everyone who tries to do the best for this game!
Thanks to BIS for such a great platform .
Thanks to BIS Community and BIS Community Forums .
Thanks to Armaholic Community and Forums .


Changelog:

v2.3
Fixed the error GF_AP_Pos_Random_Water.

v2.2
Fixes for :
the Position scripts , Spawn settings and the Location settings , Enemy spawn scripts and minor fixes.
Changes on the Mod Userconfig files and Settings.
Code optimization.

v2.1
Fixed the Userconfig settings for the Mod version.

v2.0
Fixed working in SP.
Dynamic simulation is available to save the FPS and increase , also the max spawn unit number. 
Uavs , Drones and Ugvs spawn, is now available. 
A lot of code fixes and code optimization.
Added some extra settings.

v1.1 
Fixed unit despawn error in MP.
Spawn_Settings for the Mod version are available in the userconfig.

v1.0 


No addons Required.



more info in :

Forum topic:
- BI forums https://forums.bohemia.net/forums/topic/221987-gf-auto-population-script-mod/
- Armaholic forums http://www.armaholic.com/forums.php?m=posts&q=40381


Disclaimer :

I take no responsibility for (im)possible damage to your game/system that may be caused by installation of this Mission.

ALL CONTENT IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND. I MAKE NO WARRANTIES, EXPRESS OR IMPLIED, 
THAT THEY ARE FREE OF ERROR, OR ARE CONSISTENT WITH ANY PARTICULAR STANDARD OF MERCHANTABILITY, OR THAT 
THEY WILL MEET YOUR REQUIREMENTS FOR ANY PARTICULAR APPLICATION. USE AT YOUR OWN RISK. THE AUTHOR AND 
PUBLISHER DISCLAIM ALL LIABILITY FOR DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES RESULTING FROM YOUR 
USE OF THE PROGRAMS.  