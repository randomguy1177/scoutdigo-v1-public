scribble_font_set_default("font_console")
global.levelname = ""
global.secret_layers = []
global.death_mode = 0
global.textures_saved = -4
// IM NOT ADDING ALL THES... THEY JUST HERE
#macro camx camera_get_view_x(view_camera[0])
#macro camy camera_get_view_y(view_camera[0])
#macro camw camera_get_view_width(view_camera[0])
#macro camh camera_get_view_height(view_camera[0])
#macro plyr global.coop ? instance_nearest(x, y, obj_player) : obj_player1
#macro cur_time global.ScrollOffset / 60
#macro DEBUG true


enum characters {
	peppino,
	noise,
	jetpack_noise,
	pizzelle,
	vigilante,
	gus,
	mario,
	bo_noise,
	
	
	

	pepperman,
	snick,
	pizzano
	
}

enum states
{
	normal,
	
	revolver,
	dynamite,
	boots,
	grabbed,
	tumble,
	finishingblow,
	ejected,
	transitioncutscene,
	fireass,
	firemouth,
	mort,
	mortjump,
	mortattack,
	morthook,
	hook,
	ghost,
	ghostpossess,
	titlescreen,
	hookshot,
	tacklecharge,
	cheeseball,
	cheeseballclimbwall,
	slap,
	cheesepep,
	cheesepepstick,
	cheesepepjump,
	cheesepepfling,
	cheesepeplaunch,
	cheesepepstickside,
	cheesepepstickup,
	rideweenie,
	motorcycle,
	boxxedpep,
	boxxedpepspin,
	boxxedpepjump,
	pistolaim,
	climbwall,
	knightpepslopes,
	portal,
	secondjump,
	chainsawbump,
	handstandjump,
	lungeattack,
	lungegrab,
	dashtumble,
	gottreasure,
	knightpep,
	knightpepattack,
	knightpepbump,
	meteorpep,
	bombpep,
	bombgrab,
	bombpepside,
	bombpepup,
	grabbing,
	chainsawpogo,
	shotgunjump,
	pogo,
	stunned,
	highjump,
	chainsaw,
	facestomp,
	mach4, // doesn't even have a script
	timesup,
	machroll,
	shotgun,
	shotguncrouch,
	shotguncrouchjump,
	shotgunshoot,
	shotgundash,
	shotgunfreefall,
	pistol,
	machfreefall,
	throwing,
	slam,
	superslam,
	skateboard,
	grind,
	grab,
	punch,
	backkick,
	uppunch,
	shoulder,
	backbreaker,
	graffiti,
	bossdefeat,
	pizzathrow,
	bossintro,
	gameover,
	keyget,
	tackle,
	jump,
	ladder,
	slipnslide,
	comingoutdoor,
	smirk,
	Sjump,
	victory,
	Sjumpprep,
	crouch,
	crouchjump,
	crouchslide,
	mach1,
	mach2,
	machslide,
	bump,
	hurt,
	freefall,
	hang,
	turning, // seems to be completely wiped too like mach4
	freefallland,
	door,
	barrel,
	barreljump,
	barrelclimbwall,
	barrelslide,
	current,
	boulder,
	taxi,
	runonball,
	mach3,
	freefallprep,
	Sjumpland,
	faceplant,
	rage,
	idle,
	bounce, // doesnt exist
	charge,
	pizzagoblinthrow,
	turn,
	hitceiling, // doesnt exist
	hitwall, // doesnt exist
	unknown_1, // 133
	walk,
	fall,
	land,
	hit,
	stun,
	recovery, // doesnt exist
	stomped, // doesnt exist
	chase,
	spawnenemy,
	arena,
	arenaintro,
	arenaround,
	actor,
	parry,
	golf,
	float,
	tube,
	unused_2, // 151
	policetaxi,
	shoulderbash,
	pummel,
	staggered,
	thrown,
	boss_supershoulderbash, // 157
	boss_superattackstart,
	boss_superattackcharge,
	boss_superattack,
	boss_shoulderturn,
	boss_fistmatch,
	boss_fistmatchend,
	boss_groundpunchstart,
	slipbanan,
	boss_millionpunch,
	boss_skateboardturn,
	boss_bombkick,
	boss_bombpogo,
	boss_jetpackstart,
	boss_jetpack,
	boss_jetpackcancel,
	boss_jetpackspin,
	boss_shield,
	boss_helicopterhat,
	boss_panicjump,
	boss_smokebombstart,
	boss_smokebombcrawl,
	boss_springshoes,
	boss_cardboard,
	boss_cardboardend,
	boss_mockery,
	bombdelete,
	rocket,
	rocketslide,
	gotoplayer,
	trickjump,
	totem,
	underground,
	ridecow,
	ratmount,
	ratmountjump,
	ratmountattack,
	ratmountspit,
	ratmountclimbwall,
	ratmounthurt,
	ratmountgroundpound,
	ratmountbounce,
	unused_3,
	ratmountballoon,
	ratmounttumble,
	ratmountgrind,
	ratmounttrickjump,
	ratmountskid,
	ratgrabbed,
	blockstance,
	balloon,
	debugstate,
	trashjumpprep,
	trashjump,
	trashroll,
	stringfling,
	stringjump,
	stringfall,
	noisejetpack,
	spiderweb,
	robotidle,
	robotintro,
	robotroaming,
	robotchase,
	robotinvestigate,
	robotseeking,
	flushidle,
	flushtransition,
	animatronic,
	pizzaface_moustache,
	pizzaface_mouth,
	pizzaface_eyes,
	pizzaface_nose,
	pizzaface_ram,
	pizzaface_phase2transition,
	pizzahead_look,
	pizzahead_fishing,
	unused_4,
	pizzahead_bombrun,
	pizzahead_npcthrow,
	pizzahead_portraitthrow,
	pizzahead_enguarde,
	pizzahead_sexypicture,
	pizzahead_pullinglevel,
	pizzahead_eat,
	pizzahead_surprisebox,
	pizzahead_spinningrun,
	pizzahead_spinningkick,
	pizzahead_spinningpunch,
	pizzahead_groundpunch,
	pizzahead_bigkick,
	pizzahead_slamhead,
	pizzahead_slamhead2,
	tv_whitenoise,
	tv_expression,
	playersuperattack,
	unused_5,
	jetpackjump,
	unused_6,
	unused_7,
	bee,
	unused_8,
	ratmountpunch,
	ratmountcrouch,
	ratmountladder,
	unused_9,
	unused_10,
	magnet,
	antigrav,
	secret,
	talkto,
	flick,
	unpaused,
	paused,
	options,
	mod_options,
	audio_options,
	palette_options,
	exit_level,
	mortshoot,
	arena_all,
	arena_rand,
	scared,
	mariowalk,
	mariojump,
	marioslide,
}

global.coop = false
global.currentsavefile = 1
global.mach_color1 = make_colour_rgb(96, 208, 72)
global.mach_color2 = make_colour_rgb(248, 0, 0)
global.mach2_color1 = c_black
global.mach2_color2 = c_black
global.afterimage_color1 = make_colour_rgb(255, 0, 0)
global.afterimage_color2 = make_colour_rgb(0, 255, 0)
global.smallnumber_color1 = make_colour_rgb(255, 255, 255)
global.smallnumber_color2 = make_colour_rgb(248, 0, 0)
global.optimize = 0
global.autotile = 1
global.font_small = font_add_sprite_ext(spr_smallfont, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!._1234567890:;?|*/',\"()=-+@%~[]<>$", true, -2)
global.smallnumber_fnt = font_add_sprite_ext(spr_smallnumber, "1234567890-", true, 0)
global.pigreduction = 0
global.pigtotal = 0
global.levelcomplete = 0
global.levelcompletename = -4
global.entrancetreasure = 0
global.medievaltreasure = 0
global.ruintreasure = 0
global.dungeontreasure = 0
global.deserttreasure = 0
global.graveyardtreasure = 0
global.farmtreasure = 0
global.spacetreasure = 0
global.beachtreasure = 0
global.foresttreasure = 0
global.pinballtreasure = 0
global.golftreasure = 0
global.streettreasure = 0
global.sewertreasure = 0
global.factorytreasure = 0
global.freezertreasure = 0
global.chateautreasure = 0
global.mansiontreasure = 0
global.kidspartytreasure = 0
global.wartreasure = 0
global.entrancecutscene = -4
global.medievalcutscene = -4
global.ruincutscene = -4
global.ruincutscene2 = -4
global.ruincutscene3 = -4
global.dungeoncutscene = -4
global.peppermancutscene1 = -4
global.peppermancutscene2 = -4
global.chieftaincutscene = -4
global.chieftaincutscene2 = -4
global.desertcutscene = -4
global.graveyardcutscene = -4
global.spacecutscene = -4
global.vigilantecutscene1 = -4
global.vigilantecutscene2 = -4
global.vigilantecutscene3 = -4
global.farmcutscene = -4
global.superpinballcutscene = -4
global.pubcutscene = -4
global.pinballcutscene = -4
global.beercutscene = -4
global.exitfeecutscene = -4
global.forestcutscene = -4
global.bottlecutscene = -4
global.papercutscene = -4
global.beachboatcutscene = -4
global.beachcutscene = -4
global.sewercutscene = -4
global.burgercutscene = -4
global.golfcutscene = -4
global.anarchistcutscene1 = -4
global.anarchistcutscene2 = -4
global.factoryblock = -4
global.streetcutscene = -4
global.graffiticutscene = -4
global.factorygraffiti = -4
global.factorycutscene = -4
global.hatcutscene1 = -4
global.hatcutscene2 = -4
global.hatcutscene3 = -4
global.jetpackcutscene = -4
global.noisecutscene1 = -4
global.noisecutscene2 = -4
global.freezercutscene = -4
global.kidspartycutscene = -4
global.gasolinecutscene = -4
global.mansioncutscene = -4
global.chateaucutscene = -4
global.ghostsoldiercutscene = -4
global.mrstickcutscene1 = -4
global.mrstickcutscene2 = -4
global.mrstickcutscene3 = -4
global.chateauswap = -4
global.warcutscene = -4
ini_open_from_string(obj_savesystem.ini_str)
ini_close()
global.charDetails[characters.peppino] = {
	name: "Peppino",
	palette: spr_peppalette,
	collect : [spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_sausagecollect, spr_pineapplecollect],
	bigcollect : [spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5],
	destroyable : [spr_towerblocksmall, spr_destroyable2],
	bigdestroyable : [spr_towerblock, spr_bigbreakable],
	metalb : [spr_metaltowerblock],
	combotitle : [spr_combotitles],
	music : {
		entrance : [mu_entrance, 0],
		entrance_secret : [mu_entrancesecret, 0],
		escape : [mu_pizzatime, 0],
		lap : [mu_chase, 0],
		death : [mu_calzonification, 0],
	},
	sfx : {
		taunt : [sfx_taunt],
		supertaunt : [sfx_supertaunt],
		collect : [sfx_collecttopping],
		bigcollect : [sfx_collectpizza],
		fireass : [sfx_scream5],
	}
}
global.charDetails[characters.gus] = {
	name: "Gustavo",
	palette: spr_guspalette,
	collect : [spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_sausagecollect, spr_pineapplecollect],
	bigcollect : [spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5],
	destroyable : [spr_towerblocksmall, spr_destroyable2],
	bigdestroyable : [spr_towerblock, spr_bigbreakable],
	metalb : [spr_metaltowerblock],
	combotitle : [spr_combotitles],
	music : {
		entrance : [mu_entrance, 0],
		entrance_secret : [mu_entrancesecret, 0],
		escape : [mu_pizzatime, 0],
		lap : [mu_chase, 0],
		death : [mu_calzonification, 0],
	},
	sfx : {
		taunt : [sfx_taunt],
		supertaunt : [sfx_supertaunt],
		collect : [sfx_collecttopping],
		bigcollect : [sfx_collectpizza],
		fireass : [sfx_scream5],
	}
}

global.charDetails[characters.noise] = {
	name : "Noise",
	palette: spr_noisepalette,
	collect : [spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5],
	bigcollect : [spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5],
	destroyable : [spr_towerblocksmall, spr_halloweensmallblock],
	bigdestroyable : [spr_towerblock, spr_halloweenbigblock],
	metalb : [spr_metaltowerblock],
	combotitle : [spr_combotitles],
	music : {
		entrance : [mu_noiseentrance, 0],
		entrance_secret : [mu_entrancesecretN, 0],
		escape : [mu_noiseescape, 0],
		lap : [mu_noiselap, 0],
		death : [mu_miniboss, 0],
	},
	sfx : {
		taunt : [sfx_taunt],
		supertaunt : [sfx_supertaunt],
		collect : [sfx_collecttopping],
		bigcollect : [sfx_collectpizza],
		fireass : [sfx_scream5],
	}
}

global.charDetails[characters.jetpack_noise] = {
	name : "Pogo Noise",
	palette: spr_noisepalette,
	collect : [spr_halloweencollectibles1, spr_halloweencollectibles2, spr_halloweencollectibles3, spr_halloweencollectibles4, spr_halloweencollectibles5],
	bigcollect : [spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5],
	destroyable : [spr_towerblocksmall, spr_destroyable2],
	bigdestroyable : [spr_towerblock, spr_halloweenbigblock],
	metalb : [spr_metaltowerblock],
	combotitle : [spr_combotitles],
	music : {
		entrance : [mu_noiseentrance, 0],
		entrance_secret : [mu_entrancesecretN, 0],
		escape : [mu_noiseescape, 0],
		lap : [mu_noiselap, 0],
		death : [mu_miniboss, 0],
	},
	sfx : {
		taunt : [sfx_taunt],
		supertaunt : [sfx_supertaunt],
		collect : [sfx_collecttopping],
		bigcollect : [sfx_collectpizza],
		fireass : [sfx_scream5],
	}
}

global.charDetails[characters.pizzelle] = {
	name : "Pizzelle",
	palette: spr_pizzypalette,
	collect : [spr_candycollect1, spr_candycollect2, spr_candycollect3, spr_candycollect4, spr_candycollect5],
	bigcollect : [spr_bigcandy1, spr_bigcandy2, spr_bigcandy3, spr_bigcandy4, spr_bigcandy5, spr_bigcandy6],
	destroyable : [spr_ss_smallbreak, spr_ss_smallbreak2],
	bigdestroyable : [spr_ss_destroyable, spr_ss_destroyable2],
	metalb : [spr_ss_metalb],
	combotitle : [spr_combotitles_sugary],
	music : {
		entrance : [mu_entry, 0],
		entrance_secret : [mu_entrysecret, 0],
		escape : [mu_glucose, 0],
		lap : [mu_sweetrelease, 0],
		death : [mu_sucrose, 0],
	},
	sfx : {
		taunt : [sfx_ss_taunt1, sfx_ss_taunt2, sfx_ss_taunt3, sfx_ss_taunt4, sfx_ss_taunt5, sfx_ss_taunt6, sfx_ss_taunt7, sfx_ss_taunt8],
		supertaunt : [sfx_ss_supertaunt1, sfx_ss_supertaunt2, sfx_ss_supertaunt3, sfx_ss_supertaunt4],
		collect : [sfx_ss_collect],
		bigcollect : [sfx_ss_collect],
		fireass : [sfx_ss_fireass],
	}
}
global.charDetails[characters.mario] = {
	name : "Mario",
	palette: spr_pizzypalette,
	collect : [spr_mario_coin],
	bigcollect : [spr_bigcandy1, spr_bigcandy2, spr_bigcandy3, spr_bigcandy4, spr_bigcandy5, spr_bigcandy6],
	destroyable : [spr_mario_breakable, spr_mario_breakablecollect],
	bigdestroyable : [spr_mario_breakablebig, spr_mario_breakablecollectbig],
	metalb : [spr_mario_breakablemetalb],
	combotitle : [spr_combotitles_sugary],
	music : {
		entrance : [mu_entry, 0],
		entrance_secret : [mu_entrysecret, 0],
		escape : [mu_glucose, 0],
		lap : [mu_sweetrelease, 0],
		death : [mu_sucrose, 0],
	},
	sfx : {
		taunt : [sfx_ss_taunt1, sfx_ss_taunt2, sfx_ss_taunt3, sfx_ss_taunt4, sfx_ss_taunt5, sfx_ss_taunt6, sfx_ss_taunt7, sfx_ss_taunt8],
		supertaunt : [sfx_supertaunt],
		collect : [sfx_collecttopping],
		bigcollect : [sfx_collectpizza],
		fireass : [sfx_scream5],
	}
}
global.charDetails[characters.vigilante] = {
	name : "Vigilante",
	palette: spr_vigipalette,
	collect : [spr_shroomcollect, spr_cheesecollect, spr_tomatocollect, spr_sausagecollect, spr_pineapplecollect],
	bigcollect : [spr_pizzacollect1, spr_pizzacollect2, spr_pizzacollect3, spr_pizzacollect4, spr_pizzacollect5],
	destroyable : [spr_towerblocksmall, spr_destroyable2],
	bigdestroyable : [spr_towerblock, spr_bigbreakable],
	metalb : [spr_metaltowerblock],
	combotitle : [spr_combotitles],
	music : {
		entrance : [mu_entrance, 0],
		entrance_secret : [mu_medievalsecret, 0],
		escape : [mu_pizzatime, 0],
		lap : [mu_chase, 0],
		death : [mu_calzonification, 0],
	},
	sfx : {
		taunt : [sfx_taunt],
		supertaunt : [sfx_supertaunt],
		collect : [sfx_collecttopping],
		bigcollect : [sfx_collectpizza],
		fireass : [sfx_scream5],
	}
}

global.color_array[characters.peppino] = [load_custom_colors(characters.peppino, "0"), load_custom_colors(characters.peppino, "1"), load_custom_colors(characters.peppino, "2")]
global.color_array[characters.noise] = [load_custom_colors(characters.noise, "0"), load_custom_colors(characters.noise, "1"), load_custom_colors(characters.noise, "2")]
global.color_array[characters.jetpack_noise] = [load_custom_colors(characters.jetpack_noise, "0"), load_custom_colors(characters.jetpack_noise, "1"), load_custom_colors(characters.jetpack_noise, "2")]
global.color_array[characters.pizzelle] = [load_custom_colors(characters.pizzelle, "0"), load_custom_colors(characters.pizzelle, "1"), load_custom_colors(characters.pizzelle, "2")]
global.color_array[characters.vigilante] = [load_custom_colors(characters.vigilante, "0"), load_custom_colors(characters.vigilante, "1"), load_custom_colors(characters.vigilante, "2")]
global.color_array[characters.gus] = [load_custom_colors(characters.gus, "0"), load_custom_colors(characters.gus, "1"), load_custom_colors(characters.gus, "2")]


pal_swap_init_system(shd_pal_swapper)
global.loadeditor = 0
//room_goto(hub_loadingscreen)
instance_destroy(obj_cutscene_handler)
gamesave_async_load()
