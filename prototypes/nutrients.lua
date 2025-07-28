--require("__space-age__.prototypes.entity.plants")

local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds

data:extend({
-- NUTRIENTS FLUID
  {
    type = "fluid",
    name = "timeshift_nutrients_slurry",
    icon = icons .. "timeshift_nutrients_slurry.png",
    subgroup = "timeshift-processes",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {0.4, 0.4, 0.4},
    flow_color = {0.4, 0.4, 0.4},
    order = "a[fluid]-a[water]-c[timeshift_nutrients_slurry]",
    gas_temperature = 15,
    auto_barrel = false
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


  {
    type = "item",
    name = "timeshift_nutrients",
    icon = icons .. "timeshift_nutrients.png",
    subgroup = "timeshift-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,

    plant_result = "timeshift_nutrients_plant",
    place_result = "timeshift_nutrients_plant",
    weight = 10*kg
  },
--[[
  {
    type = "plant",
    name = "timeshift_nutrients_plant", -- in water. science
    icon = icons .. "timeshift_nutrients_plant.png",
    flags = plant_flags,
    minable =
    {
      mining_particle = "jellystem-mining-particle",
      mining_time = 0.5,
      results = {{type = "item", name = "timeshift_nutrients", amount = 5}},
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-jellystem", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-jellystem", 6, 0.35),
    growth_ticks = 5 * minutes,
    emissions_per_second = plant_emissions,
    harvest_emissions = plant_harvest_emissions,
    max_health = 50,
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    --collision_mask = {layers={player=true, ground_tile=true, train=true}},
    selection_box = {{-1, -3}, {1, 0.8}},
    drawing_box_vertical_extension = 0.8,
    subgroup = "trees",
    order = "a[tree]-c[gleba]-a[seedable]-b[jellystem]",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_jellystem,
    autoplace =
    {
      control = "gleba_plants",
      order = "a[tree]-b[forest]-b",
      probability_expression = "min(0.2, 0.3 * (1 - gleba_plants_noise) * control:gleba_plants:size)",
      richness_expression = "random_penalty_at(3, 1)",
      tile_restriction = {"natural-jellynut-soil", "artificial-jellynut-soil", "overgrowth-jellynut-soil"}
    },
    variations = gleba_tree_variations("jellystem", 8, 4, 1.3, 640, 560, util.by_pixel(52, -73)),
    colors = {
      {r = 255, g = 255, b =  255},
      {r = 233, g = 218, b =  225},
      --{r = 207, g = 202, b =  235},
      {r = 255, g = 235, b =  235},
      {r = 230, g = 217, b =  235},
      {r = 242, g = 202, b =  235},
      {r = 230, g = 235, b =  235},
      --{r = 194, g = 165, b  =  208},
      --{r = 215, g = 185, b =  208},
      --{r = 194, g = 185, b =  208},
      {r = 252, g = 186, b =  209}
    },
    agricultural_tower_tint =
    {
      primary = {r = 0.620, g = 0.307, b = 0.461, a = 1.000}, -- #eac1f5ff
      secondary = {r = 0.336, g = 0.624, b = 0.340, a = 1.000}, -- #885289ff
    },
    ambient_sounds =
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/world/plants/jellystem", 8, 0.5),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
        }
      },
      radius = 7.5,
      min_entity_count = 2,
      max_entity_count = 10,
      entity_to_sound_ratio = 0.5,
      average_pause_seconds = 7
    },
    map_color = {255, 255, 255},
    -- tile_buildability_rules = { {area = {{-0.55, -0.55}, {0.55, 0.55}}, required_tiles = {"natural-jellynut-soil", "artificial-jellynut-soil"}, remove_on_collision = true} },
  },]]
})


local plant = table.deepcopy(data.raw["plant"]["jellystem"])
plant.name = "timeshift_nutrients_plant"
plant.icon = icons .. "timeshift_nutrients_plant.png"
plant.minable =
{
  mining_particle = "jellystem-mining-particle",
  mining_time = 0.5,
  results = {{type = "item", name = "timeshift_nutrients", amount = 5}},
}
plant.autoplace = 
{
  probability_expression = "crater_large",
  tile_restriction = {"natural-jellynut-soil", "artificial-jellynut-soil", "overgrowth-jellynut-soil"}
}
plant.growth_ticks = 2 * minutes

data:extend({plant})