-- translator support
local S = core.get_translator("pastel_dye")

local colours = {
-- name, description
   {"red", " Pastel Red"},
   {"orange", "Pastel Orange"},
   {"yellow", "Pastel Yellow"},
   {"olivegreen", "Pastel Olive Green"},
   {"mintgreen", "Pastel Mint Green"},
   {"cyan", "Pastel Cyan"},
   {"blue", "Pastel Blue"},
   {"purple", "Pastel Purple"},
   {"pink", "Pastel Pink"},
   {"lightpink", "Pastel Light Pink"},
}


--register item
for _, colour in ipairs(colours) do

   core.register_node("pastel_dye:" .. colour[1], {
   description = colour[2] .. "Dye",
   inventory_image = "pastel_dye_" .. colour[1] .. ".png",
   groups = {dye = 1}
   
   })
   
  end
-- craft item

local original_to_pastel = {
-- {pastel, original} (there are only 9/10, olivegreen will only be crafted with 2 pastel dyes (yellow and mintgreen))
   {"red", "red"},
   {"orange", "orange"},
   {"yellow", "yellow"},
   {"mintgreen", "green"},
   {"cyan", "cyan"},
   {"blue", "blue"},
   {"purple", "violet"},
   {"pink", "magenta"},
   {"lightpink", "pink"},
}
for _, colour in ipairs(original_to_pastel) do

   core.register_craft({
   type = "shapeless",
   output = "pastel_dye:" .. colour[1] .. " 2",
   recipe = {"dye:" .. colour[2], "dye:white"},
  
})
end

-- mixing colours
local mix = {
   {"yellow", "mintgreen", "olivegreen"},
}
for _, colour in ipairs(mix) do
   core.register_craft({
   type = "shapeless",
   output = "pastel_dye:" .. colour[3],
   recipe = {"pastel_dye:" .. colour[1], "dye:" .. colour[2]}
   
   })
   
end
--this probably didn't need a table...
