local S = minetest.get_translator("peugeotnium")

minetest.register_node("peugeotnium:stone_with_peugeotnium", {
	description = S("Peugeotnium Ore"),
	_doc_items_longdesc = S("Some peugeotnium contained in stone, it is prety common and can be found below sea level."),
	tiles = { "peugeotnium_peugeotnium_ore.png" },
	is_ground_content = true,
	groups = { pickaxey = 4, building_block = 1, material_stone = 1, blast_furnace_smeltable = 1 },
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	_mcl_silk_touch_drop = true,
})

minetest.register_craftitem("peugeotnium:peugeotnium_ingot", {
	description = S("Peugeotnium Ingot"),
	_doc_items_longdesc = S("Molten peugeotnium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "peugeotnium_peugeotnium_ingot.png",
	groups = { craftitem = 1 },
})


minetest.register_node("peugeotnium:peugeotniumblock", {
	description = S("Block of Peugeotnium"),
	_doc_items_longdesc = S("A block of peugeotnium is mostly a decorative block but also useful as a compact storage of peugeotnium ingots."),
	tiles = { "peugeotnium_peugeotnium_block.png" },
	is_ground_content = false,
	groups = { pickaxey = 4, building_block = 1 },
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	type = "cooking",
	output = "peugeotnium:peugeotnium_ingot",
	recipe = "peugeotnium:stone_with_peugeotnium",
	cooktime = 10,
})


minetest.register_craft({
	output = "peugeotnium:peugeotniumblock",
	recipe = {
		{ "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot" },
		{ "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot" },
		{ "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot" },
	},
})

minetest.register_craft({
	output = "peugeotnium:peugeotnium_ingot 9",
	recipe = {
		{ "peugeotnium:peugeotniumblock" },
	}
})

local stonelike = { "mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite" }


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "peugeotnium:stone_with_peugeotnium",
	wherein        = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(12),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "peugeotnium:stone_with_peugeotnium",
	wherein        = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(12),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "peugeotnium:stone_with_peugeotnium",
	wherein        = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(12),
})


minetest.register_tool("peugeotnium:sword_peugeotnium", {
	description = S("Peugeotnium Sword"),
	_doc_items_longdesc = S("Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles. Swords can also be used to cut down a few particular blocks, such as cobwebs."),
	inventory_image = "peugeotnium_peugeotniumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon = 1, sword = 1, dig_speed_class = 5, enchantability = 30 },
	tool_capabilities = {
		full_punch_interval = 0.200,
		max_drop_level = 5,
		damage_groups = { fleshy = 18 },
		punch_attack_uses = 4000,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "peugeotnium:peugeotnium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 8, level = 5, uses = 4000 },
		swordy_cobweb = { speed = 8, level = 5, uses = 4000 }
	},
})


minetest.register_craft({
	output = "peugeotnium:sword_peugeotnium",
	recipe = {
		{ "peugeotnium:peugeotnium_ingot" },
		{ "peugeotnium:peugeotnium_ingot" },
		{ "mcl_core:stick" },
	}
})


minetest.register_tool("peugeotnium:pick_peugeotnium", {
	description = S("Peugeotnium Pickaxe"),
	_doc_items_longdesc = S("Pickaxes are mining tools to mine hard blocks, such as stone. A pickaxe can also be used as weapon, but it is rather inefficient."),
	inventory_image = "peugeotnium_peugeotniumpick.png",
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
	_repair_material = "peugeotnium:sword_peugeotnium",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		pickaxey = { speed = 50, level = 6, uses = 5000 }
	},
})

minetest.register_craft({
	output = "peugeotnium:pick_peugeotnium",
	recipe = {
		{ "peugeotnium:sword_peugeotnium", "peugeotnium:sword_peugeotnium", "peugeotnium:sword_peugeotnium" },
		{ "", "mcl_core:stick", "" },
		{ "", "mcl_core:stick", "" },
	}
})

minetest.register_tool("peugeotnium:shovel_peugeotnium", {
	description = S("Peugeotnium Shovel"),
	_doc_items_longdesc = S("Shovels are tools for digging coarse blocks, such as dirt, sand and gravel. They can also be used to turn grass blocks to grass paths. Shovels can be used as weapons, but they are very weak."),
	_doc_items_usagehelp = S("To turn a grass block into a grass path, hold the shovel in your hand, then use (rightclick) the top or side of a grass block. This only works when there's air above the grass block."),
	inventory_image = "peugeotnium_peugeotniumshovel.png",
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
	_repair_material = "peugeotnium:peugeotnium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 50, level = 6, uses = 5000 }
	},
})

minetest.register_craft({
	output = "peugeotnium:shovel_peugeotnium",
	recipe = {
		{ "peugeotnium:peugeotnium_ingot" },
		{ "mcl_core:stick" },
		{ "mcl_core:stick" },
	}
})

minetest.register_tool("peugeotnium:axe_peugeotnium", {
	description = S("Peugeotnium Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "peugeotnium_peugeotniumaxe.png",
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
	_repair_material = "peugeotnium:peugeotnium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 50, level = 6, uses = 5000 }
	},
})

minetest.register_craft({
	output = "peugeotnium:axe_peugeotnium",
	recipe = {
		{ "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot" },
		{ "peugeotnium:peugeotnium_ingot", "mcl_core:stick" },
		{ "", "mcl_core:stick" },
	},
})

minetest.register_craft({
	output = "peugeotnium:axe_peugeotnium",
	recipe = {
		{ "peugeotnium:peugeotnium_ingot", "peugeotnium:peugeotnium_ingot" },
		{ "mcl_core:stick", "peugeotnium:peugeotnium_ingot" },
		{ "mcl_core:stick", "" },
	},
})


mcl_armor.register_set({
	name = "peugeotnium",
	description = "Peugeotnium",
	durability = 2000,
	enchantability = 30,
	points = {
		head = 6,
		torso = 16,
		legs = 12,
		feet = 6,
	},
	toughness = 2,
	craft_material = "peugeotnium:peugeotnium_ingot",
	sound_equip = "mcl_armor_equip_diamond",
	sound_unequip = "mcl_armor_unequip_diamond",
})
