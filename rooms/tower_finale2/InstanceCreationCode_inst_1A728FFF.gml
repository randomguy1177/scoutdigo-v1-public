
closedspr = spr_towerdoor1closed
visitedspr = spr_towerdoor1
normalspr = visitedspr
targetRoom = tower_prop

if (get_level_rank("entrance") + get_level_rank("medieval") + get_level_rank("ruin") + get_level_rank("dungeon") +
get_level_rank("badland") + get_level_rank("graveyard") + get_level_rank("farm") + get_level_rank("saloon") +
get_level_rank("plage") + get_level_rank("forest") + get_level_rank("space") + get_level_rank("minigolf") +
get_level_rank("street") + get_level_rank("sewer") + get_level_rank("industrial") + get_level_rank("freezer") + 
get_level_rank("chateau") + get_level_rank("kidsparty") + get_level_rank("mansion") + get_level_rank("war")) < (20 * 2) {
	locked = true
	sprite_index = closedspr
}

