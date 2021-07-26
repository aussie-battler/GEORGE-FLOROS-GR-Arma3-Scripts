Enemy Occupation System
EOS & BASTION
V1.98
Created by BangaBob

What is EOS?
Enemy Occupation System (EOS) enables mission designers to easily populate their scenarios with units. Simple place markers covering areas of the map and EOS will do the rest.
    • Spawn defensive Infantry, divers, boats, vehicles, helicopters and static weapons
    • Save server resources
    • Reliably cache units
        a) Units spawn when player is near
        b) Units killed in earlier engagement will not spawn again
        c) Units are deleted when player is not near

    • Advanced features
        a) Set unit skills
        b) Damage amplifier/nullify
        c) Kill counter
        d) Add more modded units into EOS
        e) Hide/show EOS markers in mission
        f) Probability of units showing
EOS & BASTION requirements
    • ArmA 3
No mods or addons needed to use EOS







Installing EOS
    1. Download latest version of EOS Click here
    2. Extract to desktop
    3. Copy EOS.altis into ArmA 3 mission directory
‘Documents\ArmA 3 – Other profiles\USERNAME\missions’
    4. Load ArmA 3 editor. Open EOS mission
    5. Open EOS.altis. Double click EOS. Double click OpenMe.sqf. This is where you will launch EOS zones.


Getting Started
                            1. Place a Gamelogic named SERVER 
Inside the editor double click and create a player. Click OK. Double click anywhere on the map. Click ‘BLUFOR’ and select ‘Game Logic’ from the dropdown menu. Type SERVER into the name and click ok.

                            2. Place a marker (Rectangle or Ellipse) over the area where you want to spawn units. Name it EOSzone1.

                            3. Open the OpenMe.sqf located inside the ‘eos’ folder. Missions\Missionname\eos\OpenMe.sqf


                            4. Scroll to the bottom. Copy and paste this code into the OpenMe.sqf
null =[[" EOSzone1"],[2,1],[2,2],[1,3],[1],[2],[1,2],[1,0,35,WEST,FALSE,FALSE]] call EOS_Spawn;

                            5. Save openme.sqf

                            6. Preview the mission






Getting to know EOS


Each call should contain multiple marker names. Each marker will become a full EOS zone.
What is an EOS zone?
After a marker becomes an EOS zone, units will spawn when the player is within the spawn distance and units will be deleted when the player is outside the spawn distance. 
By default an EOS zone will; appear red on the map, glow a bright red when you get within the spawn distance and turn green if the zone is cleared.

GROUP SIZES KEY
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20



NOTE: FOR 100% PROBABILITY OF UNITS SPAWNING SET 3rd PARAMETER TO 100 OR LEAVE EMPTY.
House Patrol groups spawn in buildings within the marker. After spawning each group will remain inside buildings. 
To spawn 1 house patrol  groups - [1,2] 
Spawn 3 house patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Patrolling Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. 
To spawn 1 group of infantry  - [1,2] 
Spawn 3 patrol groups with 50% probability of spawning - [3,2,50] 
To spawn a group with between 2 and 4 units - [1,1]
Spawn three groups with between 16 and 20 units and a 70% probability of spawning - [3,5,70]

Motorised Infantry spawn anywhere within the marker. After spawning each group will be given waypoints and patrol the marker. Motorised infantry are light vehicles and carry units in the free seats.
To spawn 1 motorised infantry  - [1,2] 
Spawn 3 motorised infantry  with 50% probability of spawning - [3,2,50] 
Cargo with between 2 and 4 units - [1,1]
Cargo with between 16 and 20 units - [3,5]

Armoured Vehicles spawn within the marker. Similar to Motised infantry except they do not carry cargo. 
Spawn 3 armoured vehicles with 50% probability of spawning - [3,50] 
Spawn 3 armoured vehicles with 100% probability of spawning - [3] 
Helicopters spawn outside the marker and fly towards the zone. If the helicopter cargo is 0 then an attack helicopter will spawn. If the helicopter cargo is above 0 then a transport helicopter will carry units into the marker and land.
Spawn 1 transport helicopter with cargo and 75% probability of spawning - [1,3,75] 
Spawn 1 Attack helicopter and 15% probability of spawning - [1,0,15] 


Faction classes
null = [["EOSinf_1","EOSinf_2"],[2,1],[0,0],[0,0],[0],[0],[0,0],[0,0,250,EAST,TRUE,FALSE]] call EOS_Spawn;
0 = EAST CSAT FACTION
1 = WEST NATO FACTION
2 = INDEPENDENT AAF FACTION
3 = CIVILIAN
4 = WEST FIA FACTION
5,6,7 = Custom classes. Add mods factions ect

Marker setup
null = [["EOSinf_1","EOSinf_2"],[2,1],[0,0],[0,0],[0],[0],[0,0],[0,0,250,EAST,TRUE,FALSE]] call EOS_Spawn;
0 = Default. Markers will show as red and glow red when active and turn green after cleared
1 = Markers will be invisible 
2 = Markers will show as red and turn green after cleared






Spawn Distance
null = [["EOSinf_1","EOSinf_2"],[2,1],[0,0],[0,0],[0],[0],[0,0],[0,0,250,EAST,TRUE,FALSE]] call EOS_Spawn;
When a player is within 250m of the marker all the units will spawn. If the player leaves the 250m radius then the units will be deleted.












Additional functions (Advanced users)
Delete EOS zone
Manually deactivating a zone will delete all the units active the in the area and units will no longer spawn in the future. The marker will turn invisible but still exist in the mission. 
Place the following code in a trigger or script to manually deactivate a zone.
[["BAS_zone_1","EOSinf_1","EOSinf_2","EOSmot_1","EOSmot_2"]] call EOS_deactivate;
NOTE: This function is for advanced users only. 

EOS kill counter
EOS kill counter will count the number of EOS units killed. By default the killcounter will simply display a hint showing the amount of units killed every time a unit is killed. You can customise the kill counter with your own code by editing eos\functions\EOS_KillCounter.sqf
To enable the kill counter open openMe.sqf . Find EOS_KILLCOUNTER=false and replace with EOS_KILLCOUNTER=true

Damage Amplifier
The damage amplifier will make units spawned by EOS easier (or harder) to kill. 
To change the damage amplier open openMe.sqf. Find EOS_DAMAGE_MULTIPLIER=1.
By default the damage amp is set to 1. To make units easier to kill increase the number to 2 (This will make units take 2x damage. Alternative set to a decimal to make units harder to kill. For example 0.5 (This will make units take only 50% of the damage).

AI skill
You can customise the skill levels of each type of unit spawned. 
To change the skill pre-sets open eos\AI_Skill.sqf 
Inside you will find details explaining each skill such as accuracy, spot distance, courage, endurance and aiming speed. 



Adding mods
To use units from mods open eos\unitpools.sqf. Browse to line 67. Add unit classnames of into the arrays relevant arrays. Factions 5,6,7 are reserved for custom factions.
_InfPool = Infantry classnames
_ArmPool = Armoured vehicle classnames
_MotPool = Light vehicle classnames
_ACHPool = Attack helicopter classnames
_CHPool = Transport helicopter classnames
_stPool = Static weapon classnames
_shipPool = Boat classnames
_diverPool = Diver classnames
_crewPool = Vehicle crew classnames
_heliCrew = Helicopter crew classnames




Height limit
A height limit will prevent flying units from activating EOS zones. To use this feature (Boolean).
null = [["EOSinf_1","EOSinf_2"],[2,1],[0,0],[0,0],[0],[0],[0,0],[0,0,250,EAST,TRUE,FALSE]] call EOS_Spawn;

Debug mode
Debug mode will show EOS units on the map and show information about EOS. (Boolean).
null = [["EOSinf_1","EOSinf_2"],[2,1],[0,0],[0,0],[0],[0],[0,0],[0,0,250,EAST,false,TRUE]] call EOS_Spawn;
