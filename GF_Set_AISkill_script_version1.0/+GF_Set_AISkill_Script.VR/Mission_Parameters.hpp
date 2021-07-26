


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


//_________________________ Mission_Parameters ________________________

/*

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
	
*/


class Params
{
    class Empty_1 
	{
		title = "_______________________________________________________________________________________   Your Mission Name  _____________________________________________________________________________________";
		values[] = {-99999};
		default = -99999;
		texts[] = {""};
	};
	
	class Empty_2 
	{
		title = "__________________________________________________________________________________    B  Y    G  E  O  R  G  E    F  L  O  R  O  S    [  G  R  ]     __________________________________________________________________________________";
		values[] = {-99999};
		default = -99999;
		texts[] = {""};
	};
	
	class Empty_3 
	{
		title = "";
		values[] = {-99999};
		default = -99999;
		texts[] = {""};
	};
		
	class Empty_4 
	{
		title = "*** Your Can write here or keep them for spaces *** in the Mission_Parameters.hpp ";
		values[] = {-99999};
		default = -99999;
		texts[] = {""};
	};
	
	class Empty_5
	{
		title = "";
		values[] = {-99999};
		default = -99999;
		texts[] = {""};
	};	
	
	class GF_Set_AISkill 
	{
		title = "GF Set AISkill";
		values[] = {0,1,2,3,4,5};
		default = 0;
		texts[] = {"Novice","Rookie","Recruit","Veteran","Expert","Random"};
	};
	
};

//_________________________________________________