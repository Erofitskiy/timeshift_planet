local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

local seconds = 60
local minutes = 60 * seconds





data:extend({


--- subgroups
  {
    type = "item-subgroup",
    name = "panglia-processes",
    group = "intermediate-products",
    order = "pb"
  },
  {
    type = "item-subgroup",
    name = "panglia-production-machine",
    group = "production",
    order = "e3"
  },
  {
    type = "recipe-category",
    name = "simulation_chamber"
  },
  {
    type = "fuel-category",
    name = "panglia_branbalite"
  },
})




------------------------------------------------------
---------- BRANBALITE (cyan plant/slurry) ------------
------------------------------------------------------


local function branbalitepics(num)
  return 
  {
    layers =
    {
      {
        size = 64,
        filename = icons .. "panglia_branbalite_" .. num .. ".png",
        scale = 0.5,
      },
      {
        draw_as_light = true,
        blend_mode = "additive",
        size = 64,
        filename = icons .. "panglia_branbalite_light_" .. num .. ".png",
        scale = 0.5,
        tint = {0.3, 0.3, 0.3, 0.3}
      }
    }
  }
end

data:extend({
  {
    type = "item",
    name = "panglia_branbalite", -- is fruit AND seed
    icon = icons .. "panglia_branbalite_1.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    fuel_value = "1000GJ",
    fuel_category = "panglia_branbalite",
    plant_result = "panglia_branbalite_plant",
    place_result = "panglia_branbalite_plant",
    spoil_ticks = 25 * minute,
    spoil_result = "spoilage",
    weight = 10*kg,
    pictures =
    {
      branbalitepics(1),
      branbalitepics(2),
      branbalitepics(3),
      branbalitepics(4),
    },
  },
-- NUTRIENTS FLUID
  {
    type = "fluid",
    name = "panglia_branbalite_slurry",
    icon = icons .. "panglia_branbalite_slurry.png",
    subgroup = "panglia-processes",
    default_temperature = 15,
    max_temperature = 165,
    heat_capacity = "0.2kJ",
    base_color = {0.4, 0.4, 0.4},
    flow_color = {0.4, 0.4, 0.4},
    order = "a[fluid]-a[water]-c[panglia_branbalite_slurry]",
    gas_temperature = 15,
    auto_barrel = true,
    fuel_value = "3MJ",
    --fuel_category = "panglia_branbalite",
  },
  {
    type = "recipe",
    name = "panglia_branbalite_slurry",
    category = "organic-or-chemistry",
    energy_required = 1,
    ingredients = {
      --{type = "item", name = "nutrients", amount = 7},
      --{type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "panglia_branbalite", amount = 1},
      {type = "fluid", name = "water", amount = 30},
    },
    results = {{type = "fluid", name = "panglia_branbalite_slurry", amount = 40}},
    subgroup = "panglia-processes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_productivity = true,
    enabled = false,
    allow_decomposition = false
  },
  {
    type = "recipe",
    name = "panglia_branbalite_slurry_to_crudeoil",
    icon = icons .. "panglia_branbalite_slurry_to_crudeoil.png",
    category = "oil-processing",
    enabled = false,
    energy_required = 15,
    ingredients =
    {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 65},
      {type = "fluid", name = "steam", amount = 35}
    },
    results =
    {
      {type = "fluid", name = "crude-oil", amount = 90},
      {type = "fluid", name = "water", amount = 10}
    },
    allow_productivity = true,
    subgroup = "panglia-processes",
    order = "a[oil-processing]-c[coal-liquefaction]",
    allow_decomposition = false
  },



})



data:extend({


-- NANOBOTS
--[[
  {
    type = "fluid",
    name = "nanobots_hive",
    icon = icons .. "nanobots_hive.png",
    subgroup = "panglia-processes",
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
]]




--[[ TEMPLATE
  {
    type = "item",
    name = "__",
    icon = icons .. "__.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
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
    type = "item",
    name = "mutated_monster_egg",
    icon = icons .. "mutated_monster_egg.png",
    --subgroup = "panglia-processes",
    --order = "aaa",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
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








-- data

  {
    type = "item",
    name = "datacell-dna-raw",
    icon = icons .. "datacell-dna-raw.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    plant_result = "processing-grid-process-dna",
    weight = 10*kg,
  },
  {
    type = "recipe",
    name = "datacell-dna-raw",
    icon = icons .. "datacell-dna-raw-recipe.png",
    subgroup = "panglia-processes",
    order = "aaa",
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
  {
    type = "item",
    name = "datacell-dna-sequenced",
    icon = icons .. "datacell-dna-sequenced.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    weight = 10*kg
  },



  {
    type = "plant",
    name = "processing-grid-process-dna",
    icon = icons .. "processing-grid-process-dna.png",
    flags = {"placeable-neutral"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.2,
      results = {{type = "item", name = "datacell-dna-sequenced", amount = 1}},
      mining_trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              target_effects = {
                {
                  type = "play-sound",
                  sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9),
                  damage_type_filters = "fire"
                }
              }
            }
          }
        }
      }
    },
    mining_sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9), --sound_variations("__space-age__/sound/mining/axe-mining-yumako-tree", 5, 0.6),
    mined_sound = sound_variations("__Moshine__/sound/entity/agricultural-tower/cervo", 13, 0.9), --sound_variations("__space-age__/sound/mining/mined-yumako-tree", 6, 0.3),
    growth_ticks = 10 * minutes,
    max_health = 50,
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-1, -1}, {1, 1}},
    sticker_box = {{-1, -1}, {1, 1}},
    drawing_box_vertical_extension = 0.8,
    impact_category = "tree",
    autoplace =
    {
      probability_expression = 0,
      tile_restriction = {"processing-tile"},
    },
    tile_buildability_rules = {
      {
        area = {{-0.5, -0.5}, {0.5, 0.5}},
        required_tiles = {layers = {ground_tile = true}},
      }
    },
    stateless_visualisation_variations =
    {
      {
        animation = {
          sheets = {
            {
              variation_count = 1,
              filenames = {"__Moshine__/graphics/entity/quantum-computer/plant.png"},
              size = 128,
              lines_per_file = 25,
              frame_count = 100,
              animation_speed = 0.15,
              scale = 0.5,
              draw_as_glow = true,
              frame_sequence = { 1, 2, 3, 1, 4, 5, 6, 1, 7, 8, 9, 10, 10, 11, 12, 1, 1, 13, 14, 15, 15, 13, 16, 17, 1, 18, 1, 19, 19, 20, 21, 22, 1, 22, 23, 1, 24, 25, 1, 12, 5, 6, 1, 15, 11, 7, 1, 8, 5, 4 ,
                1, 1, 3, 1, 11, 5, 6, 1, 22, 8, 9, 1, 10, 1, 12, 1, 1, 3, 4, 1, 1, 13, 16, 17, 1, 16, 1, 1, 1, 1, 1, 22, 1, 22, 7, 1, 24, 6, 1, 1, 1, 1, 1, 1, 7, 7, 1, 11, 5, 1
              }
            },
          }
        }
      }
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__Moshine__/graphics/empty.png",
          width = 1,
          height = 1,
        }
      }
    },
    map_color = {255, 255, 255},
  },

  {
    type = "item",
    name = "panglia_panglite",
    icon = icons .. "panglia_panglite-1.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.metal_barrel_inventory_move,
    pick_sound = item_sounds.metal_barrel_inventory_pickup,
    drop_sound = item_sounds.metal_barrel_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = { 1.0, 0.83, 0.7, 1.0 },
    weight = 20*kg,
    pictures =
    {
      {size = 64, filename = icons .. "panglia_panglite-1.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-2.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-3.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-4.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-5.png", scale = 0.5},
      {size = 64, filename = icons .. "panglia_panglite-6.png", scale = 0.5},
    },
  },

  {
    type = "recipe",
    name = "panglia_panglite_multiplication",
    icon = icons .. "panglia_panglite_multiplication.png",
    category = "smelting",
    enabled = false,
    auto_recycle = false,
    energy_required = 28,
    ingredients = {{type = "item", name = "panglia_panglite", amount = 1}},
    results = {{type="item", name="panglia_panglite", amount = 2}},
    allow_productivity = false,
    show_amount_in_title = false,
  },



  {
    type = "recipe",
    name = "panglia_panglite_fiber",
    icon = icons .. "panglia_panglite_fiber.png",
    category = "chemistry",
    enabled = false,
    auto_recycle = false,
    energy_required = 50,
    ingredients = {
      {type = "item", name = "panglia_panglite", amount = 6},
      {type = "fluid", name = "sulfuric-acid", amount = 40},
    },
    results = {{type="item", name="panglia_panglite_fiber", amount = 1}},
    allow_productivity = false,
    show_amount_in_title = false,
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.995, b = 0.089, a = 1.000}, -- #fffd16ff
      secondary = {r = 1.000, g = 0.974, b = 0.691, a = 1.000}, -- #fff8b0ff
      tertiary = {r = 0.723, g = 0.638, b = 0.714, a = 1.000}, -- #b8a2b6ff
      quaternary = {r = 0.954, g = 1.000, b = 0.350, a = 1.000}, -- #f3ff59ff
    }
  },

  {
    type = "item",
    name = "panglia_panglite_fiber",
    icon = icons .. "panglia_panglite_fiber.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = { 1.0, 0.83, 0.7, 1.0 },
    weight = 20*kg,
  },


  {
    type = "recipe",
    name = "panglia_universe_precursor",
    energy_required = 40,
    category = "chemistry",
    ingredients =
    {
      {type = "fluid", name = "panglia_branbalite_slurry", amount = 40},
      {type = "item", name = "panglia_panglite_fiber", amount = 2},
    },
    results = {{type = "item", name = "universe_precursor", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },


  {
    type = "recipe",
    name = "panglia_low_density_structure_from_panglite_fiber",
    energy_required = 60,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "panglia_panglite_fiber", amount = 1},
    },
    results = {{type = "item", name = "low-density-structure", amount = 2}},
    allow_productivity = true,
    enabled = false,
    show_amount_in_title = false,
  },



  -- Brains


  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_0_recipe",
    icon = icons .. "panglia_cloned_specimen_body_0_recipe.png",
    subgroup = "panglia-processes",
    order = "aaa",
    category = "cloning",
    energy_required = 600,
    ingredients = {
      --{type = "item", name = "hard-drive", amount = 1},
      {type = "item", name = "uranium-235", amount = 1},
      {type = "item", name = "bioflux", amount = 1},
      {type = "item", name = "datacell-dna-sequenced", amount = 1}
      --TODO add DNA source
    },
    results = 
    {
      {type = "item", name = "datacell-dna-raw", amount = 1, probability = 1},
      --{type = "item", name = "hard-drive", amount = 1, probability = 0.99}
      {type = "item", name = "uranium-235", amount = 1, probability = 1},
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 1, probability = 0.05},
      {type = "item", name = "mutated_monster_egg", amount = 1, probability = 0.95},
    },
    allow_productivity = false,
    enabled = false,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_0",
    icon = icons .. "panglia_cloned_specimen_body_0.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 50,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    weight = 15*kg
  },




  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_1_recipe",
    icon = icons .. "panglia_cloned_specimen_body_1_recipe.png",
    subgroup = "panglia-processes",
    order = "aaa",
    category = "simulation_chamber",
    energy_required = 600,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_0", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1, probability = 0.1},
      {type = "item", name = "spoilage", amount = 2, probability = 1},
    },
    allow_productivity = false,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 1, g = 1, b = 1, a = 1}, -- #ffa342ff
      secondary = {r = 0, g = 0, b = 0, a = 0}, -- #ffb85fff
      tertiary = {r = 0, g = 0, b = 0, a = 0}, -- #d9a892ff
      quaternary = {r = 0, g = 0, b = 0, a = 0}, -- #ff7e45ff
    },
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_1",
    icon = icons .. "panglia_cloned_specimen_body_1.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 1 * minute,
    spoil_result = "spoilage",
    weight = 15*kg
  },


  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_2_recipe",
    icon = icons .. "panglia_cloned_specimen_body_2_recipe.png",
    category = "simulation_chamber",
    energy_required = 600,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_1", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1, probability = 0.5},
      {type = "item", name = "spoilage", amount = 1, probability = 0.5},
    },
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0, g = 0, b = 0, a = 0},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 1, g = 1, b = 1, a = 1},
      quaternary = {r = 0, g = 0, b = 0, a = 0},
    },
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_2",
    icon = icons .. "panglia_cloned_specimen_body_2.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 10*kg,
  },

  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_3_recipe",
    icon = icons .. "panglia_cloned_specimen_body_3_recipe.png",
    category = "simulation_chamber",
    energy_required = 600,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_2", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_3_genius", amount = 1, probability = 0.1},
      {type = "item", name = "panglia_cloned_specimen_body_3_dumb", amount = 1, probability = 0.9},
    },
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0, g = 0, b = 0, a = 0},
      secondary = {r = 0, g = 0, b = 0, a = 0},
      tertiary = {r = 0, g = 0, b = 0, a = 0},
      quaternary = {r = 1, g = 1, b = 1, a = 1},
    },
  },

  {
    type = "item",
    name = "panglia_cloned_specimen_body_3_genius",
    icon = icons .. "panglia_cloned_specimen_body_3_genius.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 10*kg,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_3_dumb",
    icon = icons .. "panglia_cloned_specimen_body_3_dumb.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 10*kg,
  },
  --[[
  {
    type = "item",
    name = "panglia_cloned_specimen_body_3",
    icon = icons .. "panglia_cloned_specimen_body_3.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 10*kg,
  },

  {
    type = "recipe",
    name = "panglia_cloned_specimen_body_4_recipe",
    icon = icons .. "panglia_cloned_specimen_body_4_recipe.png",
    category = "simulation_chamber",
    energy_required = 60,
    ingredients = {
      {type = "item", name = "panglia_cloned_specimen_body_3", amount = 1},
    },
    results = 
    {
      {type = "item", name = "panglia_cloned_specimen_body_4_genius", amount = 1, probability = 0.1},
      {type = "item", name = "panglia_cloned_specimen_body_4_dumb", amount = 1, probability = 0.9},
    },
    allow_productivity = true,
    enabled = false,
    crafting_machine_tint = {
      primary = {r = 0, g = 0, b = 0, a = 0}, -- #ffa342ff
      secondary = {r = 0, g = 0, b = 0, a = 0}, -- #ffb85fff
      tertiary = {r = 0, g = 0, b = 0, a = 0}, -- #d9a892ff
      quaternary = {r = 1, g = 1, b = 1, a = 1}, -- #ff7e45ff
    },
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_4_genius",
    icon = icons .. "panglia_cloned_specimen_body_4_genius.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 10*kg,
  },
  {
    type = "item",
    name = "panglia_cloned_specimen_body_4_dumb",
    icon = icons .. "panglia_cloned_specimen_body_4_dumb.png",
    subgroup = "panglia-processes",
    order = "aaa",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 1,
    default_import_location = "panglia",
    random_tint_color = item_tints.iron_rust,
    spoil_ticks = 2 * minutes,
    spoil_result = "spoilage",
    weight = 10*kg,
  },]]


})
