/	
dayz_antihack = 0; // DayZ Antihack / 1 = enabled // 0 = disabled
dayz_REsec = 0; // DayZ RE Security / 1 = enabled // 0 = disabled
/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio false;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 1; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500
MaxVehicleLimit = 380; // Default = 50
MaxDynamicDebris = 500;
dayz_MapArea = 14000; // Default = 10000
dayz_maxLocalZombies = 30; // Default = 30 
dayz_paraSpawn = false;
dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_sellDistance_vehicle = 10;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 40;
dayz_maxAnimals = 5; // Default: 8
dayz_fullMoonNights = true;
dayz_tameDogs = true;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 20; // Default: 100
DZE_BuildOnRoads = false; // Default: False
DZE_ConfigTrader = true;
DZE_AsReMix_PLAYER_HUD = true;

DZE_MissionLootTable = true;

DZE_DeathMsgTitleText = true;
DZE_DeathMsgGlobal = true;
DZE_BuildingLimit = 35000;
DZE_StaticConstructionCount = 1; //Fast Building
DZE_R3F_WEIGHT = false; ////Gewichtsystem aus
DZE_requireplot = 0;

//SnapBuilding
DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["VaultStorageLocked"]
DZE_curPitch = 45; //Starting rotation angle. Only 1, 5, 45, or 90.

//Task On Off
NoTalk				 = true;

EpochEvents = [["any","any","any","any",30,"crash_spawner"],["any","any","any","any",0,"crash_spawner"],["any","any","any","any",15,"supply_drop"]];
dayz_fullMoonNights = true;

//Load in compiled functions
call compile preprocessFileLineNumbers "Scripts\Variables\Variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "Scripts\Server_Compile\compiles.sqf";
call compile preprocessFileLineNumbers "porave\logistic\init.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "addons\buildings\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "Scripts\Server_Traders\server_traders.sqf";				//Compile trader configs
call compile preprocessFileLineNumbers "overwrites\fast_trading\player_traderMenuHive.sqf";
call compile preprocessFileLineNumbers "addons\safezones\init.sqf";
call compile preprocessFileLineNumbers "addons\dzap\init.sqf";
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	//anti Hack
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	if (DZE_AsReMix_PLAYER_HUD) then {
	execVM "Scripts\Player_Hud\playerHud.sqf"
    };
};
execVM "Scripts\Gold_Coin_system\init.sqf";
execVM "Scripts\Gold_Coin_system\Bank_Markers\addbankmarkers.sqf";
//execVM "Scripts\Wetter\DynamicWeatherEffects.sqf";
endLoadingScreen;

#include "\z\addons\dayz_code\system\REsec.sqf"

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";


#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

//Welcome Credits
[] execVM "Scripts\WelcomeCredits\Server_WelcomeCredits.sqf";
//NoTalk
[] execVM "Scripts\NoTalk\nosidechat.sqf";
//SafeZonen
[] execVM "Scripts\SafeZonen\safezone.sqf";
//refuel
[] execVM "service_point\service_point.sqf";
//Custom Action Menu
[] execVM "Scripts\actions\activate.sqf";
//Building
//Trader Air
[] execVM "Scripts\custom\Building\ne_airfield.sqf";
//Grosses Air
[] execVM "Scripts\custom\Building\NWSGross.sqf";
//Trader
[] execVM "Scripts\custom\Building\traderstary.sqf";
//Bases
[] execVM "Scripts\custom\Building\StevisBalota.sqf";
//lodout
[] ExecVM "Scripts\startgear\BloodZoggerZ.sqf";
endLoadingScreen;
