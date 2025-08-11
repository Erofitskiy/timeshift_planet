require ("util")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local hit_effects = require("__base__.prototypes.entity.hit-effects")

local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local ent_size = 6

data:extend(
{
  {
    type = "item",
    name = "simulation_chamber",
    icon = icons .. "simulation_chamber.png",
    subgroup = "timeshift-production-machine",
    order = "d[simulation_chamber]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "simulation_chamber",
    stack_size = 10,
    default_import_location = planet_name,
    weight = 100 * kg
  },
  {
    type = "recipe",
    name = "simulation_chamber",
    energy_required = 1,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "data-processor", amount = 1},
      {type = "item", name = "ai-tier-10", amount = 1},
      {type = "item", name = "cloning-vat", amount = 1},
      {type = "fluid", name = "timeshift_branbalite_slurry", amount = 120},
      -- TOADD core 10
    },
    --surface_conditions = {{ property = "moshine-exclusive", min = 1, max = 1}},
    results = {{type = "item", name = "simulation_chamber", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },




{
  type = "furnace",
  name = "simulation_chamber",
  cant_insert_at_source_message_key = "inventory-restriction.cant-be-simulated",
  icon = icons .. "simulation_chamber.png",
  flags = {"placeable-neutral","placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = "simulation_chamber"},
  fast_replaceable_group = "simulation_chamber",
  max_health = 300,
  corpse = "chemical-plant-remnants",
  dying_explosion = "chemical-plant-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["chemical-plant"],
  collision_box = {{-(ent_size/2 -0.3), -(ent_size/2 -0.3)}, {(ent_size/2 -0.3), (ent_size/2 -0.3)}},
  selection_box = {{-ent_size/2, -ent_size/2}, {ent_size/2, ent_size/2}},
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.4,
  --module_slots = 3,
  allowed_effects = {"speed", "pollution", "quality"},
  source_inventory_size = 1,
  result_inventory_size = 6,
  crafting_speed = 0.1,

  graphics_set =
  {
    animation = 
    {
      layers =
      {
        {
          filename = entity .. "simulation_chamber/simulation_chamber_base.png",
          width = 512,
          height = 512,
          --frame_count = 1,
          --line_length = 1,
          --shift = util.by_pixel(0.5, -9),
          scale = 0.5,
        },
        {
          filename = entity .. "simulation_chamber/simulation_chamber_shadow.png",
          width = 512,
          height = 512,
          --frame_count = 1,
          --line_length = 1,
          --shift = util.by_pixel(0.5, -9),
          scale = 0.5,
          draw_as_shadow = true,
        },
        --[[
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
          width = 312,
          height = 222,
          repeat_count = 24,
          shift = util.by_pixel(27, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
        ]]
      }
    },
    working_visualisations =
    {
      {
        animation =
        {
          filename = entity .. "simulation_chamber/simulation_chamber_screen_anim.png",
          width = 64,
          height = 64,
          frame_count = 255, -- max is 255
          line_length = 32,
          animation_speed = 1,
          shift = util.by_pixel_hr(-128, -112),
          scale = 0.5,
          draw_as_glow = true,
        },
      },
      {
        animation =
        {
          filename = entity .. "simulation_chamber/simulation_chamber_glow.png",
          width = 512,
          height = 512,
          --frame_count = 255, -- max is 255
          --line_length = 32,
          --animation_speed = 0.04,
          --shift = util.by_pixel_hr(-128, -112),
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive",
        },
      },
      {
        apply_recipe_tint = "primary",
        animation =
        {
          filename = entity .. "simulation_chamber/layer1.png",
          width = 512,
          height = 512,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "secondary",
        animation =
        {
          filename = entity .. "simulation_chamber/layer2.png",
          width = 512,
          height = 512,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "tertiary",
        animation =
        {
          filename = entity .. "simulation_chamber/layer3.png",
          width = 512,
          height = 512,
          scale = 0.5,
        },
      },
      {
        apply_recipe_tint = "quaternary",
        animation =
        {
          filename = entity .. "simulation_chamber/layer4.png",
          width = 512,
          height = 512,
          scale = 0.5,
        },
      },
    }
  },
  impact_category = "metal-large",
  open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
  close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
  working_sound =
  {
    sound = {
      filename = tssounds .. "simulation_chamber_working_sound.ogg",
      volume = 0.7,
    },
    fade_in_ticks = 10,
    fade_out_ticks = 40,
    max_sounds_per_prototype = 4,
    idle_sound = {
      filename = tssounds .. "simulation_chamber_working_sound_idle.ogg",
      volume = 0.7,
    },
  },
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 4 }
  },
  energy_usage = "210kW",
  crafting_categories = {"simulation_chamber"},
  fluid_boxes =
  {
    --[[{
      production_type = "input",
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections =
      {
        {
          flow_direction="input",
          direction = defines.direction.north,
          position = {-1, -1}
        }
      }
    },]]
    --[[{
      production_type = "input",
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections =
      {
        {
          flow_direction="input",
          direction = defines.direction.north,
          position = {1, -1}
        }
      }
    },]]
    --[[
    {
      production_type = "output",
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        {
          flow_direction = "output",
          direction = defines.direction.south,
          position = {-1, 1}
        }
      }
    },]]
    --[[
    {
      production_type = "output",
      pipe_covers = pipecoverspictures(),
      volume = 100,
      pipe_connections =
      {
        {
          flow_direction = "output",
          direction = defines.direction.south,
          position = {1, 1}
        }
      }
    }]]
  },
  --[[water_reflection =
  {
    pictures =
    {
      filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
      priority = "extra-high",
      width = 28,
      height = 36,
      shift = util.by_pixel(5, 60),
      variation_count = 4,
      scale = 5
    },
    rotate = false,
    orientation_to_variation = true
  }]]
},
})