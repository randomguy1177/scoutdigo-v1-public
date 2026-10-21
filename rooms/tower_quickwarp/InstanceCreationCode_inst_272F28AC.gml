sprite_index = choose(spr_gerome_idle1, spr_gerome_idle2, spr_gerome_idle3)
image_speed = 0.35

switch (sprite_index) {
	
	case spr_gerome_idle1:
	dialog = [
	create_dialogue("Hey, don't ya' be hollarin' out to the big man bout' this y'hear?"),
	create_dialogue("These tunnels are how I get around since th' damn elevator broke."),
	create_dialogue("Best be keepin' quiet, don't want to become a hotspot."),
	]
	break;
	
	case spr_gerome_idle2:
	dialog = [
	create_dialogue("* Smack * , Workin' for a super villain ain't above me"),
	create_dialogue("but I swear to the lord if he dares lay a piece of his dressing on my mamere,"),
	create_dialogue("I'd tear down this damn place like a rougarou. "),
	]
	break;
	
	case spr_gerome_idle3:
	dialog = [
	create_dialogue("Zzzzz..."),
	create_dialogue("Snore ..."),
	create_dialogue("Mmmph, hoppin' johns.."),
	]
	break;
	
	
	
	
}