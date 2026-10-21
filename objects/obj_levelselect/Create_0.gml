selected_level = 0
selected_world = 0
active = false
alarm[0] = 30
global.leveltorestart = -4


toppin_info[0] = [0, spr_toppinshroom] // image_index, sprite
toppin_info[1] = [0, spr_toppincheese]
toppin_info[2] = [0, spr_toppintomato]
toppin_info[3] = [0, spr_toppinsausage]
toppin_info[4] = [0, spr_toppinpineapple]

stickpressed = false
key_up2 = false
key_down2 = false
key_left2 = false
key_right2 = false
key_jump2 = false



var world_num = 0
create_world(world_num, "HUB")
create_level(world_num, "ENTRANCE", tower_entrancehall, "a")
create_level(world_num, "EXIT", tower_finalhallway, "exit")
create_level(world_num, "TESTING", rm_test, "b")



create_world(++world_num, "WORLD ARENA")
create_level(world_num, "STRONGCOLD", entrance_1, "entrance")
create_level(world_num, "PINBALL", pinball_arena, "a_pinball")
create_level(world_num, "RUIN", ruin_1, "ruin")
create_level(world_num, "DUNGEON", dungeon_1, "dungeon")

create_world(++world_num, "WORLD 1")
create_level(world_num, "ENTRANCE", entrance_1, "entrance")
create_level(world_num, "MEDIEVAL", medieval_1, "medieval")
create_level(world_num, "RUIN", ruin_1, "ruin")
create_level(world_num, "DUNGEON", dungeon_1, "dungeon")

create_world(++world_num, "WORLD 2")
create_level(world_num, "BADLAND", badland_1, "badland")
create_level(world_num, "WASTEYARD", graveyard_1, "graveyard")
create_level(world_num, "FUN FARM", farm_2, "farm")
create_level(world_num, "SALOON", saloon_1, "saloon")

create_world(++world_num, "WORLD 3")
create_level(world_num, "PLAGE", plage_entrance, "plage")
create_level(world_num, "FOREST", forest_1, "forest")
create_level(world_num, "SPACE", space_1, "space")
create_level(world_num, "GOLF", minigolf_1, "minigolf")

create_world(++world_num, "WORLD 4")
create_level(world_num, "STREET", street_intro, "street")
create_level(world_num, "SEWERS", sewer_1, "sewer")
create_level(world_num, "INDUSTRIAL", industrial_1, "industrial")
create_level(world_num, "FREEZER", freezer_1, "freezer")

create_world(++world_num, "WORLD 5")
create_level(world_num, "PIZZASCARE", chateau_1, "chateau")
create_level(world_num, "MANSION", mansion_start, "mansion")
create_level(world_num, "KIDS PARTY", kidsparty_1, "kidsparty")
create_level(world_num, "WAR", war_1, "war")


