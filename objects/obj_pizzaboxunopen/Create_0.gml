image_speed = 0.35
seen = 0
draw_help = 0
do_help = chance(2)
if quick_ini_read_real("BabyPeppino", "event6", 0) == 1 do_help = chance(50)
content = obj_pizzakinshroom
if (obj_player.character == "S")
	instance_destroy()
depth = 5
//alarm[0] = 300