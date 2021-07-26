


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


//	If you want the script to run only in the server use the code below
//	if(!isServer) exitWith {};


diag_log "//________________ GF Cargo Airdrops Script - Mod _____________";


//________________ GF Cargo Airdrops Script - Mod _____________

//________________ Settings ________________
//________________ Set true or false  ________________

_Radio_Call               				= true;        	//	Play some Radio Sounds
_Virtual_Arsenal          				= false;       	//	Add Virtual Arsenal to Cargo
_Random_Loot							= true;         //	Add random loot , you need to select this or the one below
_Custom_loot							= false;      	//	Selected loot 
_Create_Markers    						= true;         //	Show the Airdrop position with a marker
_Number									= 5;			//	Number of the Airdrops
_Number_random							= 5;			//	+ random 5 Airdrops
_next_drop_in_sec   					= 10;          	//	_next_drop_in_sec - 10 is for test
_height_of_drop      					= 75;       	//	_height_of_drop - 75 is for test


//________________ Enemies ________________

_Spawn_Enemy							= true;		//	Spawn Enemy at the site
_Enemy_Side								= east;		

_Squad_Members							= 5;		//	+ floor random 5 below
_Squad_Members_random					= 5;

_set_AiSkill							= 0.50;
_set_AiSkill_random						= 0.50;

_Patrol_distance 						= 100;		//	The distance for BIS_fnc_taskPatrol
_Patrol_distance_random 				= 250;	



//________________	Enemy Array 	________________

_Pool_Infantry = [
	"O_G_officer_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F",
	"O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F",
	"O_G_Soldier_universal_F"
	];
	
	
	
	
systemchat "C a r g o   A i r d r o p s    I n i t i a l i z e d";


if (_Radio_Call) then {

//    systemchat "_Radio_Call";
_grid = mapGridPosition getPos player;
player sideChat format ["This is %1, requesting Supply drop at the transmitting coordinates %2, OVER.", name player, _grid];
playSound3D ["A3\dubbing_f\modules\supports\drop_request.ogg", player];
sleep 6;
player sideChat format ["Affirmative %1, Supplies on route , OUT.", name player];
playSound3D ["A3\dubbing_f\modules\supports\drop_acknowledged.ogg", player];
sleep 10;
};


private ["_Plane_sound","_x"];
_x = 0;
_a = 0;	

//________________ The number of the Cargo to spawn (on random) ________________
for "_x" from 0 to (_Number + (random _Number_random)) do {
_a = _a + 1;

//________________ For spawn one Cargo ________________
//for "_x" from  1 to (1) do {

//________________ The position to drop the Cargo ________________
	_Pos = [] call BIS_fnc_randomPos; 		//    For random location
//	_Pos = getmarkerPos "MarkerName";    	//    Create a Marker if you want a certain location -


//	Create a marker
//	_Pos = getmarkerPos "DROP_Marker_1";

/*
//	or select a random marker
_Marker_array =selectRandom[    
            "DROP_Marker_1",        
            "DROP_Marker_2",
			"DROP_Marker_3"			
            ];
_Pos = getmarkerPos _Marker_array;
*/


//    this can be a Supply drop with an add action in an item or player    https://community.bistudio.com/wiki/addAction
//	_Pos = getPos player;    //    for test or for support purpose



//    systemchat "_next_drop_in_sec 5";
sleep _next_drop_in_sec;
//    systemchat "d r o p p i n g";


//________________ Sound of plane flying above ________________
//    https://community.bistudio.com/wiki/Arma_3:_SoundFiles
//    playSound3D ["A3\Sounds_F\ambient\battlefield\battlefield_jet1.wss", _Cargo];

_sound = selectRandom [
	"Plane_sound1",
	"Plane_sound2",
	"Plane_sound3"
];

publicVariable _sound;
_sound remoteExec ["playSound"];


sleep 10;

if (_Radio_Call) then {

player sideChat format ["%1, The Supplies have been dropped , OUT.", name player];
playSound3D ["A3\dubbing_f\modules\supports\drop_accomplished.ogg", player];
};

//________________ Type of parachute ________________
//    B_Parachute_02_F
_parachute = createVehicle ["B_Parachute_02_F",_Pos, [], 0, "FLY"];
_parachute setPosATL [getPosATL _parachute select 0, getPosATL _parachute select 1, _height_of_drop];


//	Type_of_Cargo_array - can be anything
//  B_supplyCrate_F        B_G_Mortar_01_F        B_MRAP_01_hmg_F        B_Boat_Transport_01_F    B_Heli_Transport_03_unarmed_F

_Cargo_array =[
            "B_supplyCrate_F",
            "I_CargoNet_01_ammo_F"
            ];

_Create_Cargo = selectRandom _Cargo_array;
        
_Cargo = createVehicle [_Create_Cargo, position _parachute, [], 0, 'NONE'];    
_Cargo attachTo [_parachute,[0,0,0]];
_Cargo enableSimulation false;


//________________ add your items here ________________

//    clear Cargo - leaves medkits in place.
//    add     clearItemCargoGlobal _Cargo;     to remove medkits
clearWeaponCargoGlobal _Cargo;
clearMagazineCargoGlobal _Cargo;


//________________ add Virtual Arsenal to Cargo ________________
if (_Virtual_Arsenal) then {
//    systemchat "_Virtual_Arsenal";
_Cargo addAction ["Open Virtual Arsenal", {["Open",true] spawn BIS_fnc_arsenal}];
};


//________________ Add random loot , you need to select this or the one below ________________
if (_Random_Loot) then {


//Type of loot
_weapons_Loot = selectRandom [
	//LightMachineGuns
	"arifle_MX_SW_Black_F",
	"arifle_MX_SW_F",
	"LMG_Mk200_F",
	"LMG_Zafir_F",
	"LMG_03_F",				
	"MMG_01_hex_F",
	"MMG_01_tan_F",
	"MMG_02_black_F",
	"MMG_02_camo_F",
	"MMG_02_sand_F",
	//Apex
	"LMG_03_F",

	//AssaultRifles
	"arifle_Katiba_C_F",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20_GL_plain_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20C_F",
	"arifle_Mk20C_plain_F",
	"arifle_MX_Black_F",
	"arifle_MX_F",
	"arifle_MX_GL_Black_F",
	"arifle_MX_GL_F",
	"arifle_MXC_Black_F",
	"arifle_MXC_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F",			
	//Apex AssaultRifles
	"arifle_AK12_F",
	"arifle_AK12_GL_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	//AK x2
	"arifle_AK12_F",
	"arifle_AK12_GL_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	//
	"arifle_ARX_blk_F",
	"arifle_ARX_ghex_F",
	"arifle_ARX_hex_F",
	"arifle_CTAR_blk_F",
	"arifle_CTAR_hex_F",
	"arifle_CTAR_ghex_F",
	"arifle_CTAR_GL_blk_F",
	"arifle_CTARS_blk_F",
	"arifle_CTARS_hex_F",
	"arifle_CTARS_ghex_F",
	"arifle_SPAR_01_blk_F",
	"arifle_SPAR_01_khk_F",
	"arifle_SPAR_01_snd_F",
	"arifle_SPAR_01_GL_blk_F",
	"arifle_SPAR_01_GL_khk_F",
	"arifle_SPAR_01_GL_snd_F",
	"arifle_SPAR_02_blk_F",
	"arifle_SPAR_02_khk_F",
	"arifle_SPAR_02_snd_F",			
	"arifle_SPAR_03_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"arifle_MX_khk_F",
	"arifle_MX_GL_khk_F",
	"arifle_MXC_khk_F",
	"arifle_MXM_khk_F",

	//SniperRifles
	"arifle_MXM_Black_F",
	"arifle_MXM_F",
	"srifle_DMR_01_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_02_F",
	"srifle_DMR_02_sniper_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_04_F",
	"srifle_DMR_04_Tan_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_05_hex_F",
	"srifle_DMR_05_tan_f",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_06_olive_F",
	"srifle_EBR_F",
	"srifle_GM6_camo_F",
	"srifle_GM6_F",
	"srifle_LRR_camo_F",
	"srifle_LRR_F",			
	//Apex SniperRifles
	"srifle_LRR_tna_F",
	"srifle_GM6_ghex_F",
	"srifle_DMR_07_blk_F",
	"srifle_DMR_07_hex_F",
	"srifle_DMR_07_ghex_F",
	
	// Launchers
	"launch_NLAW_F",
	"launch_RPG32_F",
	"launch_RPG32_ghex_F",
	"launch_RPG7_F",
	"launch_RPG7_F",	//x2
	"launch_Titan_F",
	"launch_I_Titan_F",
	"launch_O_Titan_ghex_F",
	"launch_O_Titan_F",
	"launch_B_Titan_F",
	"launch_B_Titan_tna_F",
	"launch_Titan_short_F",
	"launch_O_Titan_short_F",
	"launch_O_Titan_short_ghex_F",
	"launch_I_Titan_short_F",
	"launch_B_Titan_short_F",
	"launch_B_Titan_short_tna_F"			
	];
	

_sideweapons_loot = selectRandom [
	//Pistols
	"hgun_ACPC2_F",
	"hgun_P07_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_Pistol_Signal_F",
	"hgun_Rook40_F",
	//Apex
	"hgun_Pistol_01_F",
	"hgun_P07_khk_F",

	//SubMachineGuns
	"hgun_PDW2000_F",
	"SMG_01_F",
	"SMG_02_F",
	"SMG_05_F"		
	];


_items_loot1 = selectRandom [
	//for RyanZombies
	//"RyanZombiesAntiVirusTemporary_Item",
	//"RyanZombiesAntiVirusCure_Item",
	
	//Vanilla			
	"ToolKit",
	"MediKit",
	"FirstAidKit",
	"FirstAidKit", 			
	//Tools
	"Binocular",
	"Rangefinder",			
	"Laserdesignator",
	"Laserdesignator_02",
	"Laserdesignator_03"
	];


_items_loot2 = selectRandom [
	//Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
	"ItemCompass",
	"ItemWatch",
	"ItemRadio",
	"ItemGPS",
	"ItemMap",
	//x2
	"ItemCompass",
	"ItemWatch",
	"ItemRadio",
	"ItemGPS",
	"ItemMap",
	//PointerAttachments
	"acc_flashlight",
	"acc_pointer_IR",
	//BipodAttachments
	"bipod_01_F_blk",
	"bipod_01_F_mtp",
	"bipod_01_F_snd",
	"bipod_02_F_blk",
	"bipod_02_F_hex",
	"bipod_02_F_tan",
	"bipod_03_F_blk",
	"bipod_03_F_oli",
	//Apex
	"bipod_01_F_khk",
	//MuzzleAttachments
	"muzzle_snds_338_black",
	"muzzle_snds_338_green",
	"muzzle_snds_338_sand",
	"muzzle_snds_93mmg",
	"muzzle_snds_93mmg_tan",
	"muzzle_snds_acp",
	"muzzle_snds_B",
	"muzzle_snds_H",
	"muzzle_snds_H_MG",
	"muzzle_snds_H_SW",
	"muzzle_snds_L",
	"muzzle_snds_M",
	//Apex
	"muzzle_snds_H_khk_F",
	"muzzle_snds_H_snd_F",
	"muzzle_snds_58_blk_F",
	"muzzle_snds_m_khk_F",
	"muzzle_snds_m_snd_F",
	"muzzle_snds_B_khk_F",
	"muzzle_snds_B_snd_F",
	"muzzle_snds_58_wdm_F",
	"muzzle_snds_65_TI_blk_F",
	"muzzle_snds_65_TI_hex_F",
	"muzzle_snds_65_TI_ghex_F",
	"muzzle_snds_H_MG_blk_F",
	"muzzle_snds_H_MG_khk_F",
	//OpticAttachments
	"optic_Aco",
	"optic_ACO_grn",
	"optic_ACO_grn_smg",
	"optic_Aco_smg",
	"optic_AMS",
	"optic_AMS_khk",
	"optic_AMS_snd",
	"optic_Arco",
	"optic_DMS",
	"optic_Hamr",
	"optic_Holosight",
	"optic_Holosight_smg",
	"optic_KHS_blk",
	"optic_KHS_hex",
	"optic_KHS_old",
	"optic_KHS_tan",
	"optic_LRPS",
	"optic_MRCO",
	"optic_MRD",
	"optic_Nightstalker",
	"optic_NVS",
	"optic_SOS",
	"optic_tws",
	"optic_tws_mg",
	"optic_Yorris",
	//Apex
	"optic_Arco_blk_F",
	"optic_Arco_ghex_F",
	"optic_DMS_ghex_F",
	"optic_Hamr_khk_F",
	"optic_ERCO_blk_F",
	"optic_ERCO_khk_F",
	"optic_ERCO_snd_F",
	"optic_SOS_khk_F",
	"optic_LRPS_tna_F",
	"optic_LRPS_ghex_F",
	"optic_Holosight_blk_F",
	"optic_Holosight_khk_F",
	"optic_Holosight_smg_blk_F",
	
	//NVG
	"NVGoggles",
	"NVGoggles_INDEP",
	"NVGoggles_OPFOR",
	//Apex
	"O_NVGoggles_hex_F",
	"O_NVGoggles_urb_F",
	"O_NVGoggles_ghex_F",
	"NVGoggles_tna_F"
	];


_items_loot3 = selectRandom [
	//Flares
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_red",
	//Smokes
	"SmokeShell",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellOrange",
	"SmokeShellPurple",
	"SmokeShellRed",
	"SmokeShellYellow",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeBlue_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"1Rnd_SmokeOrange_Grenade_shell",
	"1Rnd_SmokePurple_Grenade_shell",
	"1Rnd_SmokeRed_Grenade_shell",
	"1Rnd_SmokeYellow_Grenade_shell",
	"3Rnd_Smoke_Grenade_shell",
	"3Rnd_SmokeBlue_Grenade_shell",
	"3Rnd_SmokeGreen_Grenade_shell",
	"3Rnd_SmokeOrange_Grenade_shell",
	"3Rnd_SmokePurple_Grenade_shell",
	"3Rnd_SmokeRed_Grenade_shell",
	"3Rnd_SmokeYellow_Grenade_shell",
	//Explosives
	"HandGrenade",
	"MiniGrenade",
	"B_IR_Grenade",
	"O_IR_Grenade",
	"I_IR_Grenade",
	"1Rnd_HE_Grenade_shell",
	"3Rnd_HE_Grenade_shell",
	"APERSBoundingMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"IEDLandBig_Remote_Mag",
	"IEDLandSmall_Remote_Mag",
	"IEDUrbanBig_Remote_Mag",
	"IEDUrbanSmall_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"SLAMDirectionalMine_Wire_Mag"
	];
	

	_Ravage_item = selectRandom [		
	// Ravage_items
	//x1
	"rvg_plasticBottleEmpty",
	"rvg_canteenEmpty",
	"rvg_hose",
	"rvg_sleepingBag_Blue", 
	"rvg_foldedTent",
	"rvg_rustyCan",
	"rvg_Geiger",
	"rvg_canisterFuel_Empty",
	"rvg_toolkit",
	"rvg_tire",
	//x2 Vital			
	"rvg_money", 
	"rvg_notepad", 
	"rvg_docFolder",
	"rvg_canOpener",
	"rvg_guttingKnife", 
	"rvg_matches",
	"rvg_plasticBottle",
	"rvg_plasticBottlePurified", 
	"rvg_spirit", 
	"rvg_franta",
	"rvg_beans", 
	"rvg_bacon", 
	"rvg_milk", 
	"rvg_rice",
	"rvg_antiRad",
	"rvg_purificationTablets",						
	//x2 Vital
	"rvg_money", 
	"rvg_notepad", 
	"rvg_docFolder",
	"rvg_canOpener",
	"rvg_guttingKnife", 
	"rvg_matches",
	"rvg_plasticBottle",
	"rvg_plasticBottlePurified", 
	"rvg_spirit", 
	"rvg_franta",
	"rvg_beans", 
	"rvg_bacon", 
	"rvg_milk", 
	"rvg_rice",
	"rvg_antiRad",
	"rvg_purificationTablets",
	
	//addon Ravage
	"Mask_M40_OD",
	"Mask_M40",
	"Mask_M50"
	];
			
			
			
//addweaponcargo	addItemCargo	addMagazineCargo

//	weapons
_Cargo addweaponcargo [_weapons_Loot, 5];	//	5 is the amount 

//	sideweapons
_Cargo addweaponcargo [_sideweapons_loot, 5];

//	items 1
_Cargo addweaponcargo [_items_loot1, 5];

//	items 2 Here ONLY :items , PointerAttachments , BipodAttachments , MuzzleAttachments , OpticAttachments , NVG
_Cargo addItemCargo [_items_loot2, 5];

//	items 2 Here ONLY :Flares , Smokes , Explosives
_Cargo addMagazineCargo [_items_loot3, 5];

//lootitems6 items 3 Ravage
_Cargo addItemCargo [_Ravage_item, 5];

//	weapon's cargo mags
_magazines_weapon = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_weapon = selectRandom _magazines_weapon; 

_Cargo addMagazineCargoGlobal [_magazineClass_weapon, 10];		//	10 mags


//	sideweapon's cargo mag
_magazines_sideweapon = getArray (configFile / "CfgWeapons" / _sideweapons_loot / "magazines");
_magazineClass_sideweapon = selectRandom _magazines_sideweapon; 

_Cargo addMagazineCargoGlobal [_magazineClass_sideweapon, 10];	//	10 mags


//	Extra type of magazines
_magazines_Extra = getArray (configFile / "CfgWeapons" / _weapons_Loot / "magazines");
_magazineClass_Extra = selectRandom _magazines_Extra; 
_Cargo addMagazineCargoGlobal [_magazineClass_Extra, 10];	//	10 mags	
};


//________________ Selected loot ________________
if (_Custom_loot) then {

//    systemchat "_Custom_loot";


// weapons
{
	_cargo addweaponcargo _x;
}forEach [
			
	//LightMachineGuns
	"arifle_MX_SW_Black_F",
	"arifle_MX_SW_F",
	"LMG_Mk200_F",
	"LMG_Zafir_F",
	"LMG_03_F",				
	"MMG_01_hex_F",
	"MMG_01_tan_F",
	"MMG_02_black_F",
	"MMG_02_camo_F",
	"MMG_02_sand_F",
	//Apex
	"LMG_03_F",

	//AssaultRifles
	"arifle_Katiba_C_F",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20_GL_plain_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20C_F",
	"arifle_Mk20C_plain_F",
	"arifle_MX_Black_F",
	"arifle_MX_F",
	"arifle_MX_GL_Black_F",
	"arifle_MX_GL_F",
	"arifle_MXC_Black_F",
	"arifle_MXC_F",
	"arifle_SDAR_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_TRG21_GL_F",			
	//Apex AssaultRifles
	"arifle_AK12_F",
	"arifle_AK12_GL_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	//AK x2
	"arifle_AK12_F",
	"arifle_AK12_GL_F",
	"arifle_AKM_F",
	"arifle_AKM_FL_F",
	"arifle_AKS_F",
	//
	"arifle_ARX_blk_F",
	"arifle_ARX_ghex_F",
	"arifle_ARX_hex_F",
	"arifle_CTAR_blk_F",
	"arifle_CTAR_hex_F",
	"arifle_CTAR_ghex_F",
	"arifle_CTAR_GL_blk_F",
	"arifle_CTARS_blk_F",
	"arifle_CTARS_hex_F",
	"arifle_CTARS_ghex_F",
	"arifle_SPAR_01_blk_F",
	"arifle_SPAR_01_khk_F",
	"arifle_SPAR_01_snd_F",
	"arifle_SPAR_01_GL_blk_F",
	"arifle_SPAR_01_GL_khk_F",
	"arifle_SPAR_01_GL_snd_F",
	"arifle_SPAR_02_blk_F",
	"arifle_SPAR_02_khk_F",
	"arifle_SPAR_02_snd_F",			
	"arifle_SPAR_03_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"arifle_MX_khk_F",
	"arifle_MX_GL_khk_F",
	"arifle_MXC_khk_F",
	"arifle_MXM_khk_F",

	//SniperRifles
	"arifle_MXM_Black_F",
	"arifle_MXM_F",
	"srifle_DMR_01_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_02_F",
	"srifle_DMR_02_sniper_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_04_F",
	"srifle_DMR_04_Tan_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_05_hex_F",
	"srifle_DMR_05_tan_f",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_06_olive_F",
	"srifle_EBR_F",
	"srifle_GM6_camo_F",
	"srifle_GM6_F",
	"srifle_LRR_camo_F",
	"srifle_LRR_F",			
	//Apex SniperRifles
	"srifle_LRR_tna_F",
	"srifle_GM6_ghex_F",
	"srifle_DMR_07_blk_F",
	"srifle_DMR_07_hex_F",
	"srifle_DMR_07_ghex_F",
	
	// Launchers
	"launch_NLAW_F",
	"launch_RPG32_F",
	"launch_RPG32_ghex_F",
	"launch_RPG7_F",
	"launch_RPG7_F",	//x2
	"launch_Titan_F",
	"launch_I_Titan_F",
	"launch_O_Titan_ghex_F",
	"launch_O_Titan_F",
	"launch_B_Titan_F",
	"launch_B_Titan_tna_F",
	"launch_Titan_short_F",
	"launch_O_Titan_short_F",
	"launch_O_Titan_short_ghex_F",
	"launch_I_Titan_short_F",
	"launch_B_Titan_short_F",
	"launch_B_Titan_short_tna_F"
];


//    Magazine
{
	_cargo addMagazineCargoGlobal _x;
} forEach [
	
	["MiniGrenade", (random 20)],
	["HandGrenade", 10],
	["Laserbatteries", 5],
	["7Rnd_408_Mag", 10],
	["9Rnd_45ACP_Mag", 10],
	["130Rnd_338_Mag", 10],
	["20Rnd_556x45_UW_mag", 10],
	["20Rnd_762x51_Mag", 10],
	["30Rnd_45ACP_Mag_SMG_01", 10],
	["30Rnd_556x45_Stanag", 10],
	["30Rnd_65x39_caseless_green", 10],
	["30Rnd_9x21_Mag", 10],
	["APERSBoundingMine_Range_Mag", 10],
	["APERSMine_Range_Mag", 10],
	["APERSTripMine_Wire_Mag", 10],
	["ATMine_Range_Mag", 10],
	["ClaymoreDirectionalMine_Remote_Mag", 10],
	["DemoCharge_Remote_Mag", 10],
	["SatchelCharge_Remote_Mag", 10],
	["SLAMDirectionalMine_Wire_Mag", 10],
	["SmokeShell", 10],
	["SmokeShellBlue", 10],
	["SmokeShellGreen", 10],
	["SmokeShellOrange", 10],
	["SmokeShellPurple", 10],
	["SmokeShellRed", 10],
	["SmokeShellYellow", 10]
];

// items
{
	_cargo addItemCargoGlobal _x;
} forEach
[
	["FirstAidKit", (10 + (random 10))],
	["Binocular", 5],
	["acc_flashlight", 5],
	["acc_pointer_IR", 5],
	["bipod_03_F_oli", 5],
	["B_UavTerminal", 5],
	["FirstAidKit", 5],
	["ItemCompass", 5],
	["ItemGPS", 5],
	["ItemMap", 5],
	["ItemRadio", 5],
	["ItemWatch", 5],
	["Laserdesignator", 5],
	["Rangefinder", 5],
	["ToolKit", 5],
	["MineDetector", 5],
	["muzzle_snds_338_green", 5],
	["muzzle_snds_93mmg_tan", 5],
	["muzzle_snds_acp", 5],
	["muzzle_snds_B", 5],
	["muzzle_snds_H", 5],
	["muzzle_snds_H_MG", 5],
	["muzzle_snds_H_SW", 5],
	["muzzle_snds_L", 5],
	["muzzle_snds_M", 5],
	["NVGoggles", 5],
	["optic_ACO_grn", 5],
	["optic_ACO_grn_smg", 5],
	["optic_AMS_snd", 5],
	["optic_Arco", 5],
	["optic_DMS", 5],
	["optic_Hamr", 5],
	["optic_Holosight", 5],
	["optic_Holosight_smg", 5],
	["optic_KHS_old", 5],
	["optic_KHS_tan", 5],
	["optic_LRPS", 5],
	["optic_MRCO", 5],
	["optic_MRD", 5],
	["optic_Nightstalker", 5],
	["optic_NVS", 5],
	["optic_SOS", 5],
	["optic_tws", 5],
	["optic_tws_mg", 5],
	["optic_Yorris", 5]
];

};
 
	
//________________ Type of Chemlight and Smoke ________________

_Chemlight_1 = "Chemlight_red" createVehicle (position _Cargo);
_Chemlight_1 attachTo [_Cargo, [0,0.5,-0.4]];
_Chemlight_2 = "Chemlight_red" createVehicle (position _Cargo);
_Chemlight_2 attachTo [_Cargo, [0,-0.5,-0.4]];
_Smoke = "SmokeShellRed" createVehicle (position _Cargo);
_Smoke attachTo [_Cargo, [0,0,0]];


waitUntil {getPos _Cargo select 2 < 4};
_vel = velocity _Cargo;
_Cargo setVelocity _vel;

waitUntil {getPos _Cargo select 2 < 0};
playSound3D ["a3\sounds_f\weapons\Flare_Gun\flaregun_1_shoot.wss",_Cargo];
           
detach _Cargo;
_parachute disableCollisionWith _Cargo;   

_time = time + 6;
waitUntil {time > _time};       
if (!isNull _parachute) then {deleteVehicle _parachute};
_Cargo enableSimulation true;




//________________	Spawn a Group at the Airdrops	________________

if (_Spawn_Enemy) then {

//    systemchat "_Spawn_Enemy";

_Pos_Spawn =  [[[_Pos, 50 + random 250]],["water"]] call BIS_fnc_randomPos;
_Group = createGroup _Enemy_Side;

for "_x" from 0 to (_Squad_Members + floor random _Squad_Members_random) do {

_unit = _Group createunit [selectRandom _Pool_Infantry,_Pos_Spawn,[],0,"None"];
[_unit] JoinSilent _Group;
(leader _Group) setSkill _set_AiSkill + random _set_AiSkill_random;
};
[_Group,_Pos,_Patrol_distance + random _Patrol_distance_random] call BIS_fnc_taskPatrol;
};
        



//________________	_Create_Markers	________________
	
if (_Create_Markers) then {

	_Marker_Number_Pos = format ["%1",_Pos];
	_Marker_Pos = createMarker [_Marker_Number_Pos,_Pos];		
	_Marker_Pos setMarkerShape "ICON"; 
	_Marker_Pos setMarkerType "mil_marker"; 
	_Marker_Pos setMarkerColor "ColorUNKNOWN"; 
	_Marker_Pos setMarkerText format ["Airdrop : %1",_a];	
	_Marker_Pos setMarkerSize [1,1]; 		
};	

}; 


systemchat "C a r g o   A i r d r o p s    S p a w n e d";