-- pastel_dye/init.lua

pastel_dye = {}

-- Translator support
local S = minetest.get_translator("pastel_dye")

-- Define pastel dyes
pastel_dye.dyes = {
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

-- register dem items
for _, row in ipairs(pastel_dye.dyes) do
	local name = row[1]
	local description = row[2]


	local groups = {dye = 1}

	-- color group
	groups["color_" .. name] = 1

-- base colours and all, groups...
	local base_color_group = {
		pink = "pink",
		orange = "orange",
		purple = "violet", "purple",
		yellow = "yellow",
		blue = "blue",
		mintgreen = "green",
		olivegreen = "green",
		cyan = "cyan", "blue",
		red = "red",
	}

	if base_color_group[name] then
		groups["color_" .. base_color_group[name]] = 1
	end

	minetest.register_craftitem("pastel_dye:" .. name, {
		description = S(description .. " Dye"),
		inventory_image = "pastel_dye_" .. name .. ".png",
		groups = groups
	})
end

-- crafting pastels from OG dyes (and one pastel dye...)

local vanilla_to_pastel = {
	{"pink", "magenta"},
	{"lightpink", "pink"},
	{"orange", "orange"},
	{"purple", "violet"},
	{"yellow", "yellow"},
	{"blue", "blue"},
	{"mintgreen", "green"},
	{"cyan", "cyan"},
	{"red", "red"},
}

for _, row in ipairs(vanilla_to_pastel) do
	local pastel = row[1]
	local normal = row[2]

	minetest.register_craft({
		type = "shapeless",
		output = "pastel_dye:" .. pastel .. " 2",
		recipe = {"dye:" .. normal, "dye:white"},
	})
end
    

-- pastel dye mixing recipes

local pastel_mix_recipes = {
	{"mintgreen", "yellow", "olivegreen"},
	{"red", "blue", "purple"},
}

for _, mix in ipairs(pastel_mix_recipes) do
	minetest.register_craft({
		type = "shapeless",
		output = "pastel_dye:" .. mix[3] .. " 2",
		recipe = {
			"pastel_dye:" .. mix[1],
			"pastel_dye:" .. mix[2],
		},
	})
end

-- Give the people options!! While being a bad coder
local pastel_mix_recipes = {
	{"pink", "white", "lightpink"},
}

for _, mix in ipairs(pastel_mix_recipes) do
	minetest.register_craft({
		type = "shapeless",
		output = "pastel_dye:" .. mix[3] .. " 2",
		recipe = {
			"pastel_dye:" .. mix[1],
			"dye:" .. mix[2],
		},
	})
end

