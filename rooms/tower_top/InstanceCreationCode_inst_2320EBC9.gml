if get_level_pct("exit") != 100 {
	instance_destroy() 
	exit;
}

if (get_level_rank("entrance") + get_level_rank("medieval") + get_level_rank("ruin") + get_level_rank("dungeon") +
get_level_rank("badland") + get_level_rank("graveyard") + get_level_rank("farm") + get_level_rank("saloon") +
get_level_rank("plage") + get_level_rank("forest") + get_level_rank("space") + get_level_rank("minigolf") +
get_level_rank("street") + get_level_rank("sewer") + get_level_rank("industrial") + get_level_rank("freezer") + 
get_level_rank("chateau") + get_level_rank("kidsparty") + get_level_rank("mansion") + get_level_rank("war")) < (20 * 2) {
	instance_destroy() 
	exit;
}




targetRoom = champ_1
level = "champ"
msg = "Champion's Road"
tex_groups = ["champgroup"]
if get_level_pct("champ") == 100 {
	details = [
	gate_createlayer(spr_gate_champ, 0),
	gate_createlayer(spr_gate_champ_100, 1),
	gate_createlayer(spr_gate_champ_100, 2, -0.8),
	gate_createlayer(spr_gate_champ_100, 3, -0.6),
	gate_createlayer(spr_gate_champ_100, 4, -0.4),
	gate_createlayer(spr_gate_champ_100, 5, -0.2),
	gate_createlayer(spr_gate_champ_100, 6,  0)
	]
	
} else {
	details = [
	gate_createlayer(spr_gate_champ, 0),
	gate_createlayer(spr_gate_champ, 1),
	gate_createlayer(spr_gate_champ, 2, -0.8),
	gate_createlayer(spr_gate_champ, 3, -0.6),
	gate_createlayer(spr_gate_champ, 4, -0.4),
	gate_createlayer(spr_gate_champ, 5, -0.2),
	gate_createlayer(spr_gate_champ, 6,  0.1, 0.1),
	gate_createlayer(spr_gate_champ, 7),
	]
}