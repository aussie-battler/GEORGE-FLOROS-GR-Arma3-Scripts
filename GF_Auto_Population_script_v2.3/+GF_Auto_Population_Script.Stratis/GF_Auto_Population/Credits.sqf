


//________________	Author : GEORGE FLOROS [GR]	___________	08.03.19	___________


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

For the Compilation List of my GF Scripts - Mods , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts-mods/

BI Forum Ravage Club Owner :
https://forums.bohemia.net/clubs/73-bi-forum-ravage-club/
*/


// Please keep the Credits or add them to your Diary

waitUntil {uisleep 1;!(isNull (findDisplay 46))};

//Credits
_subject = player createDiarySubject ["GF Auto Population Script - Mod", "GF Auto Population Script - Mod"];
_log_briefing = player createDiaryRecord ["GF Auto Population Script - Mod", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF Auto Population Script - Mod
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    2 . 2
<br />
<br /><font size='17' color='#0059B0'>GF Auto Population Script - Mod
<br />
<br />
<br /><font size='15' color='#A1D2FA'>
<br />
GF Auto Population Script - Mod  , will work automatically and populate every Map and Water Maps as well , with enemies on infinite , 
according the selected spawn distance and the max number of enemy.
<br />
It is created with a concept of , players being in a hostile territory.
The intention of this Script - Mod ,
is to be played alone or even boost your mission and enchase generally the game play.
<br />
There is a variety , over 75 different spawn possible settings , 
from spawning a single unit , transported infantry with land vehicles and helicopters , attacking planes , speed boats patroling , 
divers and every kind of spawn possibillity , except UAV and drones.
<br />
There are arrays , for the Units used , where everything is sorted from every possible type and usage of infantry and vehicles, 
in order to change them easy , to your faction desired enemies , like CUP and RHS or Custom etc.
<br />
There is no editing needed in the 3d editor with markes , triggers etc.
It's created in mind , to be as configurable as possible , easy to read , use and edit.
<br />
There is a dynamic unit spawn and despawn depended on maximum number of enemies and distance.
There are options about the spawn positions of the units.
There are Safe distances and Blacklist Zones , from players and spawned units .
<br />
Everything will be total random , according the selected options and the spawn settings.
<br />
Get prepared for anything , 
because the enemy will defend and attack , patrol , reckon , garrison for the infantry and the same , for all the type of vehicles units as well.
<br />
<br />
DO NOT use with :
ZBE_Cache caching script or addon 
<br />
<br />
<br />You are free to do anything but 
<br />i would like to give me Credits for this!
<br />
<br />Simple and easy to use and adapt .
<br />
<br />
<br />Thanks to All script contributors .
<br />Thanks to everyone who tries to do the best for this game!
<br />Thanks to Armaholic Community and Forums .
<br />Thanks to BIS for such a great platform.
<br />Thanks to BIS Community and BIS Community Forums
<br />
<br />
<br />Available at :
<br />Armaholic and Bohemia Interactive Forums 
<br />
<br />
<br /><font size='20' color='#FF0000'>Have Fun !
"
]];