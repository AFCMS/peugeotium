local S = minetest.get_translator("peugeotium")

minetest.register_node("peugeotium:stone_with_peugeotium", {
	description = S("Peugeotium Ore"),
	_doc_items_longdesc = S("Some peugeotium contained in stone, it is prety common and can be found below sea level."),
	tiles = { "peugeotium_peugeotium_ore.png" },
	is_ground_content = true,
	groups = { pickaxey = 4, building_block = 1, material_stone = 1, blast_furnace_smeltable = 1 },
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	_mcl_silk_touch_drop = true,
})

minetest.register_craftitem("peugeotium:peugeotium_ingot", {
	description = S("Peugeotium Ingot"),
	_doc_items_longdesc = S("Molten peugeotium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "peugeotium_peugeotium_ingot.png",
	groups = { craftitem = 1 },
})


minetest.register_node("peugeotium:peugeotiumblock", {
	description = S("Block of Peugeotium"),
	_doc_items_longdesc = S("A block of peugeotium is mostly a decorative block but also useful as a compact storage of peugeotium ingots."),
	tiles = { "peugeotium_peugeotium_block.png" },
	is_ground_content = false,
	groups = { pickaxey = 4, building_block = 1 },
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

mcl_stairs.register_stair_and_slab_simple("peugeotium", "peugeotium:peugeotiumblock", S("Peugeotium Stairs"), S("Peugeotium Slab"), S("Double Peugeotium Slab"))

minetest.register_craft({
	type = "cooking",
	output = "peugeotium:peugeotium_ingot",
	recipe = "peugeotium:stone_with_peugeotium",
	cooktime = 10,
})


minetest.register_craft({
	output = "peugeotium:peugeotiumblock",
	recipe = {
		{ "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot" },
		{ "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot" },
		{ "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot" },
	},
})

minetest.register_craft({
	output = "peugeotium:peugeotium_ingot 9",
	recipe = {
		{ "peugeotium:peugeotiumblock" },
	},
})

local stonelike = { "mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite" }


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "peugeotium:stone_with_peugeotium",
	wherein        = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(12),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "peugeotium:stone_with_peugeotium",
	wherein        = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(12),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "peugeotium:stone_with_peugeotium",
	wherein        = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(12),
})


minetest.register_tool("peugeotium:sword_peugeotium", {
	description = S("Peugeotium Sword"),
	_doc_items_longdesc = S("Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles. Swords can also be used to cut down a few particular blocks, such as cobwebs."),
	inventory_image = "peugeotium_peugeotiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon = 1, sword = 1, dig_speed_class = 5, enchantability = 30 },
	tool_capabilities = {
		full_punch_interval = 0.200,
		max_drop_level = 5,
		damage_groups = { fleshy = 18 },
		punch_attack_uses = 4000,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "peugeotium:peugeotium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 8, level = 5, uses = 4000 },
		swordy_cobweb = { speed = 8, level = 5, uses = 4000 }
	},
})


minetest.register_craft({
	output = "peugeotium:sword_peugeotium",
	recipe = {
		{ "peugeotium:peugeotium_ingot" },
		{ "peugeotium:peugeotium_ingot" },
		{ "mcl_core:stick" },
	}
})


minetest.register_tool("peugeotium:pick_peugeotium", {
	description = S("Peugeotium Pickaxe"),
	_doc_items_longdesc = S("Pickaxes are mining tools to mine hard blocks, such as stone. A pickaxe can also be used as weapon, but it is rather inefficient."),
	inventory_image = "peugeotium_peugeotiumpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool = 1, pickaxe = 1, dig_speed_class = 6, enchantability = 30 },
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.6,
		max_drop_level = 10,
		damage_groups = { fleshy = 10 },
		punch_attack_uses = 5000,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "peugeotium:sword_peugeotium",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		pickaxey = { speed = 50, level = 6, uses = 5000 }
	},
})

minetest.register_craft({
	output = "peugeotium:pick_peugeotium",
	recipe = {
		{ "peugeotium:sword_peugeotium", "peugeotium:sword_peugeotium", "peugeotium:sword_peugeotium" },
		{ "", "mcl_core:stick", "" },
		{ "", "mcl_core:stick", "" },
	}
})

minetest.register_tool("peugeotium:shovel_peugeotium", {
	description = S("Peugeotium Shovel"),
	_doc_items_longdesc = S("Shovels are tools for digging coarse blocks, such as dirt, sand and gravel. They can also be used to turn grass blocks to grass paths. Shovels can be used as weapons, but they are very weak."),
	_doc_items_usagehelp = S("To turn a grass block into a grass path, hold the shovel in your hand, then use (rightclick) the top or side of a grass block. This only works when there's air above the grass block."),
	inventory_image = "peugeotium_peugeotiumshovel.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool = 1, shovel = 1, dig_speed_class = 6, enchantability = 30 },
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 10,
		damage_groups = { fleshy = 8 },
		punch_attack_uses = 5000,
	},
	on_place = minetest.registered_items["mcl_tools:shovel_diamond"].on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "peugeotium:peugeotium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 50, level = 6, uses = 5000 }
	},
})

minetest.register_craft({
	output = "peugeotium:shovel_peugeotium",
	recipe = {
		{ "peugeotium:peugeotium_ingot" },
		{ "mcl_core:stick" },
		{ "mcl_core:stick" },
	}
})

minetest.register_tool("peugeotium:axe_peugeotium", {
	description = S("Peugeotium Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "peugeotium_peugeotiumaxe.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool = 1, axe = 1, dig_speed_class = 6, enchantability = 30 },
	tool_capabilities = {
		full_punch_interval = 0.5,
		max_drop_level = 10,
		damage_groups = { fleshy = 20 },
		punch_attack_uses = 5000,
	},
	on_place = minetest.registered_items["mcl_tools:axe_diamond"].on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "peugeotium:peugeotium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 50, level = 6, uses = 5000 }
	},
})

minetest.register_craft({
	output = "peugeotium:axe_peugeotium",
	recipe = {
		{ "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot" },
		{ "peugeotium:peugeotium_ingot", "mcl_core:stick" },
		{ "", "mcl_core:stick" },
	},
})

minetest.register_craft({
	output = "peugeotium:axe_peugeotium",
	recipe = {
		{ "peugeotium:peugeotium_ingot", "peugeotium:peugeotium_ingot" },
		{ "mcl_core:stick", "peugeotium:peugeotium_ingot" },
		{ "mcl_core:stick", "" },
	},
})


mcl_armor.register_set({
	name = "peugeotium",
	description = "Peugeotium",
	durability = 2000,
	enchantability = 30,
	points = {
		head = 6,
		torso = 16,
		legs = 12,
		feet = 6,
	},
	toughness = 2,
	craft_material = "peugeotium:peugeotium_ingot",
	sound_equip = "mcl_armor_equip_diamond",
	sound_unequip = "mcl_armor_unequip_diamond",
})
