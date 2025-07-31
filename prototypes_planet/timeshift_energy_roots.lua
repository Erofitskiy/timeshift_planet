local resource_autoplace = require("resource-autoplace")
require ("__base__.prototypes.entity.pipecovers")
require ("circuit-connector-sprites")
require ("__base__.prototypes.entity.assemblerpipes")
require ("__base__.prototypes.entity.laser-sounds")
require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.spawner-animation")
require ("__base__.prototypes.entity.character-animations")
require ("__base__.prototypes.entity.entity-util")
require ("__base__.prototypes.entity.spidertron-animations")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
local procession_audio_catalogue_types = require("__base__/prototypes/planet/procession-audio-catalogue-types")


require ("__base__.prototypes.entity.enemy-constants")
require ("__base__.prototypes.entity.biter-animations")
require ("__base__.prototypes.entity.spitter-animations")
require ("__base__.prototypes.entity.spawner-animation")

local biter_ai_settings = require ("__base__.prototypes.entity.biter-ai-settings")
local enemy_autoplace = require ("__base__.prototypes.entity.enemy-autoplace-utils")
local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local simulations = require("__base__.prototypes.factoriopedia-simulations")


require("circuit-connector-sprites")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")

local util = require('util')

local rocket_turret_shift = -20
local tesla_turret_shift = -26

local emptyturretanim = {
  filename = "__core__/graphics/empty.png",
  size = 1,
  priority = "very-low",
  direction_count = 4,
  frame_count = 1,
  line_length = 1,
  run_mode = "forward",
}



data:extend({
  {
    type = "generator",
    name = "timeshift_energy_roots",
    icon = "__base__/graphics/icons/steam-engine.png",
    flags = {"placeable-neutral","player-creation"},
    --minable = {mining_time = 0.3, result = "steam-engine"},
    max_health = 400000,
    corpse = "steam-engine-remnants",
    dying_explosion = "steam-engine-explosion",
    --alert_icon_shift = util.by_pixel(0, -12),
    --alert_icon_scale = 0,
    effectivity = 1,
    fluid_usage_per_tick = 0.5,
    allow_copy_paste = false,
    burns_fluid = true,

    maximum_temperature = 165,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    --fast_replaceable_group = "steam-engine",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.north, position = {0, -1} },
        { flow_direction = "input-output", direction = defines.direction.east, position = {1, 0} },
        { flow_direction = "input-output", direction = defines.direction.south, position = {0, 1} },
        { flow_direction = "input-output", direction = defines.direction.west, position = {-1, 0} },
      },
      production_type = "input",
      filter = "timeshift_nutrients_slurry",
      minimum_temperature = 0,
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_base.png",
          width = 320,
          height = 320,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_shadow.png",
          width = 320,
          height = 320,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_shadow = true,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_glow.png",
          width = 320,
          height = 320,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_glow = true,
        },
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_base.png",
          width = 320,
          height = 320,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_shadow.png",
          width = 320,
          height = 320,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_shadow = true,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_glow.png",
          width = 320,
          height = 320,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_glow = true,
        },
      }
    },
    --[[
    smoke =
    {
      {
        name = "light-smoke",
        north_position = {0.9, 0.0},
        east_position = {-2.0, -2.0},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        starting_frame_deviation = 60
      }
    },]]
    impact_category = "metal-large",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-engine-90bpm.ogg",
        volume = 0.55,
        speed_smoothing_window_size = 60,
        modifiers = volume_multiplier("tips-and-tricks", 1.1),
        audible_distance_modifier = 0.8,
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "timeshift_energy_roots",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      base_density = 1,
      base_spots_per_km2 = 18,
      random_probability = 1/24,
      random_spot_size_minimum = 0.01,
      random_spot_size_maximum = 0.01,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1
    },
    map_color = {1, 1, 0},
  },


  {
    type = "electric-turret",
    name = "timeshift_energy_roots_tesla_turret",
    icon = icons .. "timeshift_energy_roots_tesla_turret.png",
    flags = {"placeable-player", "placeable-enemy"},
    --minable = {mining_time = 0.5, result = "tesla-turret"},
    --fast_replaceable_group = "tesla-turret",
    max_health = 750,
    collision_box = {{-0.2, -0.2 }, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5 }, {0.5, 0.5}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.entity(),
    start_attacking_only_when_can_shoot = true,
    rotation_speed = 0.001,
    preparing_speed = 0.7,
    folding_speed = 0.7,
    ending_attack_speed = 1 / (30 + 1), -- Must be clocked to the beam duration so the face light turns off at the right time
    --circuit_connector = circuit_connector_definitions["tesla-turret"], -- TODO: generate points for tesla-turret
    --circuit_wire_max_distance = default_circuit_wire_max_distance,
    --open_sound = sounds.turret_open,
    --close_sound = sounds.turret_close,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-base.ogg", volume = 0.3},
      use_doppler_shift = false,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    --preparing_sound = space_age_sounds.tesla_turret_activate,
    --folding_sound = space_age_sounds.tesla_turret_deactivate,
    --rotating_sound = space_age_sounds.tesla_turret_rotate,
    corpse = "tesla-turret-remnants",
    dying_explosion = "laser-turret-explosion",
    energy_source =
    {
      type = "void",
    },
    folded_animation = emptyturretanim,
    --preparing_animation = tesla_turret_rising({}),
    --prepared_animation = tesla_turret_ready({}),
    --ending_attack_animation = tesla_turret_cooldown({}),
    --folding_animation = tesla_turret_rising({run_mode = "backward"}),
    --energy_glow_animation = laser_turret_shooting_glow(),
    --resource_indicator_animation = tesla_turret_LED(),
    glow_light_intensity = 0.5, -- defaults to 0
    graphics_set =
    {
      base_visualisation =
      {
        {
          animation =
          {
            layers =
            {
              {
                filename = entity .. "timeshift_energy_roots/cell-1.png",
                size = 128,
                frame_count = 1,
                repeat_count = 30,
                scale = 0.5,
                animation_speed = 0.5,
              },
              {
                filename = entity .. "timeshift_energy_roots/cell-1-glow.png",
                size = 128,
                frame_count = 1,
                repeat_count = 30,
                scale = 0.5,
                animation_speed = 0.5,
                draw_as_glow = true,
                blend_mode = "additive",
              },
            }
          }
        },
      }
    },

    resistances =
    {
      {type = "electric", percent = 100},
      {type = "laser", percent = 99},
      {type = "acid", percent = 90},
      {type = "physical", percent = 10},
      {type = "impact", percent = 10},
      {type = "explosion", percent = 10},
      {type = "fire", percent = 0},
    },
    attack_parameters =
    {
      type = "beam",
      cooldown = 120,
      range = 10, --30
      range_mode = "center-to-bounding-box",
      fire_penalty = 0.9,
      source_direction_count = 64,
      source_offset = {0, 0}, -- {0, -0.55},
      ammo_category = "tesla",
      ammo_type =
      {
        energy_consumption = "0J",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              -- Chain effect must go first in case the beam kills the target
              {
                type = "nested-result",
                action =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "chain",
                    chain = "chain-tesla-turret-chain",
                  }
                }
              },
              {
                type = "nested-result",
                action =
                {
                  type = "direct",
                  action_delivery =
                  {
                    type = "beam",
                    beam = "chain-tesla-turret-beam-start",
                    max_length = 10, --40
                    duration = 10, --30
                    add_to_shooter = false,
                    destroy_with_source_or_target = false,
                    source_offset = {0, 0}, --{0, -2.6}
                  }
                }
              }
            }
          }
        }
      }
    },
    call_for_help_radius = 10,
  },



})