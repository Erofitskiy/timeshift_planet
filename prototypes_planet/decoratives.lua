local decora = "__timeshift_planet__/graphics/decorative/"
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local base_sounds = require ("__base__.prototypes.entity.sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local decal_tile_layer = 255
local decal_opacity_over_water = 0.4
local water_decal_opacity_over_water = 0.7

function get_decal_pictures_withglow(file_path, size_class, image_size, amount, tint, tint_as_overlay, scale)
  local pictures  = {}
  tint_as_overlay = tint_as_overlay or false
  tint = tint or {1, 1, 1}
  for i = 1, amount do
    table.insert(pictures,
      {
        layers =
        {
          {
            filename = file_path .. size_class .. string.format("%02i", i) .. ".png",
            priority = base_decorative_sprite_priority,
            width = image_size,
            height = image_size,
            scale = 0.5 * (scale or 1),
            tint_as_overlay = tint_as_overlay,
            tint = tint
          },
          {
            filename = file_path .. size_class .. string.format("%02i", i) .. "-glow.png",
            priority = base_decorative_sprite_priority,
            width = image_size,
            height = image_size,
            scale = 0.5 * (scale or 1),
            tint_as_overlay = tint_as_overlay,
            tint = tint,
            draw_as_light = true,
            blend_mode = "additive",
          },
        },
      })
  end
  return pictures
end


local function combine_tint(table_1, table_2)
  local t1 = table_1[1]-(1-table_2[1])
  local t2 = table_1[2]-(1-table_2[2])
  local t3 = table_1[3]-(1-table_2[3])
  return {t1,t2,t3}
end
local vulcanus_base_tint = {1,1,1}

local green_hairy_tint = {.85,.6,.7}
local brown_hairy_tint = {.7,.7,.7}
local brown_carpet_tint = {1,.9,1}
local red_pita_tint = {.8,.75,.75}
local tintable_rock_tint = {0.2588, 0.2788, 0.2588}
local sulfur_rock_tint = {0.788, 0.627, 0.167} --{0.968, 0.807, 0.247}
--local tungsten_rock_tint = {.7,.7,.7}
local tungsten_rock_tint = {1,1,1}

green_hairy_tint = combine_tint(vulcanus_base_tint, green_hairy_tint)
brown_hairy_tint = combine_tint(vulcanus_base_tint, brown_hairy_tint)
brown_carpet_tint = combine_tint(vulcanus_base_tint, brown_carpet_tint)
red_pita_tint =  combine_tint(vulcanus_base_tint, red_pita_tint)
tintable_rock_tint = combine_tint(vulcanus_base_tint, tintable_rock_tint)
tungsten_rock_tint = combine_tint(vulcanus_base_tint, tungsten_rock_tint)

local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local base_decorative_sprite_priority = "extra-high"

 -- different from the normal decorative default in that it has colliding_with_tiles_only=true
local function dec_default_collision()
  return {layers={doodad=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

 -- collides with cliffs. Only use for things that render in object layer and shouldn't grow on cliff edges.
local function dec_cliff_collision()
  return {layers={doodad=true, cliff=true}, not_colliding_with_itself=true}
end

 -- collides with shallow water. Only use for things that would obscure the shore too much.
local function dec_shallow_collision()
  return {layers={doodad=true, water_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

-- collides with land.
local function dec_land_collision()
 return {layers={doodad=true, ground_tile=true}, colliding_with_tiles_only=true, not_colliding_with_itself=true}
end

-- collides with cliff and water
local function dec_shallow_cliff_collision()
  return {layers={doodad=true, water_tile=true, cliff=true}, not_colliding_with_itself=true}
end



local hugerockpics = {}
for num = 1, 28 do
  table.insert(hugerockpics,
  {
    filename = decora .. "huge-volcanic-rock/huge-volcanic-rock-" .. num .. ".png",
    width = 320,
    height = 256,
    scale = 0.5,
  })
end

local bigrockpics = {}
for num = 1, 27 do
  table.insert(bigrockpics,
  {
    filename = decora .. "big-volcanic-rock/big-volcanic-rock-" .. num .. ".png",
    width = 256,
    height = 256,
    scale = 0.5,
  })
end

local mediumrocks = {}
for num = 1, 12 do
  table.insert(mediumrocks,
  {
    filename = decora .. "medium-volcanic-rock/medium-volcanic-rock-" .. num .. ".png",
    width = 128,
    height = 128,
    scale = 0.5,
  })
end




data:extend({

  {
    name = "timeshiftplanet-huge-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-a[vulcanus]-b[huge-volcanic-rock]",
    collision_box = {{-1.7, -1.3}, {1.7, 1.3}},
    selection_box = {{-2, -1.5}, {2, 1.5}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "stone", amount_min = 6, amount_max = 18},
        {type = "item", name = "iron-ore", amount_min = 9, amount_max = 27},
        {type = "item", name = "copper-ore", amount_min = 6, amount_max = 18},
        --{type = "item", name = "tungsten-ore", amount_min = 3, amount_max = 15}
      },
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = {
      order = "a[landscape]-c[rock]-a[huge]",
      probability_expression = "vulcanus_rock_huge"
    },
    pictures = hugerockpics,
  },

  {
    name = "timeshiftplanet-big-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-a[vulcanus]-a[big-volcanic-rock]",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      order = "a[landscape]-c[rock]-b[big]",
      probability_expression = "vulcanus_rock_big"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "stone", amount_min = 2, amount_max = 12},
        {type = "item", name = "iron-ore", amount_min = 5, amount_max = 9},
        {type = "item", name = "copper-ore", amount_min = 3, amount_max = 7},
        --{type = "item", name = "tungsten-ore", amount_min = 2, amount_max = 8}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures = bigrockpics,
  },



  {
    name = "timeshiftplanet-medium-volcanic-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    walking_sound = space_age_tile_sounds.walking.rocky_stone({modifiers = volume_multiplier("main-menu", 1.5)}),
    autoplace = {
      order = "d[ground-surface]-i[rock]-a[medium]",
      probability_expression = "vulcanus_rock_medium"
    },
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures = mediumrocks,
  },








  {
    name = "timeshiftplanet-vulcanus-rock-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -1,
    autoplace = {
      order = "d[ground-surface]-f[cracked-rock]-b[cold]",
      probability_expression = "vulcanus_rock_decal_large"
    },
    pictures = get_decal_pictures(decora .. "vulcanus-rock-decal/vulcanus-rock-decal-", "large-", 256, 5)
  },
  {
    name = "timeshiftplanet-vulcanus-crack-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -4,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-a[large]",
      probability_expression = "vulcanus_crack_decal_large"
    },
    pictures = get_decal_pictures(decora .. "vulcanus-cracks-cold/vulcanus-cracks-cold-", "huge-", 256, 20)
  },
  {
    name = "timeshiftplanet-vulcanus-crack-decal-huge-warm",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-a[large]",
      probability_expression = "vulcanus_crack_decal_huge_warm"
    },
    pictures = get_decal_pictures_withglow(decora .. "vulcanus-cracks/vulcanus-cracks-hot-", "huge-", 256, 20)
  },


  {
    name = "timeshiftplanet-small-volcanic-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-b[small]",
      probability_expression = "vulcanus_rock_small"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-01.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-02.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 35,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-03.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 42,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-04.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-05.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 46,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 41,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 36,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-08.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 31,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-09.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-10.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-12.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 39,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-13.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0, 0.09375}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 30,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-15.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0, 0.140625}
        },
        {
          filename = decora .. "small-volcanic-rock/small-volcanic-rock-16.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        }
    }
  },
  --- TINY TINTABLE ROCKS
  {
    name = "timeshiftplanet-tiny-volcanic-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-d[tiny]",
      placement_density = 5,
      probability_expression = "vulcanus_rock_tiny"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  decora .. "tiny-volcanic-rock/tiny-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },

  --- ROCK CLUSTERS
  {
    name = "timeshiftplanet-tiny-rock-cluster",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-c[cluster]",
      placement_density = 2,
      probability_expression = "vulcanus_rock_cluster"
    },
    pictures = get_decal_pictures(decora .. "tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,tintable_rock_tint,true)
  },


















  {
    name = "timeshiftplanet-barnacles-decal",
    type = "optimized-decorative",
    order = "b[decorative]-b[red-desert-decal]",
    collision_box = {{-3.375, -2.3125}, {3.25, 2.3125}},
    -- don't collide with water so can overlap shallows, but tile restricturion means it cannot be placed directly on shallows
    collision_mask = dec_default_collision(),
    walking_sound = base_tile_sounds.walking.mud,
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    opacity_over_water = decal_opacity_over_water,
    autoplace = {
      --tile_restriction = gleba_land_tiles,
      --probability_expression = "grpi(0.2) + gleba_select(gleba_barnacles - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.1, 0, 1)"
      probability_expression = "crater_large"
    },
    pictures =
    {
      --lightDecal
      {
        filename = decora .. "barnacles-decal/barnacles-decal-00.png",
        width = 400,
        height = 299,
        shift = util.by_pixel(4.5, -2.25),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-01.png",
        width = 419,
        height = 320,
        shift = util.by_pixel(-0.75, 2),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-02.png",
        width = 417,
        height = 287,
        shift = util.by_pixel(-1.25, 1.25),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-03.png",
        width = 421,
        height = 298,
        shift = util.by_pixel(-0.25, 5.5),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-04.png",
        width = 396,
        height = 302,
        shift = util.by_pixel(6, 4),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-05.png",
        width = 408,
        height = 295,
        shift = util.by_pixel(-2.5, 7.75),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-06.png",
        width = 417,
        height = 317,
        shift = util.by_pixel(-1.25, 3.25),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-07.png",
        width = 419,
        height = 312,
        shift = util.by_pixel(0.75, 2.5),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-08.png",
        width = 413,
        height = 317,
        shift = util.by_pixel(-2.25, 2.25),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-09.png",
        width = 403,
        height = 310,
        shift = util.by_pixel(0.25, 1.5),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-10.png",
        width = 411,
        height = 307,
        shift = util.by_pixel(-0.75, 1.75),
        scale = 0.5
      },
      {
        filename = decora .. "barnacles-decal/barnacles-decal-11.png",
        width = 421,
        height = 295,
        shift = util.by_pixel(-0.25, -0.75),
        scale = 0.5
      },
    }
  },

  {
    name = "timeshiftplanet-green-cup",
    type = "optimized-decorative",
    order = "XxX[decorative]-a[grass]-b[carpet]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = base_tile_sounds.walking.small_bush,
    render_layer = "object",
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace =
    {
      placement_density = 3,
      probability_expression = "grpi(0.6) + gleba_select(gleba_green_cup - clamp(gleba_decorative_knockout, 0, 1), 0.2, 2, 0.2, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = decora .. "green-cup/green-cup", frame_count = 84}}),
  },



  {
    name = "timeshiftplanet-solo-barnacle",
    type = "optimized-decorative",
    order = "b[cover]-b[yellow-lichen]-a[7]",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    collision_mask = dec_shallow_cliff_collision(),
    walking_sound = base_tile_sounds.walking.plant,
    render_layer = "object",
    autoplace = {
      placement_density = 4,
      probability_expression = "grpi(0.6) + gleba_select(gleba_barnacle_solo - 0.5 * clamp(gleba_decorative_knockout, 0, 1), 0.6, 2, 0.1, 0, 1)"
    },
    pictures = util.spritesheets_to_pictures({{path = decora .. "barney/barney", frame_count = 75}}),
    
  },

})