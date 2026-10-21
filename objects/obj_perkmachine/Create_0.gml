enum perks {
	speed_spaghetti,
	parry_pasta,
	blaze_bruschetta,
	flying_fettuccine,
	point_power,
	slammer_sanguine,
	flighty_formaggio,
	power_pepperoni,
	
	
	
	pizza_pepper,
	master_class,
	health_station,
	buyable_shotty,
	
	
	
}
scr_collision_init()
grav = 0.5

final_perk = perks.pizza_pepper

perk_id = 0
state = states.normal
perk[perks.speed_spaghetti] = {
cost : 12000,
desc : "Increased Mach-3 capabilities",
name : "Speedy Spaghetti",
func : function() { global.arena_perks.staminup = 1 },
}
perk[perks.health_station] = {
cost : 5000,
desc : "Heals you 1 Health",
name : "Health Station",
func : function() { 
	
	with obj_arenamode_controller {
		if player_hp < player_hp_max {
			player_hp++ 
			create_collect(obj_player1.x, obj_player1.y, spr_bosshealth)
		}
		
	}
	
},
}
perk[perks.buyable_shotty] = {
cost : 5000,
desc : "Gain temporary Shotgun",
name : "Pizzamart Branded Shotgun",
func : function() { 
	
	with obj_player1 {
		shotgunAnim = 1
		lose_shotty_on_hit = true
		image_index = 0
		sprite_index = spr_shotgunpullout
		scr_soundeffect(sfx_shotgungot)
		instance_destroy(other)
		shotgunAnim = 1
		state = states.shotgun
		var myKey1 = get_control_string(global.key_shoot)
		scr_controlprompt("[spr_buttonfont]" + myKey1 + "[spr_promptfont] Shoot")
		tv_push_prompt_once(tv_create_prompt("This is the shotgun powerup text", tvprompt.transfo, spr_tv_shotgun, 3), "shotgun")
		global.heattime = 60
		
	}
	
},
}
perk[perks.slammer_sanguine] = {
cost : 8000,
desc : "Groundpound kills nearby enemies and stuns for longer",
name : "Slammer Sanguine",
func : function() { global.arena_perks.slam = 1 },
}
perk[perks.point_power] = {
cost : 9000,
desc : "Higher score increases max speed",
name : "Point Pepperoni",
func : function() { global.arena_perks.money = 1 },
}
perk[perks.parry_pasta] = {
cost : 8000,
desc : "Auto parry once per round, 25% chance after",
name : "Parry Pasta",
func : function() { global.arena_perks.autoparry = 1 },
}
perk[perks.blaze_bruschetta] = {
cost : 12000,
desc : "Mach leaves fire trail that damages enemies",
name : "Blaze Bruschetta",
func : function() { global.arena_perks.blaze = 1 },
}
slam = 0
perk[perks.flying_fettuccine] = {
cost : 12000,
desc : "Killing enemies sends them flying into others",
name : "Flying Fettuccine",
func : function() { global.arena_perks.impact = 1 },
}
perk[perks.power_pepperoni] = {
cost : 8000,
desc : "Increases total arena time, and regenerate HP every 3 rounds",
name : "Survivalist Spuntino",
func : function() { global.arena_perks.time = 1 obj_arenamode_controller.player_hp_max = 8 },
}
perk[perks.flighty_formaggio] = {
cost : 4000,
desc : "Increases jump height, can superjump at any time",
name : "Flighty Formaggio",
func : function() { global.arena_perks.flight = 1 },
}
perk[perks.pizza_pepper] = {
cost : 500000,
desc : "I've got places to be, and it's not here.",
name : "Pizza Pepper",
func : function() { global.arena_perks.pepper = 1 },
}
perk[perks.master_class] = {
cost : 500000,
desc : "You will have to train another 100 years to best me.",
name : "Master Chef",
func : function() { global.arena_perks.final = 2 scr_controlprompt("You moveset has been improved!") },
}
current_perk = 0
percs = []
removal_amt = 100

// Add all Perks
var _list = ds_list_create()
repeat(perks.power_pepperoni + 1) {
	var _rand_perk = irandom(perks.power_pepperoni)
	var _r = 0
	while ds_list_find_index(_list, _rand_perk) != -1 {
		_rand_perk = irandom(perks.power_pepperoni)
		_r++
		if _r >= 30 break;
	}
	ds_list_add(_list, _rand_perk)	
}
var _size = ds_list_size(_list)
for (var i = 0; i < _size; i++) {
	var cur_list_perk = ds_list_find_value(_list, i)
	array_push(percs, cur_list_perk)
}
ds_list_destroy(_list)

/*
array_push(percs, irandom(perks.power_pepperoni))
var a = 0
while (a == percs[0]) a = irandom(perks.power_pepperoni)
array_push(percs, a)
while (a == percs[0] || a == percs[1]) a = irandom(perks.power_pepperoni)
array_push(percs, a)
*/
trace(percs)
perk_id = perk[percs[current_perk]]
final = 0
flash = 0
show_text = false

if object_index == obj_healthstation perk_id = perk[perks.health_station]
if object_index == obj_gunstation perk_id = perk[perks.buyable_shotty]