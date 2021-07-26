


//________________  Author : GEORGE FLOROS [GR] ___________ 16.09.18 _____________

/*
________________ GF Set AISkill Script ________________

https://forums.bohemia.net/forums/topic/219363-gf-set-aiskill-script/?tab=comments#comment-3314767

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

GF Set AISkill Script , Set your desired AI Skills settings.
You are free to do anything but i would like to give me Credits for this!
Simple and easy to use and adapt .
Have Fun !


Installation / Usage:

For usage instructions and information of how to use the GF Set AISkill Script please refer to the included documentation and/or example mission.
Place in your mission the files . There is everything included , in the init.sqf and description.ext , to copy paste in your mission .

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
 
Copy in the descripion.ext  : 
#include "Mission_Parameters.hpp"	
and add the Mission_Parameters.hpp in your mission files.

Or copy , in your descripion.ext :

class Params
{
	class GF_Set_AISkill 
	{
		title = "GF_Set_AISkill";
		values[] = {0,1,2,3,4,5};
		default = 1;
		texts[] = {"Novice","Rookie","Recruit","Veteran","Expert","Random"};
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
- BI forums https://forums.bohemia.net/forums/topic/219363-gf-set-aiskill-script/?tab=comments#comment-3314767
- Armaholic forums http://www.armaholic.com/forums.php?m=posts&q=40229 


Disclaimer :

I take no responsibility for (im)possible damage to your game/system that may be caused by installation of this Mission.

ALL CONTENT IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND. I MAKE NO WARRANTIES, EXPRESS OR IMPLIED, 
THAT THEY ARE FREE OF ERROR, OR ARE CONSISTENT WITH ANY PARTICULAR STANDARD OF MERCHANTABILITY, OR THAT 
THEY WILL MEET YOUR REQUIREMENTS FOR ANY PARTICULAR APPLICATION. USE AT YOUR OWN RISK. THE AUTHOR AND 
PUBLISHER DISCLAIM ALL LIABILITY FOR DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES RESULTING FROM YOUR 
USE OF THE PROGRAMS.  