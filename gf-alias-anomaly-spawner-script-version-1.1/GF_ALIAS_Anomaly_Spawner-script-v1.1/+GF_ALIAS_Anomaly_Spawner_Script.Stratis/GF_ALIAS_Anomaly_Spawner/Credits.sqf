


//________________	Author : GEORGE FLOROS [GR]	___________	06.04.19	___________


/*
________________	GF ALIAS Anomaly Spawner Script	________________

https://forums.bohemia.net/forums/topic/222715-gf-alias-anomaly-spawner-script/

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


// Please keep the Credits or add them to your Diary

waitUntil {!(isNull (findDisplay 46))};

//Credits
_subject = player createDiarySubject ["GF ALIAS Anomaly Spawner Script", "GF ALIAS Anomaly Spawner Script"];
_log_briefing = player createDiaryRecord ["GF ALIAS Anomaly Spawner Script", ["About and Credits", "

<br /><font size='30' color='#FF0000'>GF ALIAS Anomaly Spawner Script
<br />
<br /><font size='25' color='#FCEF06'>Author : GEORGE FLOROS [GR]
<br />
<br />
<br /><font size='15' color='#FF0000'>V e r s i o n    1 . 1
<br />
<br /><font size='17' color='#0059B0'>GF ALIAS Anomaly Spawner Script
<br />
<br />
<br /><font size='15' color='#A1D2FA'>GF ALIAS Anomaly Spawner Script , is a configurable spawner for ALIAS Anomaly Scripts.
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