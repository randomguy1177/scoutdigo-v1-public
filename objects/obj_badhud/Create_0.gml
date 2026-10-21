image_speed = 0.1
var a = object_index
if (instance_number(a) > 1) {
	var _first = instance_find(a, 0);
	if (id != _first) {
		instance_destroy(); 
		exit; 
	}
}
chose = 0
message = ""
showtext = 0
tvsprite = spr_tvdefault
noisesprite = spr_noiseHUD_idle
xi = 500
yi = 600
pepheadindex = 0
pepheadspr = spr_pepinoHUD
noiseindex = 0
noisespr = spr_pepinoHUD
speedbarspr = spr_speedbar
speedbarindex = 0
box_index = 0
imageindexstore = 0
once = 0
alpha = 1
shownranka = 0
shownrankb = 0
shownrankc = 0

character = "PEPPINO"
