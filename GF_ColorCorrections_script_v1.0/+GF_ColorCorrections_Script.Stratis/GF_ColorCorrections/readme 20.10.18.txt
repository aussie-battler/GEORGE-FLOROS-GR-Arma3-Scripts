


//________________  Author : GEORGE FLOROS [GR] ___________ 20.10.18 _____________

/*
________________ GF ColorCorrections Script ________________

https://forums.bohemia.net/forums/topic/219908-gf-colorcorrections-script/

Please keep the Credits or add them to your Diary

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /*
means that it is disabled , so there is no need to delete the extra lines.

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing .

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/
*/


Changelog:

Version 1.0

Script Author :
 
by GEORGE FLOROS [GR]


Description:

GF ColorCorrections Script , 14 themes available.
You are free to do anything but i would like to give me Credits for this!
Simple and easy to use and adapt .
Have Fun !


Installation / Usage:

For usage instructions and information of how to use the GF ColorCorrections Script please refer to the included documentation and/or example mission.
Place in your mission the files . There is everything included , in the initPlayerLocal.sqf , to copy paste in your mission .

https://community.bistudio.com/wiki/SQF_syntax
Don't try to open this with the simple notepad.
For everything that is with comment  //  in front  or between /* 
means that it is disabled , so there is no need to delete the extra lines. 

You can open this ex:
with notepad++
https://notepad-plus-plus.org/

and also use the extra pluggins
(this way will be better , it will give also some certain colours to be able to detect ex. problems )
http://www.armaholic.com/page.php?id=8680

or use any other program for editing . 

For the Compilation List of my GF Scripts , you can search in:
https://forums.bohemia.net/forums/topic/215850-compilation-list-of-my-gf-scripts/


Notes:

GF ColorCorrections Script , 14 themes available.
There are incuded also missions parameters.

To add them :

Copy in the descripion.ext  :

#include "Mission_Parameters.hpp"


and add the Mission_Parameters.hpp in your mission files.


Or copy , in your descripion.ext :

class Params
{
		class GF_ColorCorrections
	{
		title = "Color Correction theme Selection:";
		values[]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14};
	    texts[]={
		"Disabled",
		"Realistic Color Correction theme",
		"Post Apocalyptic theme",
		"Nightstalkers theme",
		"OFP Gamma theme",
		"Golden autumn theme",
		"Africa theme",
		"Afghan theme",
		"Middle East theme",
		"Real Is Brown theme",
		"Gray Tone theme",
		"Cold Tone theme",
		"Winter Blue theme",
		"Winter White theme",
		"Mediterranean theme"
		};
	   default=1;
    };
};




Credits and Thanks to :

Thanks to All script contributors
Thanks to everyone who tries to do the best for this game!
Thanks to BIS for such a great platform .
Thanks to BIS Community and BIS Community Forums .
Thanks to Armaholic Community and Forums .


Changelog:

v1.0 

  
Requirements : 

No addons required 


more info in :

Forum topic:
- BI forums https://forums.bohemia.net/forums/topic/219908-gf-colorcorrections-script/
- Armaholic forums http://www.armaholic.com/forums.php?m=posts&q=40260


Disclaimer :

I take no responsibility for (im)possible damage to your game/system that may be caused by installation of this Mission.

ALL CONTENT IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND. I MAKE NO WARRANTIES, EXPRESS OR IMPLIED, 
THAT THEY ARE FREE OF ERROR, OR ARE CONSISTENT WITH ANY PARTICULAR STANDARD OF MERCHANTABILITY, OR THAT 
THEY WILL MEET YOUR REQUIREMENTS FOR ANY PARTICULAR APPLICATION. USE AT YOUR OWN RISK. THE AUTHOR AND 
PUBLISHER DISCLAIM ALL LIABILITY FOR DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES RESULTING FROM YOUR 
USE OF THE PROGRAMS.  