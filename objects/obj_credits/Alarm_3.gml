instance_destroy(obj_cutscene_fade)
var save_champ = false
with (obj_player)
{
	backtohubroom = -4
	targetDoor = "A"
	audio_stop_all()
	if !global.seen_champ_cutscene && get_level_pct("exit") == 100 { 
		room = tower_topcutscene
		save_champ = true
	}
	else room = Realtitlescreen
	instance_create(x, y, obj_fakeFade)
	x = -100
	y = -100
	state = states.titlescreen
	image_blend = c_white
}
if save_champ {
	ini_open_from_string(obj_savesystem.ini_str)	
	ini_write_real("Cutscenes", "champ", true)
	obj_savesystem.ini_str = ini_close()
	gamesave_async_save()
	global.seen_champ_cutscene = true
}