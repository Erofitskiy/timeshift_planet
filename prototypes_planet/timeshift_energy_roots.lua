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


function tesla_turret_rising(inputs)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising",
      {
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5,
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising-mask",
      {
        flags = {"mask"},
        apply_runtime_tint = true,
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel( 0, 0+tesla_turret_shift),
        scale = 0.5,
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising-emit",
      {
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive",
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-rising-shadow",
      {
        draw_as_shadow = true,
        priority = "medium",
        direction_count = 4,
        shift = util.by_pixel(96,0+tesla_turret_shift),
        scale = 0.5,
        frame_count = 16,
        line_length = 16,
        run_mode = inputs.run_mode or "forward",
      }),
    }
  }
  end


function tesla_turret_ready(inputs)
  return
  {
    layers =
    {
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking",
      {
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-mask",
      {
        flags = {"mask"},
        apply_runtime_tint = true,
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel( 0, 0+tesla_turret_shift),
        scale = 0.5
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-emit",
      {
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel(0,0+tesla_turret_shift),
        scale = 0.5,
        draw_as_glow = true,
        blend_mode = "additive"
      }),
      util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-shadow",
      {
        draw_as_shadow = true,
        direction_count = 64,
        frame_count = 1,
        repeat_count = 30,
        shift = util.by_pixel(96,0+tesla_turret_shift),
        scale = 0.5
      }),
    }
  }
  end

  function tesla_turret_cooldown(inputs)
    return
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking",
        {
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-mask",
        {
          flags = {"mask"},
          apply_runtime_tint = true,
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel( 0, 0+tesla_turret_shift),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-emit",
        {
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive"
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-facelight",
        {
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5,
          draw_as_glow = true,
          blend_mode = "additive"
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-head-attacking-shadow",
        {
          draw_as_shadow = true,
          direction_count = 64,
          frame_count = 1,
          repeat_count = 30,
          shift = util.by_pixel(96,0+tesla_turret_shift),
          scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-active",
        {
          direction_count = 1,
          duplicate_first_direction = true,
          frame_count = 30,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          scale = 0.5,
          animation_speed = 0.5,
          draw_as_glow = true,
          blend_mode = "additive"
        }),
      }
    }
    end

  function tesla_turret_LED(inputs)
    return
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-LED",
        {
          direction_count = 1,
          duplicate_first_direction = true,
          shift = util.by_pixel(0,0+tesla_turret_shift),
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
          frame_count = 5
        }),
      }
    }
  end





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

    --[[max_power_output = "1GW",
    burner =
    {
      type = "burner",
      fuel_categories = {"timeshift_nutrients"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { timeshift_energy_roots_pollution = 1000000000000 },
      smoke =
      {
        {
          name = "smoke",
          north_position = {0.9, 0.0},
          east_position = {-2.0, -2.0},
          deviation = {0.1, 0.1},
          frequency = 9
        }
      }
    },]]
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output",
      --emissions_per_minute = { timeshift_energy_roots_pollution = 1000000 },
      --render_no_network_icon = false,
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H.png",
          width = 352,
          height = 257,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(1, -4.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-H-shadow.png",
          width = 508,
          height = 160,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(48, 24),
          scale = 0.5
        }
      }
    },
    vertical_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V.png",
          width = 225,
          height = 391,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(4.75, -6.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-engine/steam-engine-V-shadow.png",
          width = 330,
          height = 307,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(40.5, 9.25),
          scale = 0.5
        }
      }
    },
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
    },
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
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/steam-engine/steam-engine-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 44,
        shift = util.by_pixel(0, 55),
        variation_count = 2,
        repeat_count = 2,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    autoplace = resource_autoplace.resource_autoplace_settings{
      name = "timeshift_energy_roots",
      order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
      base_density = 1,
      base_spots_per_km2 = 18,
      random_probability = 1/24,
      random_spot_size_minimum = 0.01,
      random_spot_size_maximum = 0.01, -- don't randomize spot size
      --additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1
    },
    map_color = {1, 1, 0},
    --hidden = true,
  },





--[[

  {
    type = "unit-spawner",
    name = "timeshift_energy_roots_hidden_spawner",
    icon = "__base__/graphics/icons/spitter-spawner.png",
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "not-rotatable", "placeable-off-grid", "not-deconstructable", "not-blueprintable"},
    max_health = 350,
    order="b-d-b",
    subgroup="enemies",
    working_sound =
    {
      sound = {category = "enemy", filename = "__base__/sound/creatures/spawner-spitter.ogg", volume = 0.6, modifiers = volume_multiplier("main-menu", 0.7) },
      max_sounds_per_prototype = 3
    },
    dying_sound =
    {
      variations = sound_variations("__base__/sound/creatures/spawner-death", 5, 0.7, volume_multiplier("main-menu", 1.21) ),
      aggregation = { max_count = 2, remove = true, count_already_playing = true }
    },
    impact_category = "organic",
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "explosion",
        decrease = 5
      },
      {
        type = "fire",
        decrease = 3,
        percent = 60
      }
    },
    --healing_per_tick = 0.02,
    collision_box = {{0, 0}, {0, 0}},
    map_generator_bounding_box = {{0, 0}, {0, 0}},
    collision_mask = { layers = {} },
    selection_box = {{-2.5, -0.5}, {2.5, 0.5}},
    damaged_trigger_effect = hit_effects.biter(),
    absorptions_per_second = { timeshift_energy_roots_pollution = { absolute = 0.1, proportional = 0.01 } },
    corpse = "spitter-spawner-corpse",
    dying_explosion = "spitter-spawner-die",
    max_count_of_owned_units = 400,
    max_friends_around_to_spawn = 0,
    graphics_set =
    {
      animations =
      {
        spawner_idle_animation(0, spitter_spawner_tint),
        spawner_idle_animation(1, spitter_spawner_tint),
        spawner_idle_animation(2, spitter_spawner_tint),
        spawner_idle_animation(3, spitter_spawner_tint)
      },
    },
    result_units =
    {
      --{"small-biter", {{0.0, 0.3}, {0.35, 0}}},
      {"timeshift_energy_roots_cancer_cell", {{0.0, 0.3}, {0.35, 0}}},
    },
    -- With zero evolution the spawn rate is 6 seconds, with max evolution it is 2.5 seconds
    spawning_cooldown = {360, 150},
    spawning_radius = 10,
    spawning_spacing = 1,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
    -- distance_factor used to be 1, but Twinsen says:
    -- "The number or spitter spwners should be roughly equal to the number of biter spawners(regardless of difficulty)."
    -- (2018-12-07)
    --autoplace = enemy_autoplace.enemy_spawner_autoplace("enemy_autoplace_base(0, 7)"),
    call_for_help_radius = 50,
    --time_to_capture = 60 * 30,
    --is_military_target = false,
    --spawn_decorations_on_expansion = true,
    spawn_decoration =
    {
      {
        decorative = "light-mud-decal",
        spawn_min = 0,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 5
      },
      {
        decorative = "dark-mud-decal",
        spawn_min = 0,
        spawn_max = 3,
        spawn_min_radius = 2,
        spawn_max_radius = 6
      },
      {
        decorative = "enemy-decal",
        spawn_min = 3,
        spawn_max = 5,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      },
      {
        decorative = "enemy-decal-transparent",
        spawn_min = 4,
        spawn_max = 20,
        spawn_min_radius = 2,
        spawn_max_radius = 14,
        radius_curve = 0.9
      },
      {
        decorative = "muddy-stump",
        spawn_min = 2,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-croton",
        spawn_min = 2,
        spawn_max = 8,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "red-pita",
        spawn_min = 1,
        spawn_max = 5,
        spawn_min_radius = 3,
        spawn_max_radius = 6
      },
      {
        decorative = "lichen-decal",
        spawn_min = 1,
        spawn_max = 2,
        spawn_min_radius = 2,
        spawn_max_radius = 7
      }
    }
  },

  {
    type = "unit",
    name = "timeshift_energy_roots_cancer_cell",
    icon = "__base__/graphics/icons/medium-spitter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "breaths-air", "not-repairable"},
    max_health = 500,
    order = "b-b-b",
    subgroup = "enemies",
    factoriopedia_simulation = simulations.factoriopedia_medium_spitter,
    impact_category = "organic",
    resistances =
    {
      {
        type = "explosion",
        percent = 10
      }
    },
    healing_per_tick = 0.01,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.7}, {0.5, 0.7}},
    damaged_trigger_effect = hit_effects.biter(),
    sticker_box = {{-0.3, -0.5}, {0.3, 0.1}},
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    alternative_attacking_frame_sequence = spitter_alternative_attacking_animation_sequence,
    attack_parameters = spitter_mid_attack_parameters(
    {
      acid_stream_name = "acid-stream-spitter-medium",
      range = range_spitter_medium,
      min_attack_distance = 0,
      cooldown = 100,
      cooldown_deviation = 0.15,
      damage_modifier = damage_modifier_spitter_medium,
      scale = scale_spitter_medium,
      tint1 = tint_1_spitter_medium,
      tint2 = tint_2_spitter_medium,
      roarvolume = 0.5,
      range_mode = "bounding-box-to-bounding-box"
    }),
    vision_distance = 30,
    movement_speed = 0.01,
    rotation_speed = 1,
    distance_per_frame = 0.055,
    -- in pu
    --absorptions_to_join_attack = { pollution = 0 },
    corpse = "medium-spitter-corpse",
    dying_explosion = "medium-spitter-die",
    working_sound = sounds.spitter_calls_med(0.2, 0.53),
    dying_sound = sounds.spitter_dying_mid(0.65),
    run_animation = spitterrunanimation(scale_spitter_medium, tint_1_spitter_medium, tint_2_spitter_medium),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.spitter_walk(0.1, 0.4),
    ai_settings = biter_ai_settings,
    water_reflection = spitter_water_reflection(scale_spitter_medium)
  },

]]


  {
    type = "airborne-pollutant",
    name = "timeshift_energy_roots_pollution",
    chart_color = {r = 250, g = 0, b = 0, a = 149},
    icon =
    {
      filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
      priority = "high",
      size = 64,
      mipmap_count = 2,
      y = 3 * 64,
      flags = {"gui-icon"}
    },
    affects_evolution = false,
    affects_water_tint = false,
    damages_trees = false,
  },















  {
    type = "electric-turret",
    name = "timeshift_energy_roots_tesla_turret",
    icon = "__space-age__/graphics/icons/tesla-turret.png",
    flags = {"placeable-player", "placeable-enemy", "player-creation"},
    minable = {mining_time = 0.5, result = "tesla-turret"},
    --fast_replaceable_group = "tesla-turret",
    max_health = 1000,
    collision_box = {{-0.2, -0.2 }, {0.2, 0.2}},
    selection_box = {{-0.5, -0.5 }, {0.5, 0.5}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, is_object=true, is_lower_object=true}},
    damaged_trigger_effect = hit_effects.entity(),
    start_attacking_only_when_can_shoot = true,
    rotation_speed = 0.005,
    preparing_speed = 0.1,
    folding_speed = 0.1,
    ending_attack_speed = 1 / (30 + 1), -- Must be clocked to the beam duration so the face light turns off at the right time
    circuit_connector = circuit_connector_definitions["tesla-turret"], -- TODO: generate points for tesla-turret
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    open_sound = sounds.turret_open,
    close_sound = sounds.turret_close,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/tesla-turret/tesla-turret-base.ogg", volume = 0.3},
      use_doppler_shift = false,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    preparing_sound = space_age_sounds.tesla_turret_activate,
    folding_sound = space_age_sounds.tesla_turret_deactivate,
    rotating_sound = space_age_sounds.tesla_turret_rotate,
    corpse = "tesla-turret-remnants",
    dying_explosion = "laser-turret-explosion",
    energy_source =
    {
      type = "void",
    },
    folded_animation = tesla_turret_rising({}),
    preparing_animation = tesla_turret_rising({}),
    prepared_animation = tesla_turret_ready({}),
    ending_attack_animation = tesla_turret_cooldown({}),
    folding_animation = tesla_turret_rising({run_mode = "backward"}),
    energy_glow_animation = laser_turret_shooting_glow(),
    resource_indicator_animation = tesla_turret_LED(),
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
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base",
                     {
                        frame_count = 1,
                        repeat_count=30,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.15,
                        animation_speed = 0.5
                     }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base-mask",
                     {
                        flags = {"mask"},
                        apply_runtime_tint = true,
                        frame_count = 1,
                        repeat_count=30,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.15
                     }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base-shadow",
                     {
                        frame_count = 1,
                        repeat_count=30,
                        draw_as_shadow = true,
                        shift = util.by_pixel(32, 0+tesla_turret_shift),
                        scale = 0.15
                     }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-base-emit",
                     {
                        frame_count = 1,
                        repeat_count=30,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.15,
                        draw_as_glow = true,
                        blend_mode = "additive"
                     }),
            }
          }
        },
        {
          enabled_states = { "folded", "preparing", "rotate-for-folding", "folding" },
          draw_when_no_energy = false,
          draw_when_frozen = false,
          animation =
          {
            layers =
            {
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-idle-2",
                      {
                        frame_count = 50,
                        repeat_count = 4,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.15,
                        animation_speed = 0.33,
                        draw_as_glow = true,
                        blend_mode = "additive"
                      }),
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-idle-1",
                      {
                        frame_count = 40,
                        repeat_count = 5,
                        shift = util.by_pixel(0, 0+tesla_turret_shift),
                        scale = 0.15,
                        animation_speed = 0.33,
                        draw_as_glow = true,
                        blend_mode = "additive"
                      }),
            },
          }
        },
        {
          enabled_states = { "prepared", "starting-attack", "attacking", "ending-attack" },
          draw_when_no_energy = false,
          draw_when_frozen = false,
          animation  =
          {
            layers =
            {
              util.sprite_load("__space-age__/graphics/entity/tesla-turret/tesla-turret-sfx-passive",
              {
                 frame_count = 30,
                 shift = util.by_pixel(0, 0+tesla_turret_shift),
                 scale = 0.5,
                 animation_speed = 0.5,
                 draw_as_glow = true,
                 blend_mode = "additive"
              })
            }
          }
        }
      }
    },

    attack_parameters =
    {
      type = "beam",
      cooldown = 120,
      range = 30,
      range_mode = "center-to-bounding-box",
      fire_penalty = 0.9,
      source_direction_count = 64,
      source_offset = {0, -0.55},
      ammo_category = "tesla",
      ammo_type =
      {
        energy_consumption = "12MJ",
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
                    max_length = 40,
                    duration = 30,
                    add_to_shooter = false,
                    destroy_with_source_or_target = false,
                    source_offset = {0, -2.6}
                  }
                }
              }
            }
          }
        }
      }
    },

    call_for_help_radius = 40,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/laser-turret/laser-turret-reflection.png",
        priority = "extra-high",
        width = 20,
        height = 32,
        shift = util.by_pixel(0, 40),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },



})