-- translation support

local S = core.get_translator("pastel_bakedclay")

-- colour list

local pc = {
    {"pink", "Pastel Pink"},
	{"lightpink", "Pastel Light Pink"},
	{"orange", "Pastel Orange"},
	{"purple", "Pastel Purple"},
	{"yellow", "Pastel Yellow"},
	{"blue", "Pastel Blue"},
	{"olivegreen", "Pastel Olive Green"},
	{"mintgreen", "Pastel Mint Green"},
	{"cyan", "Pastel Cyan"},
	{"red", "Pastel Red"},
	
}

-- check mod support

local stairs_mod = core.get_modpath("stairs")
local stairsplus_mod = core.get_modpath("moreblocks") and core.global_exists("stairsplus")
local stairsplus_compat = core.settings:get_bool("stairsplus_clay_compatibility") ~= false



for _, row in ipairs(pc) do

	-- register node

	core.register_node("pastel_bakedclay:" .. row[1], {
		description = row[2] .. " Baked Clay",
		tiles = {"pastel_bakedclay_" .. row[1] ..".png"},
		groups = {cracky = 3, bakedclay = 1},
		sounds = default.node_sound_stone_defaults(),
		is_ground_content = false
	})

	-- register craft recipe

for _, row in ipairs(pc) do

		core.register_craft({
			output = "pastel_bakedclay:" .. row[1] .. " 8",
			recipe = {
				{"group:bakedclay", "group:bakedclay", "group:bakedclay"},
				{"group:bakedclay", "pastel_dye:" .. row[1], "group:bakedclay"},
				{"group:bakedclay", "group:bakedclay", "group:bakedclay"}
			}
		})
	end

	-- stairs plus

	if stairsplus_mod then


		stairsplus:register_all("pastel_bakedclay", row[1],
				"pastel_bakedclay:" .. row[1], {
			description = row[2] .. " " .. "Baked Clay",
			tiles = {"pastel_bakedclay_" .. row[1] .. ".png"},
			groups = {cracky = 3, bakedclay = 1},
			sounds = default.node_sound_stone_defaults()
		})
		


		if stairsplus_compat then

			stairsplus:register_alias_all("pastel_bakedclay", row[1],
					"pastel_bakedclay", row[1])

			core.register_alias("stairs:slab_pastel_bakedclay_".. row[1],
					"pastel_bakedclay:slab_pastel_baked_clay_" .. row[1])

			core.register_alias("stairs:stair_pastel_bakedclay_".. row[1],
					"pastel_bakedclay:stair_pastel_baked_clay_" .. row[1])
		end

	-- stairs redo

	elseif stairs_mod and stairs.mod then

		stairs.register_all(row[1], "pastel_bakedclay:" .. row[1],
			{cracky = 3},
			{"pastel_bakedclay_" .. row[1] .. ".png"},
			row[2] .. " Baked Clay",
			default.node_sound_stone_defaults())

	-- default stairs

	elseif stairs_mod then

		stairs.register_stair_and_slab(row[1], "pastel_bakedclay:".. row[1],
			{cracky = 3},
			{"pastel_bakedclay_" .. row[1] .. ".png"},
			row[2] .. " " .. "Pastel Baked Clay Stair",
			row[2] .. " " .. "Pastel Baked Clay Slab",
			default.node_sound_stone_defaults())
	end
	
-- register mymillwork
for _, row in ipairs(pc) do

   mymillwork.register("pastel_bakedclay:" .. row[1], 
   "pastel_" .. row[1],
   row[2] .. "Baked Clay",
   "pastel_bakedclay_" .. row[1] .. ".png",
   {cracky = 3, bakedclay = 1, not_in_creative_inventory = 1}
   )
 end
 
end
