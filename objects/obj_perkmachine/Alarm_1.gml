instance_destroy()
if !final {
	with instance_create(x - 100, y, obj_perkmachine) {
		perk_id = perk[perks.pizza_pepper]
		percs = [perks.pizza_pepper]
		final = 1
		flash = true
		sprite_index = spr_perkmachine_pepper
	}
	with instance_create(x + 100, y, obj_perkmachine) {
		perk_id = perk[perks.master_class]
		percs = [perks.master_class]
		final = 1
		flash = true
		sprite_index = spr_perkmachine_chef
	
	}
}