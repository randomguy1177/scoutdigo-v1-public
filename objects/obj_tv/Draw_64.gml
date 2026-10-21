if (room == editor_room || room == rm_baby || !global.showhud || obj_player1.state == states.bossdefeat)
	exit;
if obj_player1.super_mario exit;	
draw_set_font(global.bigfont)
draw_set_halign(fa_left)
draw_text((15 + random_range(-1, 1)), (500 + txt_y), txt_array[global.attackstyle])	
draw_set_halign(fa_right)
draw_text((945 + random_range(-1, 1)), (500 + txt_y2), txt_array2[global.sidemove])	
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_color(c_white)
if instance_exists(obj_wartimer) || global.panic || instance_exists(obj_arenamode_controller)
	var promptY = 425
else
	var promptY = 500

draw_set_alpha(promptalpha)
draw_text_scribble(480, promptY, "[fa_middle][shake]" + controlprompt)
draw_set_alpha(1)


if is_bossroom() || (is_hub() && !global.panic)
	exit;



var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var tv_x = 845
var tv_y = 80
if global.sugary tv_y += Wave(2, -2, 3, 0);
var _cx = (tv_x - 190 + combo_posX)
var _cy = (((tv_y - 15) + hud_posY) + combo_posY)
var _perc = (global.combotime / 60)
var _minX = (_cx - 56)
var _maxX = (_cx + 59)
combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
combofill_y = _cy
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _tx = (_cx - 64)
var _ty = (_cy + 10)
var _str = string(global.combo)
var num = string_length(_str)
for (var i = num; i > 0; i--)
{
	var char = string_char_at(_str, i)
	draw_text(_tx, _ty, char)
	_tx -= 22
	_ty -= 8
}
if (room != strongcold_endscreen)
{
	if !global.sugary draw_sprite_ext(spr_tv_bg, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	if global.sugary && sprite_index != tv_turnon draw_sprite_ext(draw_static ? spr_pizzy_tvpropeller_static : spr_pizzy_tvpropeller, prop_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	shader_set(global.Pal_Shader)
	player_palette()
	
	draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	
	shader_reset()
	if sprite_index != tv_turnon draw_sprite_ext(global.sugary ? spr_pizzy_tv_frame : spr_tv_frame, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	if draw_static {
		static_index += 0.3
		draw_sprite_ext(global.sugary ? spr_pizzy_tvstatic : spr_tv_newstatic, static_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
	}
	// global.cheat_disable draw_sprite(spr_nosave, -1, tv_x + 20, tv_y + 50)
}
if (bubblespr != -4)
	draw_sprite_ext(bubblespr, bubbleindex, 512, 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
	promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (bubblespr == spr_tv_bubble)
{
	promptx -= promptspd
	if (bubblespr != 433 && promptx < (350 - string_width(prompt)))
	{
		bubblespr = spr_tv_bubbleclose
		bubbleindex = 0
	}
	draw_text_color((promptx - 350), 50, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, 350, 0)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
if instance_exists(obj_pizzaball)
	draw_text(832, 300, ((string(global.golfhit) + " ") + "GOLF HIT"))
var _ttx = timer_x
var _tty = timer_y
if global.option_funnyhud {
	_ttx += 33
	_tty -= 100	
}
	
if global.panic && !global.death_mode
{
	var _fill = targetfill
	var _currentbarpos = (chunkmax - _fill)
	_perc = (_currentbarpos / chunkmax)
	var _max_x = 299
	var _barpos = (_max_x * _perc)
	if (!surface_exists(bar_surface))
		bar_surface = surface_create(298, 30)
	real_barpos = lerp(real_barpos, _barpos, 0.015)
	var _barfillpos = (floor(_barpos) + 13)
	if (_barfillpos > 0)
	{
		surface_resize(bar_surface, _barfillpos, 30)
		surface_set_target(bar_surface)
		draw_clear_alpha(c_black, 0)
		var clip_x = (_ttx + 3)
		var clip_y = (_tty + 5)
		for (i = 0; i < 3; i++)
			draw_sprite(spr_timer_barfill, 0, (barfill_x + (i * 173)), 0)
		surface_reset_target()
		draw_surface(bar_surface, clip_x, clip_y)
	}
	draw_sprite(spr_timer_bar, -1, _ttx, _tty)
	draw_sprite(johnface_sprite, johnface_index, ((_ttx + 13) + _barpos), (_tty + 20))
	draw_sprite(pizzaface_sprite, pizzaface_index, (_ttx + 320), (_tty + 10))
	
	var timeinsecs = floor(targetfill / (60))
	var mins = floor(timeinsecs / 60)
	var secs = timeinsecs % 60
	if secs < 10
		secs = concat("0", secs)
	draw_set_font(global.bigfont)
	draw_set_halign(fa_center)
	draw_text(_ttx + 160, _tty - 20 - (global.option_funnyhud ? 70 : 0), concat(mins, ":", secs))
	
	
	if global.option_funnyhud {
        draw_sprite(hand_sprite, hand_index, (_ttx - 120), (_tty + 120))
		draw_sprite(spr_pizzascoretimer, 0, _ttx + 160, _tty + 10)
		draw_sprite(spr_wartimer, 0, _ttx + 160, timer_y + 76)
		var s = concat(mins, ":", secs)
		if mins < 10
			mins = concat("0", mins)
		draw_set_font(timerfont)
		draw_text(_ttx + 160 - 5, _tty - 22, concat(mins, ":", secs))
		
		var y2 = (timer_y + 22)
		draw_set_font(global.wartimerfont1)
		for (var i = 0; i < string_length(mins); i++)
			draw_text((_ttx - 68 + 177 + (i * 43)), y2, string_char_at(mins, (i + 1)))
		//x2 = (480 + 48)
		for (i = 0; i < string_length(secs); i++)
			draw_text((_ttx + 225 + (i * 43)), y2, string_char_at(secs, (i + 1)))
		
	}
	


}


if (global.combo != 0 && global.option_funnyhud && sprite_index != spr_tv_open && sprite_index != spr_tv_off)
{
    draw_sprite_ext(spr_tv_combo, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 1, c_white, alpha)
    var str = string(global.combo)
    if (global.combo < 10)
        str = concat("0", str)
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_font(global.combofont)
    var num = string_length(str)
    var w = (string_width(str) / num)
    var xx = 0
    var yy = 0
    for (var i = 0; i < num; i++)
    {
        var char = string_char_at(str, (i + 1))
        xx = (i * w)
        yy = (i * 5)
        draw_text((tv_x - 44 + xx), ((tv_y - yy) + hud_posY), char)
    }
}
// Handle CHEATNG!  
if (global.hardmode || global.cheat_infammo || global.option_doubleenem || obj_pause.queue_cheating || global.cheat_pizzagooch) && !is_hub() && !global.cheat_disable {
	global.cheat_disable = true
	if obj_pause.queue_cheating obj_pause.queue_cheating = false	
}


for (var p = 0; p < array_length(global.perklist); p++) {
	_yy = 420 + (p > 4 ? 30 : 0)
	draw_sprite(spr_perkicons, global.perklist[p], 10 + ((p % 5) * 30), _yy)	
}

