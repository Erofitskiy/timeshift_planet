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
    name = "simulation_chamber"
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



  {
    type = "fluid",
    name = "nutrients_fluid_goo",
    icon = icons .. "nutrients_fluid_goo.png",
    subgroup = "timeshift-processes",
    default_temperature = 15,
    max_temperature = 100,
    heat_capacity = "0.2kJ",
    base_color = {0.4, 0.4, 0.4},
    flow_color = {0.4, 0.4, 0.4},
    order = "a[fluid]-a[water]-c[nutrients_fluid_goo]",
    gas_temperature = 15,
    auto_barrel = false
  },
  {
    type = "recipe",
    name = "nutrients_fluid_goo",
    category = "organic-or-chemistry",
    energy_required = 1,
    ingredients = {
      {type = "item", name = "nutrients", amount = 7},
      {type = "item", name = "bioflux", amount = 1},
      {type = "fluid", name = "water", amount = 30},
    },
    results = {{type = "fluid", name = "nutrients_fluid_goo", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },





--[[
  {
    type = "item",
    name = "__",
    icon = icons .. "__.png",
    subgroup = "timeshift-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,
    weight = 10*kg
  },
  {
    type = "recipe",
    name = "__",
    category = "nano_forge",
    energy_required = 1,
    ingredients = {
      {type = "item", name = "iron-plate", amount = 5},
    },
    results = {{type = "item", name = "__", amount = 1}},
    allow_productivity = true,
    enabled = false,
  },
]]

-- guided mutation
  {
    type = "recipe",
    name = "timeshift_guided_mutation",
    icon = icons .. "timeshift_guided_mutation.png",
    category = "cloning",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "hard-drive", amount = 1},
      {type = "item", name = "uranium-235", amount = 1},
      {type = "item", name = "bioflux", amount = 1},
      --TODO add DNA source
    },
    results = 
    {
      {type = "item", name = "datacell-dna-raw", amount = 1, probability = 1},
      --{type = "item", name = "hard-drive", amount = 1, probability = 0.99}
      {type = "item", name = "uranium-235", amount = 1, probability = 1},
      {type = "item", name = "mutated_embryo", amount = 1, probability = 0.05},
      {type = "item", name = "mutated_monster_egg", amount = 1, probability = 0.95},
    },
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "item",
    name = "mutated_embryo",
    icon = icons .. "mutated_embryo.png",
    subgroup = "timeshift-processes",
    order = "aaa",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 5 * minute,
    spoil_result = "spoilage",
    weight = 5*kg
  },
  {
    type = "item",
    name = "mutated_monster_egg",
    icon = icons .. "mutated_monster_egg.png",
    --subgroup = "timeshift-processes",
    --order = "aaa",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,
    weight = 5*kg,
    spoil_ticks = 15 * 60, -- 15s
    --spoil_result = "spoilage",
    spoil_to_trigger_result =
    {
      items_per_trigger = 1,
      trigger =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
            {
              type = "create-entity",
              entity_name = "big-wriggler-pentapod-premature",
              affects_target = true,
              show_in_tooltip = true,
              as_enemy = true,
              find_non_colliding_position = true,
              abort_if_over_space = true,
              offset_deviation = {{-5, -5}, {5, 5}},
              non_colliding_fail_result =
              {
                type = "direct",
                action_delivery =
                {
                  type = "instant",
                  source_effects =
                  {
                    {
                      type = "create-entity",
                      entity_name = "big-wriggler-pentapod-premature",
                      affects_target = true,
                      show_in_tooltip = false,
                      as_enemy = true,
                      offset_deviation = {{-1, -1}, {1, 1}},
                    }
                  }
                }
              }
            }
          }
        }
      }
    },
  },



--


  {
    type = "item",
    name = "viable_embryo",
    icon = icons .. "viable_embryo.png",
    subgroup = "timeshift-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,
    weight = 10*kg
  },


  {
    type = "recipe",
    name = "viable_embryo_recipe",
    icon = icons .. "viable_embryo_recipe.png",
    category = "simulation_chamber",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "mutated_embryo", amount = 1},
      --TODO add DNA source
    },
    results = 
    {
      {type = "item", name = "viable_embryo", amount = 1, probability = 0.01},
      {type = "item", name = "spoilage", amount = 1, probability = 1},
    },
    allow_productivity = false,
    enabled = false,
  },




-- data

  {
    type = "item",
    name = "datacell-dna-raw",
    icon = icons .. "datacell-dna-raw.png",
    subgroup = "timeshift-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "timeshift",
    random_tint_color = item_tints.iron_rust,
    weight = 10*kg
  },


  {
    type = "recipe",
    name = "datacell-dna-raw",
    icon = icons .. "datacell-dna-raw-recipe.png",
    category = "cloning",
    energy_required = 10,
    ingredients = {
      {type = "item", name = "hard-drive", amount = 1},
      --TODO add DNA source
    },
    results = 
    {
      {type = "item", name = "datacell-dna-raw", amount = 1, probability = 0.01},
      {type = "item", name = "hard-drive", amount = 1, probability = 0.99},
    },
    allow_productivity = true,
    enabled = false,
  },
})
