


//________________  Author : GEORGE FLOROS [GR] ___________ 10.08.18 _____________

/*
________________ GF Skinning Script ________________

https://forums.bohemia.net/forums/topic/218636-gf-skinning-script/

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


/*
Big thanks to Killzonekid , for his ArmA Scripting Tutorials
http://killzonekid.com/category/tutorials/
*/


diag_log "//________________ GF Skinning Script _____________";

systemchat "GF Skinning Script    I n i t i a l i z e d";

//________________ GF Skinning Script _____________




//________________	adding a Ravage Knife for the test	________________

_uniform = uniformContainer player;
_vest = vestContainer player;
_backpack	= BackpackContainer player;

_vest addItemCargoGlobal ["rvg_guttingKnife", 1];

//________________	adding a Heros Survive Knife for the test	________________

_vest addItemCargoGlobal ["herl_u_Knife", 1];



//________________	spawning some animals for the test	________________ 
_animal_array = selectrandom [	
	// dog
	"Fin_sand_F","Fin_blackwhite_F","Fin_ocherwhite_F","Fin_tricolour_F","Fin_random_F","Alsatian_Sand_F","Alsatian_Black_F",
	"Alsatian_Sandblack_F","Alsatian_Random_F",
	// other
	"Hen_random_F","Cock_random_F","Cock_white_F",
	"Goat_random_F","Sheep_random_F"
];

//________________	as agent	________________
_createAgent_animal = createAgent [_animal_array, getPos player, [], 10, "CAN_COLLIDE"];

//________________	as unit	________________
_grp_animal = createGroup CIVILIAN;
_createUnit_animal = _grp_animal createUnit [_animal_array, getPos player, [], 10, "CAN_COLLIDE"];




addMissionEventHandler ["EntityKilled", 
{
	params ["_killed", "_killer", "_instigator"];
		
	GF_Skinning_Killed = _this select 0;
	GF_Skinning_Killer = _this select 1;
	if (
	
	//________________	This will affect men , you can comment to disable	________________
	GF_Skinning_Killed isKindOf "CAManBase" 	
	or 
	//________________	This will affect animals, you can comment to disable	________________
	GF_Skinning_Killed isKindOf "ANIMAL"
	) then {
	
    _tr1 = createTrigger [
        "EmptyDetector",
        position (_this select 0)
    ];
    _tr1 setTriggerArea [1.2,1.2,0,false];
    _tr1 setTriggerStatements [
        "this",
        "actionGutID = GF_Skinning_Killer addAction [
            'Skin and quarter the body',
            {
				execVM 'GF_Skinning\GF_Skinning.sqf';	  
					
            },
            thisTrigger,
            0,
            true,
            true
        ]",
        "GF_Skinning_Killer removeAction actionGutID"
    ];
    _tr1 triggerAttachVehicle [GF_Skinning_Killer];
	};
}];