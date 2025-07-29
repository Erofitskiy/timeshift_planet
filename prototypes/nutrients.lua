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