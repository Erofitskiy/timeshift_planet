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

require("__space-age__.prototypes.entity.beams")

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
    icon = icons .. "timeshift_energy_roots.png",
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
    collision_box = {{-3.2, -3.2}, {3.2, 3.2}},
    selection_box = {{-3.5, -3.5}, {3.5, 3.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      --[[pipe_picture = {
        north =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-N.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, 32),
          scale = 0.5
        },
        east =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-E.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(-32, 0),
          scale = 0.5
        },
        south =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-S.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, -32),
          scale = 0.5
        },
        west =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-W.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(32, 0),
          scale = 0.5
        }
      },]]
      --[[pipe_picture = {
        north =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-N.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, 64),
          scale = 0.5
        },
        east =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-E.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(-64, 0),
          scale = 0.5
        },
        south =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-S.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(0, -64),
          scale = 0.5
        },
        west =
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots-pipe-W.png",
          priority = "extra-high",
          width = 128,
          height = 128,
          shift = util.by_pixel(64, 0),
          scale = 0.5
        }
      },]]
      always_draw_covers = false,
      pipe_connections =
      {
        { flow_direction = "input", direction = defines.direction.north, position = {0, -3} },
        { flow_direction = "input", direction = defines.direction.east, position = {3, 0} },
        { flow_direction = "input", direction = defines.direction.south, position = {0, 3} },
        { flow_direction = "input", direction = defines.direction.west, position = {-3, 0} },
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
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_1_base.png",
          width = 704,
          height = 704,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_1_shadow.png",
          width = 704,
          height = 704,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_shadow = true,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_1_glow.png",
          width = 704,
          height = 704,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive",
        },
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_2_base.png",
          width = 704,
          height = 704,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_2_shadow.png",
          width = 704,
          height = 704,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_shadow = true,
        },
        {
          filename = entity .. "timeshift_energy_roots/timeshift_energy_roots_2_glow.png",
          width = 704,
          height = 704,
          repeat_count = 1,
          line_length = 1,
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive",
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

})


local function make_energy_roots_tesla_turret(num, seq)
  data:extend({
    {
      type = "electric-turret",
      name = "timeshift_energy_roots_tesla_turret_" .. num,
      icon = icons .. "timeshift_energy_roots_tesla_turret.png",
      localised_name = {"entity-name.timeshift_energy_roots_tesla_turret"},
      flags = {"placeable-player", "placeable-enemy"},
      max_health = 750,
      collision_box = {{-0.2, -0.2 }, {0.2, 0.2}},
      selection_box = {{-0.5, -0.5 }, {0.5, 0.5}},
      collision_mask = {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}},
      damaged_trigger_effect = hit_effects.entity(),
      start_attacking_only_when_can_shoot = true,
      rotation_speed = 0.001,
      preparing_speed = 0.7,
      folding_speed = 0.7,
      ending_attack_speed = 1 / (30 + 1),
      working_sound =
      {
        sound = {filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-base.ogg", volume = 0.3},
        use_doppler_shift = false,
        fade_in_ticks = 4,
        fade_out_ticks = 20,
      },
      corpse = "timeshift_energy_roots_tesla_turret_remnants_" .. num,
      dying_explosion = "laser-turret-explosion",
      energy_source = {type = "void"},
      folded_animation = emptyturretanim,
      glow_light_intensity = 0.5,
      random_animation_offset = true,
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
                  filename = entity .. "timeshift_energy_roots/cell_" .. num .. ".png",
                  size = 128,
                  frame_count = 1,
                  repeat_count = 30,
                  scale = 0.5,
                  animation_speed = 0.2,
                },
                {
                  filename = entity .. "timeshift_energy_roots/cell_glow.png",
                  size = 128,
                  frame_count = 8,
                  line_length = 8,
                  frame_sequence = seq,
                  scale = 0.5,
                  animation_speed = 0.2,
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
                      chain = "chain-energy_roots_tesla_turret-chain",
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
                      beam = "chain-energy_roots_tesla_turret-beam-start",
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



    {
      type = "corpse",
      name = "timeshift_energy_roots_tesla_turret_remnants_" .. num,
      icon = icons .. "timeshift_energy_roots_tesla_turret_remnants.png",
      localised_name = {"entity-name.timeshift_energy_roots_tesla_turret_remnants"},
      flags = {"placeable-neutral", "not-on-map"},
      hidden_in_factoriopedia = true,
      subgroup = "defensive-structure-remnants",
      order = "a-c-a",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 5, -- 5 minutes
      expires = false,
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = 
      {
        filename = entity .. "timeshift_energy_roots/cell_" .. num .. ".png",
        tint = {.6,.6,.6,.6},
        --filename = entity .. "timeshift_energy_roots/cell_" .. num .. "_remnants.png",
        size = 128,
        scale = 0.5,
      },
    },

  })
end

make_energy_roots_tesla_turret(1, {1,1,2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1})
make_energy_roots_tesla_turret(2, {2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1,1,1})
make_energy_roots_tesla_turret(3, {1,1,2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1})
make_energy_roots_tesla_turret(4, {2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1,1,1})
make_energy_roots_tesla_turret(5, {1,1,2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1})
make_energy_roots_tesla_turret(6, {2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1,1,1})
make_energy_roots_tesla_turret(7, {1,1,2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1})
make_energy_roots_tesla_turret(8, {2,1,1,1,1,1,4,1,1,1,1,3,1,1,7,1,1,1,6,1,1,1,1,5,1,1,8,1,1,1})






local function make_tesla_chain_lightning_chain(name, beam_name, max_jumps, jump_range, fork_chance, fork_chance_per_quality, beam_duration)
  return {
    name = name,
    type = "chain-active-trigger",
    max_jumps = max_jumps,
    max_range_per_jump = jump_range,
    jump_delay_ticks = 6,
    fork_chance = fork_chance,
    fork_chance_increase_per_quality_level = fork_chance_per_quality,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "beam",
        beam = beam_name,
        max_length = jump_range + 0.5,
        duration = beam_duration,
        add_to_shooter = false,
        destroy_with_source_or_target = false,
        source_offset = {0, 0}, -- should match beam's target_offset
      },
    },
  }
end

data:extend(
{
  make_tesla_chain_lightning_chain("chain-energy_roots_tesla_turret-chain", "chain-energy_roots_tesla_turret-beam-bounce", 4, 6, 0.03, 0.03, 4),
})


local function make_chain_tesla_beams(start_name, bounce_name, sound, damage)
  data:extend(
  {
    make_tesla_beam(start_name, sound, damage),
    make_tesla_beam_chain(bounce_name, sound, damage)
  })
end

make_chain_tesla_beams("chain-energy_roots_tesla_turret-beam-start", "chain-energy_roots_tesla_turret-beam-bounce", true, 10)
