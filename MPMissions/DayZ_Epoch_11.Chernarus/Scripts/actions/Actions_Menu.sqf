/*
	If you wish to disable options simply place a // infront of the menu you wish to disable.
	For example to disable the Fun Menu below change this:
	["Fun Menu >>", [], "#USER:FunMenu", -5, [["expression", ""]], "1", "1"],
	
	to this:
	//["Fun Menu >>", [], "#USER:FunMenu", -5, [["expression", ""]], "1", "1"],
	
*/

_pathtoscripts = "Scripts\actions\";
_EXECscript1 = 'player execVM "'+_pathtoscripts+'%1"';
_EXECscript2 = '["%1"] execVM "Scripts\actions\FunMenu\morph.sqf"';
_EXECscript3 = '["%1"] execVM "Scripts\actions\FunMenu\movements.sqf"';


if(isNil "AdminList") then {
/* 
	If you use Nox's Epoch Admin Tools disregard AdminList/ModList code.
	If you do not use that admin tool then replace 111111111 with
	your UID if you want to use the Fun Menu transformation.
*/
	AdminList = [
	"0",
	"0",
	"0",
	"0",
	"0",
	"0"
	];
	ModList = [
	"0",
	"0"
	];
};

if((getPlayerUID player) in AdminList ||(getPlayerUID player) in ModList) then {

	/*
		This menu is for the Admins or Mods listed above OR in the Epoch Admin Tools.
		To make this menu the same as what normal players get put a // in front of the fun menu
		and then remove the // from infront of the movement menu below.
	*/
	
	ActionMenu =
	[
		["",true],
		["Action Menu >>", [], "#USER:ActionsMenu", -5, [["expression", ""]], "1", "1"],
		//["Deploy Menu >>", [], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
		["Fun Menu >>", [], "#USER:FunMenu", -5, [["expression", ""]], "1", "1"],
		["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"],
		["Server Rules", [], "", -5, [["expression", format[_EXECscript1,"server_rules.sqf"]]], "1", "1"],
			["", [], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
	];
} else {

	// This menu is for normal players only. If you have an admin listed, they will use the menu above.

	ActionMenu =
	[
		["",true],
		["Action Menu >>", [], "#USER:ActionsMenu", -5, [["expression", ""]], "1", "1"],
		//["Deploy Menu >>", [], "#USER:VehicleMenu", -5, [["expression", ""]], "1", "1"],
		["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"],
		["Server Rules", [], "", -5, [["expression", format[_EXECscript1,"server_rules.sqf"]]], "1", "1"],
			["", [], "", -5, [["expression", ""]], "1", "0"],
			["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
	];
};

ActionsMenu =
[
	["",true],
	["Self Bloodbag", [], "", -5, [["expression", format[_EXECscript1,"player_selfbloodbag.sqf"]]], "1", "1"],
	["Flip Vehicle", [], "", -5, [["expression", format[_EXECscript1,"flipvehicle.sqf"]]], "1", "1"],
	["Suicide", [], "", -5, [["expression", format[_EXECscript1,"suicide.sqf"]]], "1", "1"],	
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
];

VehicleMenu =
[
	["",true],
	["Build Bike", [], "", -5, [["expression", format[_EXECscript1,"deploy_bike.sqf"]]], "1", "1"],
	["Build Mozzie", [],  "", -5, [["expression", format[_EXECscript1,"deploy_mozzie.sqf"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Exit", [20], "", -5, [["expression", ""]], "1", "1"]		
];

FunMenu =
[
	["",true],
	["Movement Menu >>",[],"#USER:MovementMenu", -5,[["expression",""]],"1","1"],
	["Transform Animal >>",[],"#USER:TransformAnimalMenu", -5,[["expression",""]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];

MovementMenu =
[
	["",true],
	["Dance1",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingDuoIvan"]]],"1","1"],
	["Dance2",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingDuoStefan"]]],"1","1"],
	["Dance3",[],"", -5,[["expression",format[_EXECscript3,"ActsPercMstpSnonWnonDnon_DancingStefan"]]],"1","1"],
	["Boxing",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_idle68boxing"]]],"1","1"],
	["Karate",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exerciseKata"]]],"1","1"],
	["Pushups",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exercisePushup"]]],"1","1"],
	["Squat",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_exercisekneeBendA"]]],"1","1"],
	["HandStand",[],"", -5,[["expression",format[_EXECscript3,"AmovPercMstpSnonWnonDnon_idle70chozeniPoRukou"]]],"1","1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];

TransformAnimalMenu =
[
	["",true],
	["Goat", [], "", -5, [["expression", format[_EXECscript2,"Goat"]]], "1", "1"],
	["Rabbit", [], "", -5, [["expression", format[_EXECscript2,"Rabbit"]]], "1", "1"],
	["Chicken", [], "", -5, [["expression", format[_EXECscript2,"Hen"]]], "1", "1"],
	["Dog 01", [], "", -5, [["expression", format[_EXECscript2,"Pastor"]]], "1", "1"],
	["Dog 02", [], "", -5, [["expression", format[_EXECscript2,"Fin"]]], "1", "1"],
	["Sheep", [], "", -5, [["expression", format[_EXECscript2,"Sheep"]]], "1", "1"],
	["Wild Boar", [], "", -5, [["expression", format[_EXECscript2,"WildBoar"]]], "1", "1"],
	["Cow (Black & White)", [], "", -5, [["expression", format[_EXECscript2,"Cow04"]]], "1", "1"],
	["Zombie", [], "", -5, [["expression", format[_EXECscript2,"PZombie_VB"]]], "1", "1"],
	["Human Survivor", [], "", -5, [["expression", format[_EXECscript2,"Survivor2_DZ"]]], "1", "1"],
		["", [], "", -5, [["expression", ""]], "1", "0"],
		["Main Menu", [20], "#USER:ActionMenu", -5, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:ActionMenu";