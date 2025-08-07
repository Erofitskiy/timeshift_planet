--require("__space-age__.prototypes.entity.plants")

local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds


local particle_animations = require("__base__.prototypes.particle-animations")


local function gleba_tree_variations(name, variation_count, per_row, scale_multiplier, width, height, shift, reflection_shift)
  variation_count = variation_count or 5
  per_row = per_row or 5
  scale_multiplier = scale_multiplier or 1
  local width = width or 640
  local height = height or 560
  local variations = {}
  local reflection_shift = reflection_shift or util.by_pixel(52, 80)
  local shift = shift or util.by_pixel(52, -40)
 -- local reflection_shift = {shift[0], shift[1]} --or util.by_pixel(52, 40)

  local sap_particle = "jellystem-leaf-particle"
  local jellystem_particle = "jellystem-branch-particle"


  for i = 1, variation_count do
    local x = ((i - 1) % per_row) * width
    local y = math.floor((i-1)/per_row) * height
    local variation = {
      trunk = {
        filename = entity .. "plant/"..name.."/"..name.."-trunk.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      leaves = {
        filename = entity .. "plant/"..name.."/"..name.."-harvest.png",
        flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      normal = {
        filename = entity .. "plant/"..name.."/"..name.."-normal.png",
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        frame_count = 1,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },
      shadow = {
        frame_count = 2,
        lines_per_file = 1,
        line_length = 1,
        flags = { "mipmap", "shadow" },
        surface = "gleba",
        filenames =
        {
          entity .. "plant/"..name.."/"..name.."-harvest-shadow.png",
          entity .. "plant/"..name.."/"..name.."-shadow.png"
        },
        width = width,
        height = height,
        x = x,
        y = y,
        shift = shift,
        scale = 0.33 * scale_multiplier
      },

      underwater       = nil,
      --water_reflection = gleba_tree_underwater_things[name] and gleba_tree_underwater_things[name].water_reflection or nil,

      water_reflection = {
        pictures = {
        filename = entity .. "plant/"..name.."/"..name.."-effect-map.png",
        --flags = { "mipmap" },
        surface = "gleba",
        width = width,
        height = height,
        x = x,
        y = y,
        --frame_count = 1,
        shift = reflection_shift,
        scale = 0.33 * scale_multiplier
        }
      } or nil,

      leaf_generation = {},
      branch_generation = {},

      leaves_when_damaged = 100,
      leaves_when_destroyed = 35,
      leaves_when_mined_manually = 40,
      leaves_when_mined_automatically = 16,
      branches_when_damaged = 20,
      branches_when_destroyed = 16,
      branches_when_mined_manually = 15,
      branches_when_mined_automatically = 8
    }

    variation.leaf_generation = {
      type = "create-particle",
      particle_name = "jellystem-leaf-particle",
      offset_deviation =
      {
        {-0.8, -1.2},
        {0.8, 1.2}
      },
      initial_height = 1.5,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.06 ,
      initial_vertical_speed_deviation = 0.15,
      speed_from_center = 0.025 ,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0.5,
      tail_length = 10,
      tail_length_deviation = 5,
      tail_width = 5,
      rotate_offsets = false,
      only_when_visible = true
    }
    variation.leaves_when_damaged = 50
    variation.leaves_when_destroyed = 35
    variation.leaves_when_mined_manually = 40
    variation.leaves_when_mined_automatically = 16

    variation.branch_generation = {
      type = "create-particle",
      particle_name = "jellystem-branch-particle",
      offset_deviation = {{-0.65, -1}, {0.65, 1}},
      initial_height = 1.7,
      initial_height_deviation = 0.8,
      initial_vertical_speed = 0.025,
      initial_vertical_speed_deviation = 0.15,
      speed_from_center = 0.035,
      speed_from_center_deviation = 0.02,
      frame_speed = 0.8,
      only_when_visible = true
    }
    variation.branches_when_damaged = 30
    variation.branches_when_destroyed = 40
    variation.branches_when_mined_manually = 35
    variation.branches_when_mined_automatically = 8
  

    table.insert(variations, variation)
  end
  return variations
end


















data:extend({
  {
    type = "item",
    name = "timeshift_nutrients", -- is fruit AND seed
    icon = icons .. "timeshift_nutrients.png",
    subgroup = "timeshift-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,
    fuel_value = "1000GJ",
    fuel_category = "timeshift_nutrients",
    plant_result = "timeshift_nutrients_plant",
    place_result = "timeshift_nutrients_plant",
    weight = 10*kg
  },
  {
    type = "fuel-category",
    name = "timeshift_nutrients"
  },
-- NUTRIENTS FLUID
  {
    type = "fluid",
    name = "timeshift_nutrients_slurry",
    icon = icons .. "timeshift_nutrients_slurry.png",
    subgroup = "timeshift-processes",
    default_temperature = 15,
    max_temperature = 165,
    heat_capacity = "0.2kJ",
    base_color = {0.4, 0.4, 0.4},
    flow_color = {0.4, 0.4, 0.4},
    order = "a[fluid]-a[water]-c[timeshift_nutrients_slurry]",
    gas_temperature = 15,
    auto_barrel = true,
    fuel_value = "3MJ",
    --fuel_category = "timeshift_nutrients",
  },
  {
    type = "recipe",
    name = "timeshift_nutrients_slurry",
    category = "organic-or-chemistry",
    energy_required = 1,
    ingredients = {
      --{type = "item", name = "nutrients", amount = 7},
      --{type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "timeshift_nutrients", amount = 1},
      {type = "fluid", name = "water", amount = 30},
    },
    results = {{type = "fluid", name = "timeshift_nutrients_slurry", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },

})



local plant = table.deepcopy(data.raw["plant"]["jellystem"])
plant.name = "timeshift_nutrients_plant"
plant.icon = icons .. "timeshift_nutrients_plant.png"
plant.minable =
{
  mining_particle = "jellystem-mining-particle",
  mining_time = 0.5,
  results = {{type = "item", name = "timeshift_nutrients", amount = 2}},
}
plant.autoplace = 
{
  --probability_expression = "min(0.2, 0.3 * (2 - gleba_plants_noise) * control:gleba_plants:size)", -- way too common
  --probability_expression = "gleba_select(gleba_copper_stromatolite - clamp(gleba_decorative_knockout, 0, 1), 1.3, 2, 0.2, 0, 1)", -- too common
  probability_expression = "min(place_every_n(15,15,1,1), 0.1 * fulgora_artificial_mask + 0.2 * (fulgora_decorative_machine_density - 1.5)) + max(0, 10 * (1.5 - distance))", -- lightning attractor
  tile_restriction = { --all ground looking tiles
    "timeshiftplanet-midland-turquoise-bark",
    "timeshiftplanet-midland-turquoise-bark-2",
    "timeshiftplanet-midland-cracked-lichen-dark",
    "timeshiftplanet-volcanic-ash-dark",
    "timeshiftplanet-volcanic-ash-cracks",
    "timeshiftplanet-volcanic-cracks",
    "timeshiftplanet-volcanic-jagged-ground",
    "timeshiftplanet-volcanic-soil-dark",
    "timeshiftplanet-volcanic-soil-light",
  }
}
plant.variations = gleba_tree_variations("jellystem", 8, 4, 1.3, 640, 560, util.by_pixel(52, -73))
plant.growth_ticks = 2 * minutes

data:extend({plant})

