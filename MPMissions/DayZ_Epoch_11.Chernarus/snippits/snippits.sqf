private["_b"]; 
{ 
    _b = (configFile >> "CfgMagazines" >> _x >> "ItemActions" >> "Build" >> "create"); 
    if(!(isNull cursorTarget) && {getText(_b) == (typeOf cursorTarget)}) then { 
        player addMagazine _x;
    };
} forEach (
    (configfile >> "CfgMagazines") call { 
        private ["_a"]; 
        _a = []; 
        for "_i" from 0 to ((count _this) - 1) do { 
            if (isClass (_this select _i)) then { 
                _a set [count _a, configName (_this select _i)]; 
            }; 
        };
        _a 
    }
);

DZEF_fnc_rocketMan = {
    [] spawn {
        private["_dis","_sfx","_st"];
        cutText["Do you like the Elton John song ""Rocket Man""?","PLAIN"];
        sleep 2;
        cutText["Oh, oh you don't, ok. Well, I only bring it up because it's you. You're the rocket man!","PLAIN"];
        sleep 2;
        _dis=200;
        _sfx = "panic";
        [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
        [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
        sleep 2;
        _dis=150;
        _sfx = "scream";
        [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
        [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
        player setVelocity [0,0,200];
        for "_i" from 0 to 6 do {
            sleep 3;
            _dis=150;
            _sfx = (["scream","panic"] call BIS_fnc_selectRandom);
            [player,_sfx,0,false,_dis] call dayz_zombieSpeak;
            [player,_dis,true,(getPosATL player)] spawn player_alertZombies;
        };
    };
};

DZEF_fnc_airRaid = {
    [] spawn {
        private["_veh","_pos","_var"];
        _pos = (position player);
        cutText["An air raid is incoming! Take Shelter","PLAIN"];
        sleep 10;
        cutText["Air Raid Imminent!!!","PLAIN"];
        _var = 500;
        _num = 15 + (random 15);
        for "_i" from 0 to _num do {
            _hgh = 300 + (random 10);
            _veh = "Bo_GBU12_LGB" createvehicle [(_pos select 0) + (random _var) - _var,(_pos select 1) + (random _var) - _var, _hgh];
            _veh setVariable["ObjectID","1",true];
            _veh setVariable["ObjectUID","1",true];
            player reveal _veh;
            sleep (random 1);
        }
    };
};