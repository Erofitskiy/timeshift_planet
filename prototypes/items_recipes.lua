local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({


--- subgroups
  {
    type = "item-subgroup",
    name = "timeshift-processes",
    group = "intermediate-products",
    order = "pb"
  },

  {
    type = "item-subgroup",
    name = "timeshift-production-machine",
    group = "production",
    order = "e2"
  },
--- items
  {
    type = "recipe-category",
    name = "nano_forge"
  },
  {
    type = "recipe-category",
    name = "life_simulator"
  },


  {
    type = "fluid",
    name = "nanobots_hive",
    icon = icons .. "nanobots_hive.png",
    subgroup = "timeshift-processes",
    default_temperature = 15,
    max_temperature = 5000,
    heat_capacity = "0.2kJ",
    base_color = {0.4, 0.4, 0.4},
    flow_color = {0.4, 0.4, 0.4},
    order = "a[fluid]-a[water]-c[nanobots_hive]",
    gas_temperature = 15,
    auto_barrel = false
  },
  {
    type = "recipe",
    name = "nanobots_hive",
    category = "nano_forge",
    energy_required = 2,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 5},
    },
    results = {{type = "fluid", name = "nanobots_hive", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },

})
