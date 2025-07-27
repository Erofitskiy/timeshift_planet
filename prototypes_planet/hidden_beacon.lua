local resource_autoplace = require("resource-autoplace")
resource_autoplace.initialize_patch_set("hidden_beacon", true)

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "beacon",
    name = "hidden_beacon",
    icon = "__base__/graphics/icons/beacon.png",
    flags = {"placeable-neutral", "not-upgradable", "not-blueprintable", "hide-alt-info", "not-flammable", "no-automated-item-removal", "no-automated-item-insertion", "no-copy-paste", "not-selectable-in-game"},
    is_military_target = false,
    --minable = {},
    --fast_replaceable_group = "beacon",
    max_health = 200000,
    corpse = "beacon-remnants",
    dying_explosion = "beacon-explosion",
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    collision_mask = {layers={}, not_colliding_with_itself=true},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    allowed_effects = {"consumption", "speed", "pollution"},
    graphics_set = {
      module_icons_suppressed = true,
      animation_progress = 1,
      module_tint_mode = "mix", -- "single-module"
      no_modules_tint = {1, 0, 0},
      random_animation_offset = true,
      apply_module_tint = "secondary",
      -- light = { shift = {0, 0}, color = {1, 1, 1}, intensity = 1, size = 3 },
      animation_list =
      {
        {
          render_layer = "smoke",
          always_draw = true,
          animation =
          {
            layers =
            {
              {
                filename = entity .. "hidden_beacon/hidden_beacon.png",
                width = 180,
                height = 202,
                scale = 0.5,
                line_length = 4,
                frame_count = 16,
                animation_speed = 0.1,
                shift = util.by_pixel(0, 0),
                draw_as_glow = true,
                blend_mode = "additive",
              },
              --[[{
                filename = "__base__/graphics/entity/beacon/beacon-shadow.png",
                width = 244,
                height = 176,
                scale = 0.1,
                draw_as_shadow = true,
                shift = util.by_pixel(12.5, 0.5)
              }]]
            }
          }
        },
        --[[{
          render_layer = "object",
          apply_tint = false, -- light doesn't get tinted
          always_draw = false,
          animation =
          {
            filename = "__base__/graphics/entity/beacon/beacon-light.png",
            line_length = 9,
            width = 110,
            height = 186,
            frame_count = 45,
            animation_speed = 0.5,
            scale = 0.1,
            shift = util.by_pixel(0.5, -18),
            draw_as_light = true,
            blend_mode = "additive"
          }
        }]]
      },
    },
    autoplace = resource_autoplace.resource_autoplace_settings
    {
      name = "hidden_beacon",
      order = "a",
      base_density = 20,
      has_starting_area_placement = true,
      regular_rq_factor_multiplier = 1.10,
      starting_rq_factor_multiplier = 1.5,
      candidate_spot_count = 30,
      --tile_restriction = autoplace_parameters.tile_restriction
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/beacon/beacon-radius-visualization.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    supply_area_distance = 0,
    energy_source =
    {
      type = "void",
    },
    energy_usage = "1W",
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/beacon-open.ogg", volume = 0.25},
    close_sound = {filename = "__base__/sound/open-close/beacon-close.ogg", volume = 0.25},
    working_sound =
    {
      sound =
      {
        filename = sounds .. "fast_forward1.wav",
        volume = 0.8,
        --variations = sound_variations("__base__/sound/beacon", 1, 0.1),
        audible_distance_modifier = 0.3,
      },
      max_sounds_per_prototype = 1
    },
    distribution_effectivity = 1,
    distribution_effectivity_bonus_per_quality_level = 0.2,
    profile = {1}, --{1,0.7071,0.5773,0.5,0.4472,0.4082,0.3779,0.3535,0.3333,0.3162,0.3015,0.2886,0.2773,0.2672,0.2581,0.25,0.2425,0.2357,0.2294,0.2236,0.2182,0.2132,0.2085,0.2041,0.2,0.1961,0.1924,0.1889,0.1856,0.1825,0.1796,0.1767,0.174,0.1714,0.169,0.1666,0.1643,0.1622,0.1601,0.1581,0.1561,0.1543,0.1524,0.1507,0.149,0.1474,0.1458,0.1443,0.1428,0.1414,0.14,0.1386,0.1373,0.136,0.1348,0.1336,0.1324,0.1313,0.1301,0.129,0.128,0.127,0.1259,0.125,0.124,0.123,0.1221,0.1212,0.1203,0.1195,0.1186,0.1178,0.117,0.1162,0.1154,0.1147,0.1139,0.1132,0.1125,0.1118,0.1111,0.1104,0.1097,0.1091,0.1084,0.1078,0.1072,0.1066,0.1059,0.1054,0.1048,0.1042,0.1036,0.1031,0.1025,0.102,0.1015,0.101,0.1005,0.1},
    beacon_counter = "same_type",
    module_slots = 1,
    icons_positioning =
    {
      {inventory_index = defines.inventory.beacon_modules, shift = {0, 0}, multi_row_initial_height_modifier = -0.3, max_icons_per_row = 2}
    },
    map_color = {1, 0, 0},
  },


  {
    type = "module-category",
    name = "timeshift_module"
  },
  {
    type = "module",
    name = "timeshift_module",
    localised_description = {"item-description.speed-module"},
    icon = "__base__/graphics/icons/speed-module-2.png",
    subgroup = "module",
    hidden = true,
    hidden_in_factoriopedia = true,
    category = "timeshift_module",
    color_hint = { text = "S" },
    tier = 1,
    order = "a[speed]-b[speed-module-2]",
    inventory_move_sound = item_sounds.module_inventory_move,
    pick_sound = item_sounds.module_inventory_pickup,
    drop_sound = item_sounds.module_inventory_move,
    stack_size = 1,
    weight = 20 * kg,
    effect = {speed = 2, consumption = 2, pollution = 2, quality},
    --beacon_tint =
    --{
    --  primary = {0.441, 0.714, 1.000, 1.000}, -- #70b6ffff
    --  secondary = {0.388, 0.976, 1.000, 1.000}, -- #63f8ffff
    --},
    art_style = "vanilla",
    requires_beacon_alt_mode = false
  },
})
