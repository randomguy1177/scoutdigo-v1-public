var mvsp = abs(obj_player1.hsp)
var _state = obj_player1.state
if _state = states.climbwall
	mvsp = obj_player1.wallspeed
	
visible = obj_tv.visible
drawing = global.option_funnyhud
	
#region Old Tv
if (showtext == 1)
{
    xi = (500 + random_range(1, -1))
    if (yi > 500)
        yi -= 5
}
if (showtext == 0)
{
    xi = (500 + random_range(1, -1))
    if (yi < 600)
        yi += 1
}
box_index += (0 + (0.25 * global.stylethreshold))
if anim_end(sprite_get_number(spr_stylepizzabox), box_index)
	box_index = frac(box_index)

if instance_exists(obj_itspizzatime)
{
    image_speed = 0.25
    message = "GET TO THE EXIT!!"
    alarm[0] = 200
    showtext = 1
    tvsprite = spr_tvexit
}
else if (global.collect > global.arank && shownranka == 0 && obj_player.character == "P")
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK A"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvranka
    shownranka = 1
}
else if (global.collect > global.brank && shownrankb == 0 && obj_player.character == "P")
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK B"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvrankb
    shownrankb = 1
}
else if (global.collect > global.crank && shownrankc == 0 && obj_player.character == "P")
{
    image_speed = 0
    message = "YOU GOT ENOUGH FOR RANK C"
    showtext = 1
    alarm[0] = 200
    tvsprite = spr_tvrankc
    shownrankc = 1
}
else if (obj_player.sprite_index == spr_player_levelcomplete)
{
    image_speed = 0.1
    alarm[0] = 50
    chose = 1
    tvsprite = spr_tvclap
    once = 1
}
else if (obj_player.state == states.hurt)
{
    image_speed = 0.1
    showtext = 1
    if (chose == 0)
        message = choose("OW!", "OUCH!", "OH!", "WOH!")
    alarm[0] = 50
    chose = 1
    tvsprite = spr_tvhurt
    once = 1
}
else if (global.miniboss == 1)
{
    alarm[0] = 50
    image_speed = 0.1
    tvsprite = spr_tvnoise
}
else if (global.hurtcounter >= global.hurtmilestone && obj_player.character == "P")
{
    alarm[0] = 150
    image_speed = 0.1
    if (obj_player.character == "P")
        character = "PEPPINO"
    else
        character = "THE NOISE"
    message = (((("YOU HAVE HURT " + string(character)) + " ") + string(global.hurtmilestone)) + " TIMES...")
    if (tvsprite != spr_tvtalking1 && tvsprite != spr_tvtalking2 && tvsprite != spr_tvtalking3 && tvsprite != spr_tvtalking4)
        tvsprite = choose(spr_tvtalking1, spr_tvtalking2, spr_tvtalking3, spr_tvtalking4)
    global.hurtmilestone += 3
}
else if (obj_player.state == 44)
{
    showtext = 1
    message = "SWEET DUDE!!"
    alarm[0] = 50
    tvsprite = spr_tvrad
    once = 1
}
else if (global.combo != 0 && global.combotime != 0 && (tvsprite == spr_tvdefault || tvsprite == spr_tvcombo || tvsprite == spr_tvescape))
{
    tvsprite = spr_tvcombo
    image_speed = 0
    if (global.combo >= 4)
        imageindexstore = 3
    else
        imageindexstore = (global.combo - 1)
}
else if (global.combotime == 0 && tvsprite == spr_tvcombo)
{
    tvsprite = spr_tvcomboresult
    image_index = imageindexstore
    alarm[0] = 50
}
if (obj_player.state == states.victory)
{
    showtext = 1
    message = "GOT THE KEY!"
    alarm[0] = 50
}
#endregion
#region Old Facehud
	if (obj_player1.sprite_index == spr_knightpep_thunder)
	{
        pepheadspr = spr_pepinoHUDthunder
		noisespr = spr_noiseHUD_thunder
	}
    else if obj_player1.sprite_index != spr_knightpep_start && (_state == states.knightpep || _state == states.knightpepbump || _state == states.knightpepslopes)
	{
		pepheadspr = spr_pepinoHUDknight
		noisespr = spr_noiseHUD_knight
	}
    else if (obj_player1.sprite_index == spr_bombpep_end)
	{
        pepheadspr = spr_pepinoHUDbombend
		noisespr = spr_noiseHUD_bomb
	}
    else if (instance_exists(obj_itspizzatime) || ((obj_player1.sprite_index == spr_bombpep_intro) || ((obj_player1.sprite_index == spr_bombpep_runabouttoexplode) || ((obj_player1.sprite_index == spr_bombpep_run) || (obj_player1.sprite_index == spr_player_fireass)))))
    {
		pepheadspr = spr_pepinoHUDscream
		noisespr = spr_noiseHUD_panic
	}
    else if (_state == states.stunned || _state == states.freefallland || _state == states.Sjumpland) && (obj_camera.shake_mag > 0)
	{
        pepheadspr = spr_pepinoHUDstun
		noisespr = spr_noiseHUD_hurt
	}
    else if obj_player1.sprite_index == spr_player_victory || _state == states.keyget || _state == states.gottreasure || obj_player1.sprite_index == spr_player_levelcomplete
    {
	   pepheadspr = spr_pepinoHUDhappy
	   noisespr = spr_noiseHUD_happy
	}
    else if ((obj_player1.sprite_index == spr_player_machroll) || (obj_player1.sprite_index == spr_player_tumble))
	{
        pepheadspr = spr_pepinoHUDrolling
		noisespr = spr_noiseHUD_mach2
	}
    else if (global.combo >= 3) 
	{
        pepheadspr = spr_pepinoHUDmenacing
		noisespr = spr_noiseHUD_menacing
	}
    else if obj_player1.sprite_index == obj_player1.spr_mach1 || _state == states.chainsaw || obj_player.state = states.freefall || _state == states.Sjump || _state == states.Sjumpprep || _state == states.punch || _state == states.backbreaker 
    {
		pepheadspr = spr_pepinoHUDmach1
		noisespr = spr_noiseHUD_mach1
	}
    else if _state == states.mach2 || obj_player1.sprite_index == spr_player_dive || obj_player1.sprite_index == spr_player_machslideboost || _state == states.climbwall || _state == states.handstandjump
    {
		pepheadspr = spr_pepinoHUDmach2
		noisespr = spr_noiseHUD_mach2
	}
    else if (_state == states.mach3 && (obj_player1.sprite_index == spr_player_crazyrun))
	{
        pepheadspr = spr_pepinoHUDmach4
		noisespr = spr_noiseHUD_crazyrun
	}
    else if (_state == states.mach3 || (obj_player1.sprite_index == spr_player_machslideboost3))
	{
        pepheadspr = spr_pepinoHUDmach3
		noisespr = spr_noiseHUD_mach3
	}
    else if (_state == states.hurt || ((obj_player1.sprite_index == spr_bombpep_end) || ((obj_player1.sprite_index == spr_player_fireassend) || ((_state == 36) || ((_state == 27) || (((_state == 54) && (obj_player1.sprite_index == spr_player_bossintro)) || ((_state == 54) && (obj_player1.sprite_index == spr_player_idle))))))))
    {    
		pepheadspr = spr_pepinoHUDhurt
		noisespr = spr_noiseHUD_hurt
	}
    else if (obj_player1.angry == 1)
	{
        pepheadspr = spr_pepinoHUD3hp
		noisespr = spr_noiseHUD_angry
	}
    else if ((obj_player1.sprite_index == spr_player_hurtidle) || (obj_player1.sprite_index == spr_player_hurtwalk))
	{
        pepheadspr = spr_pepinoHUD1hp
		noisespr = spr_noiseHUD_lowhealth
	}
    else if ((global.panic == 1) || ((global.snickchallenge == 1) || (global.miniboss == 1)))
	{
        pepheadspr = spr_pepinoHUDpanic
		noisespr = spr_noiseHUD_panic
	}
    else if (obj_player1.sprite_index == spr_shotgun_pullout) 
	{
        pepheadspr = spr_pepinoHUDmenacing
		noisespr = spr_noiseHUD_menacing
	}
    else {
        pepheadspr = spr_pepinoHUD
		noisespr = spr_noiseHUD_idle
	}
	pepheadindex += 0.35
	noiseindex += 0.35
	if anim_end(sprite_get_number(pepheadspr), pepheadindex)
		pepheadindex = frac(pepheadindex)
	if anim_end(sprite_get_number(noisespr), noiseindex)
		noiseindex = frac(noiseindex)
#endregion	
#region Speedbar


if mvsp < 2.4 || !(_state == states.mach1 || _state == states.mach2 || _state == states.mach3 || _state == states.climbwall || _state == states.machslide || _state == states.machroll|| _state == states.handstandjump || _state == states.tumble)
{
	speedbarspr = spr_speedbar
	speedbarindex = 0
}
else if mvsp >= 2.4 && mvsp < 4.8 && (_state == states.mach1 || _state == states.mach2 || _state == states.mach3 || _state == states.climbwall || _state == states.machslide || _state == states.machroll|| _state == states.handstandjump || _state == states.tumble)
{
	speedbarspr = spr_speedbar
	speedbarindex = 1
}
else if mvsp >= 4.8 && mvsp < 7.2 && (_state == states.mach1 || _state == states.mach2 || _state == states.mach3 || _state == states.climbwall || _state == states.machslide || _state == states.machroll|| _state == states.handstandjump || _state == states.tumble)
{
	speedbarspr = spr_speedbar
	speedbarindex = 2
}
else if mvsp >= 7.2 && mvsp < 9.6 && (_state == states.mach1 || _state == states.mach2 || _state == states.mach3 || _state == states.climbwall || _state == states.machslide || _state == states.machroll|| _state == states.handstandjump || _state == states.tumble)
{
	speedbarspr = spr_speedbar
	speedbarindex = 3
}
else if mvsp >= 9.6 && mvsp < 12 && (_state == states.mach1 || _state == states.mach2 || _state == states.mach3 || _state == states.climbwall || _state == states.machslide || _state == states.machroll|| _state == states.handstandjump || _state == states.tumble)
{
	speedbarspr = spr_speedbar
	speedbarindex = 4
}
else if mvsp >= 12 && (_state == states.mach1 || _state == states.mach2 || _state == states.mach3 || _state == states.climbwall || _state == states.machslide || _state == states.machroll|| _state == states.handstandjump || _state == states.tumble)
{
	speedbarspr = spr_speedbarmax
	speedbarindex += 0.35
}
#endregion
