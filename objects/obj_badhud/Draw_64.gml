var cam = new camera_get_position_struct(view_camera[0])
if drawing {
var i = 0

#region OLD TV
var alpha = 1
var px = obj_player1.x - cam.cam_x
var py = obj_player1.y - cam.cam_y

draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
var tv_x = 732 
var tv_y = 220 
draw_sprite(spr_stylepizzabox, box_index, tv_x + 1, tv_y + 65)
draw_sprite_ext(tvsprite, -1, tv_x, tv_y, 1, 1, 1, c_white, alpha)
draw_text(xi, yi, message)
if ((global.combo != 0) && ((global.combotime != 0) && ((tvsprite == spr_tvdefault) || (tvsprite == spr_tvcombo))))
    draw_text(tv_x + 20, tv_y + 1, global.combo)
if ((tvsprite == spr_tvdefault) && ((room != strongcold_endscreen) && (global.miniboss == 0)))
	draw_text(tv_x, tv_y - 14, global.collect)
	
draw_sprite(spr_stylepizzadown, global.stylethreshold, tv_x + 1, tv_y + 65)	
var cutoff2 = (global.style / 55) * 51
draw_sprite_part(spr_stylepizza, global.stylethreshold, 0, 0, 164, cutoff2, tv_x - 81, tv_y + 40)

#endregion

#region OLD CAMERA
	var pep_head_x = 125 
	var pep_head_y = 200 
	draw_sprite_ext(spr_pizzahealthbar, global.hp, pep_head_x - 50, pep_head_y + 50, 1, 1, 0, c_white, alpha)
    draw_sprite_ext(pepheadspr, pepheadindex, pep_head_x, pep_head_y, 1, 1, 0, c_white, alpha)
	draw_sprite_ext(obj_stylebar.sprite, obj_stylebar.index, pep_head_x + 100, pep_head_y - 25, 1, 1, 0, c_white, alpha)
	draw_sprite_ext(obj_stylebar.shit, obj_stylebar.index, pep_head_x + 100, pep_head_y + 75, 1, 1, 0, c_white, alpha)
	draw_sprite_ext(speedbarspr, speedbarindex, pep_head_x, pep_head_y + 100, 1, 1, 0, c_white, alpha)
	
	var pep_head_x = 125 
	var pep_head_y = 410 
	draw_sprite_ext(spr_pizzahealthbar, global.hp, pep_head_x - 50, pep_head_y + 50, 1, 1, 0, c_white, alpha)
    draw_sprite_ext(noisespr, noiseindex, pep_head_x, pep_head_y, 1, 1, 0, c_white, alpha)
	draw_sprite_ext(obj_stylebar.sprite, obj_stylebar.index, pep_head_x + 100, pep_head_y - 25, 1, 1, 0, c_white, alpha)
	draw_sprite_ext(obj_stylebar.shit, obj_stylebar.index, pep_head_x + 100, pep_head_y + 75, 1, 1, 0, c_white, alpha)
	draw_sprite_ext(speedbarspr, speedbarindex, pep_head_x, pep_head_y + 100, 1, 1, 0, c_white, alpha)

#endregion

#region Heatmeters
	var heat_x = 480 
	var heat_y = 130 
	draw_sprite(spr_heatmeter1, global.stylethreshold, heat_x, heat_y)
	var cutoff = ((global.style / 55) * 123) + 23
	draw_sprite_part(spr_heatmeterBar, global.stylethreshold, 0, 0, cutoff, 200, heat_x - 82, heat_y - 100) 
	
	var _width = sprite_get_width(spr_temperature_meterfill)
	var _height = sprite_get_height(spr_temperature_meterfill)
	//global.temperature = clamp(global.temperature, 0, (global.temp_thresholdnumber * 100))
	var _tmp = global.stylemultiplier
	var _top = 0 
	var _height2 = (_height * _tmp)
	draw_sprite_part_ext(spr_temperature_meterfill, 0, 0, _top, _width, _height2, 864, (192 + _height), 1, -1, c_white, 1)
	draw_sprite(spr_temperature_meter, 0, 864, 192)
	cutoff = (global.stylemultiplier * 251) + 47
	heat_y = 40
	draw_sprite_part(spr_stylebar1, 0, 0, 0, cutoff, 106, heat_x - 172, heat_y - 53)
	draw_sprite_ext(spr_stylebar1, 1, heat_x, heat_y, 1, 1, 0, c_white, alpha)
	var index = floor(global.stylemultiplier * 5)
	index = clamp(index, 0, 4)
	draw_sprite_ext(spr_styles, index, heat_x, heat_y, 1, 1, 0, c_white, alpha)
	heat_x = 830 
	heat_y = 360
	cutoff = 45 + (global.stylemultiplier * 250)
	draw_sprite_part_ext(spr_stylebar2, 0, 0, 0, 105, cutoff, heat_x - 52, heat_y + 170, 1, -1, c_white, alpha)
	draw_sprite_ext(spr_stylebar2, 1, heat_x, heat_y, 1, 1, 0, c_white, alpha)
	
	
#endregion

//draw_sprite_ext(spr_funnyhud_logo, 0, 480 + random_range(-50, 50), 240 + random_range(-50, 50), 1 + cos(current_time / 400), 1 + cos(current_time / 400), cos(current_time / 400) * 360, c_white, 1)


}