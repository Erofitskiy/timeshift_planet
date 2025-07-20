require ("util")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
local simulations = require("__base__.prototypes.factoriopedia-simulations")

local hit_effects = require("__base__.prototypes.entity.hit-effects")

local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")


data:extend(
{
  {
    type = "item",
    name = "nano_forge",
    icon = icons .. "nano_forge.png",
    subgroup = "timeshift-production-machine",
    order = "a",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "nano_forge",
    stack_size = 10,
    default_import_location = planet_name,
    weight = 100 * kg
  },
  {
    type = "recipe",
    name = "nano_forge",
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "assembling-machine-3", amount = 1},
    },
    --surface_conditions = {{ property = "moshine-exclusive", min = 1, max = 1}},
    results = {{type = "item", name = "nano_forge", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },




{
  type = "assembling-machine",
  name = "nano_forge",
  icon = icons .. "nano_forge.png",
  flags = {"placeable-neutral","placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = "nano_forge"},
  fast_replaceable_group = "nano_forge",
  max_health = 300,
  corpse = "chemical-plant-remnants",
  dying_explosion = "chemical-plant-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["chemical-plant"],
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.4,
  module_slots = 3,
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},

  graphics_set =
  {
    animation = 
    {
      layers =
      {
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
      }
    },
    working_visualisations =
    {
      {
        apply_recipe_tint = "primary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
          frame_count = 24,
          line_length = 6,
          width = 66,
          height = 44,
          shift = util.by_pixel(23, 15),
          scale = 0.5
        },
      },
      {
        apply_recipe_tint = "secondary",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
          frame_count = 24,
          line_length = 6,
          width = 62,
          height = 42,
          shift = util.by_pixel(24, 15),
          scale = 0.5
        },
      },
      {
        apply_recipe_tint = "tertiary",
        fadeout = true,
        constant_speed = true,
        render_layer = "wires",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, -40),
          scale = 0.5
        }
      },
      {
        apply_recipe_tint = "quaternary",
        fadeout = true,
        constant_speed = true,
        render_layer = "wires",
        animation =
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -14),
          scale = 0.5
        }
      }
    }
  },
  impact_category = "metal-large",
  open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
  close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
  working_sound =
  {
    sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
    fade_in_ticks = 4,
    fade_out_ticks = 20
  },
  crafting_speed = 1,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 4 }
  },
  energy_usage = "210kW",
  crafting_categories = {"chemistry"},
  fluid_boxes =
  {
    {
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
    },
    {
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
    },
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
    },
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
    }
  },
  water_reflection =
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
  }
},



  {
    type = "assembling-machine",
    name = "nano_forge",
    icon = icons .. "nano_forge.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "nano_forge"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    fast_replaceable_group = "assembling-machine",
    graphics_set =
    {
      animation_progress = 0.5,
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        }
      }
    },

    crafting_categories = {"nano_forge"},
    crafting_speed = 1.25,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    energy_usage = "375kW",
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
  },
})