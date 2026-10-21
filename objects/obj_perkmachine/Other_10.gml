perk_id.func()
trace(percs[current_perk])
array_push(global.perklist, percs[current_perk])
scr_soundeffect_3d(sfx_buyweapon)
current_perk++
if current_perk < array_length(percs) && !final {
	perk_id = perk[percs[current_perk]]
	var mult = power(current_perk, 2) * 0.1
	perk_id.cost *= (1 + mult)
	perk_id.cost = round(perk_id.cost)
}
else { 
	with obj_perkmachine {
		
		state = states.finishingblow 
		alarm[1] = 180 
		flash = 1
		
	}
}

obj_player1.state = states.firemouth
obj_player1.sprite_index = obj_player1.spr_firemouthend
obj_player1.image_index = 0