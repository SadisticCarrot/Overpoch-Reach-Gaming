//Default Loadout
DefaultMagazines = ["ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","ItemWaterbottleBoiled","FoodSteakCooked","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"];
DefaultWeapons = ["ItemMap","Itemtoolbox","ItemRadio","RH_hk416"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackWeapon = "";

//Admin Loadout
if ((getPlayerUID player) in ["76561198111109100","xxxxxxxxxx"]) then {  //Admins: Nobody, Somebody
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemMorphine","ItemPainkiller","ItemBloodbag","ItemWaterbottleBoiled","ItemWaterbottleBoiled","FoodSteakCooked","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","ItemGoldBar10oz"];
	DefaultWeapons = ["glock17_EP1","RH_hk416","ItemRadio","NVGoggles","ItemMap","ItemCompass","ItemGPS","ItemWatch","ItemKnife","Itemtoolbox","ItemCrowbar","Itemetool","ItemHatchet"];
	DefaultBackpack = "DZ_LargeGunBag_EP1";
	DefaultBackpackWeapon = "";
	};

//Moderator Loadout
if ((getPlayerUID player) in ["xxxxxxxx"]) then {   //Moderators: ThatOtherGuy
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","17Rnd_9x19_glock17","17Rnd_9x19_glock17","ItemMorphine","ItemPainkiller","ItemBloodbag","PartGeneric","ItemWaterbottleBoiled","FoodSteakCooked","8Rnd_B_Saiga12_Pellets","8Rnd_B_Saiga12_Pellets","8Rnd_B_Saiga12_74Slug","ItemGoldBar10oz"];
	DefaultWeapons = ["glock17_EP1","RH_hk416","Binocular_Vector","NVGoggles","ItemMap","Itemtoolbox"];
	DefaultBackpack = "DZ_Backpack_EP1";
	DefaultBackpackWeapon = "";
	};

//Pro-Donator Loadout
if ((getPlayerUID player) in ["xxxxxxx"]) then {  //Pro-Donators: MoneyBags
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemMorphine","ItemPainkiller","ItemBloodbag","PartGeneric","ItemWaterbottleBoiled","FoodSteakCooked","8Rnd_B_Beneli_Pellets","8Rnd_B_Beneli_Pellets","8Rnd_B_Beneli_74Slug","ItemGoldBar10oz"];
	DefaultWeapons = ["M9SD","Remington870_lamp","Binocular","ItemMap","ItemCompass","ItemFlashlightRed","ItemKnife","ItemMatchbox","ItemHatchet"];
	DefaultBackpack = "DZ_GunBag_EP1";
	DefaultBackpackWeapon = "";
	};

//Donator Loadout
if ((getPlayerUID player) in ["xxxxxxxxx"]) then {  //Donators: Nobody
	DefaultMagazines = ["ItemBandage","ItemBandage","ItemBandage","ItemBandage","ItemMorphine","ItemPainkiller","ItemGoldBar","15Rnd_W1866_Slug","15Rnd_W1866_Slug","PartGeneric"];
	DefaultWeapons = ["glock17_EP1","Winchester1866","ItemMap","ItemFlashlightRed","ItemHatchet"];
	DefaultBackpack = "DZ_ALICE_Pack_EP1";
	DefaultBackpackWeapon = "";
	};