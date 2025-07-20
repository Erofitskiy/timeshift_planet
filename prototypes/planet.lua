local resource_autoplace = require("resource-autoplace")
resource_autoplace.initialize_patch_set("hidden_beacon", true)



local planet_map_gen = require("__space-age__/prototypes/planet/planet-map-gen")

local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
local tile_pollution = require("__space-age__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

planet_map_gen.timeshift = function()
  return
  {
    property_expression_names =
    {
      elevation = "vulcanus_elevation",
      temperature = "vulcanus_temperature",
      moisture = "vulcanus_moisture",
      aux = "vulcanus_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability",
      ["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness",
      ["entity:coal:probability"] = "vulcanus_coal_probability",
      ["entity:coal:richness"] = "vulcanus_coal_richness",
      ["entity:calcite:probability"] = "vulcanus_calcite_probability",
      ["entity:calcite:richness"] = "vulcanus_calcite_richness",
      ["entity:sulfuric-acid-geyser:probability"] = "vulcanus_sulfuric_acid_geyser_probability",
      ["entity:sulfuric-acid-geyser:richness"] = "vulcanus_sulfuric_acid_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 170,
      cliff_elevation_0 = 0
    },
    --[[territory_settings =
    {
      units = {"small-demolisher", "medium-demolisher", "big-demolisher"},
      territory_index_expression = "demolisher_territory_expression",
      territory_variation_expression = "demolisher_variation_expression",
      minimum_territory_size = 10
    },]]
    autoplace_controls =
    {
      ["hidden_beacon"] = {},
      --["vulcanus_coal"] = {},
      --["sulfuric_acid_geyser"] = {},
      --["tungsten_ore"] = {},
      --["calcite"] = {},
      --["vulcanus_volcanism"] = {},
      --["rocks"] = {}, -- can't add the rocks control otherwise nauvis rocks spawn
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --nauvis tiles
          ["timeshiftplanet-volcanic-soil-dark"] = {},
          ["timeshiftplanet-volcanic-soil-light"] = {},
          ["timeshiftplanet-volcanic-ash-soil"] = {},
          --end of nauvis tiles
          ["timeshiftplanet-volcanic-ash-flats"] = {},
          ["timeshiftplanet-volcanic-ash-light"] = {},
          ["timeshiftplanet-volcanic-ash-dark"] = {},
          ["timeshiftplanet-volcanic-cracks"] = {},
          ["timeshiftplanet-volcanic-cracks-warm"] = {},
          ["timeshiftplanet-volcanic-folds"] = {},
          ["timeshiftplanet-volcanic-folds-flat"] = {},
          --["lava"] = {},
          --["lava-hot"] = {},
          ["timeshiftplanet-volcanic-folds-warm"] = {},
          ["timeshiftplanet-volcanic-pumice-stones"] = {},
          ["timeshiftplanet-volcanic-cracks-hot"] = {},
          ["timeshiftplanet-volcanic-jagged-ground"] = {},
          ["timeshiftplanet-volcanic-smooth-stone"] = {},
          ["timeshiftplanet-volcanic-smooth-stone-warm"] = {},
          ["timeshiftplanet-volcanic-ash-cracks"] = {},

          ["timeshiftplanet-midland-turquoise-bark"] = {},
          ["timeshiftplanet-midland-turquoise-bark-2"] = {},
          ["timeshiftplanet-wetland-light-dead-skin"] = {},
          ["timeshiftplanet-wetland-dead-skin"] = {},
          ["timeshiftplanet-midland-cracked-lichen-dark"] = {},



        }
      },
      ["decorative"] =
      {
        settings =
        {
          -- nauvis decoratives
          --["v-brown-carpet-grass"] = {},
          --["v-green-hairy-grass"] = {},
          --["v-brown-hairy-grass"] = {},
          --["v-red-pita"] = {},
          -- end of nauvis
          ["timeshiftplanet-vulcanus-rock-decal-large"] = {},
          ["timeshiftplanet-vulcanus-crack-decal-large"] = {},
          ["timeshiftplanet-vulcanus-crack-decal-huge-warm"] = {},
          --["vulcanus-dune-decal"] = {},
          --["vulcanus-sand-decal"] = {},
          --["vulcanus-lava-fire"] = {},
          --["calcite-stain"] = {},
          --["calcite-stain-small"] = {},
          --["sulfur-stain"] = {},
          --["sulfur-stain-small"] = {},
          --["sulfuric-acid-puddle"] = {},
          --["sulfuric-acid-puddle-small"] = {},
          --["crater-small"] = {},
          --["crater-large"] = {},
          --["pumice-relief-decal"] = {},
          ["timeshiftplanet-small-volcanic-rock"] = {},
          ["timeshiftplanet-medium-volcanic-rock"] = {},
          ["timeshiftplanet-tiny-volcanic-rock"] = {},
          ["timeshiftplanet-tiny-rock-cluster"] = {},
          --["small-sulfur-rock"] = {},
          --["tiny-sulfur-rock"] = {},
          --["sulfur-rock-cluster"] = {},
          --["waves-decal"] = {},


          ["timeshiftplanet-barnacles-decal"] = {},
          ["timeshiftplanet-green-cup"] = {},
          ["timeshiftplanet-solo-barnacle"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["hidden_beacon"] = {},
          --["coal"] = {},
          --["calcite"] = {},
          --["sulfuric-acid-geyser"] = {},
          --["tungsten-ore"] = {},
          ["huge-volcanic-rock"] = {},
          ["big-volcanic-rock"] = {},
          ["crater-cliff"] = {},
          --["vulcanus-chimney"] = {},
          --["vulcanus-chimney-faded"] = {},
          --["vulcanus-chimney-cold"] = {},
          --["vulcanus-chimney-short"] = {},
          --["vulcanus-chimney-truncated"] = {},
          --["ashland-lichen-tree"] = {},
          --["ashland-lichen-tree-flaming"] = {},
        }
      }
    }
  }
end


--[[
hidden_beacon = table.deepcopy(data.raw["beacon"]["beacon"])
hidden_beacon.name = "hidden_beacon"
hidden_beacon.autoplace = resource_autoplace.resource_autoplace_settings
{
  name = "hidden_beacon",
  order = "a",
  base_density = 10,
  has_starting_area_placement = true,
  regular_rq_factor_multiplier = 1.10,
  starting_rq_factor_multiplier = 1.5,
  candidate_spot_count = 22,
  --tile_restriction = autoplace_parameters.tile_restriction
}
hidden_beacon.collision_mask = {layers={}, not_colliding_with_itself=true}

hidden_beacon.collision_box = {{-0.1, -0.1}, {0.1, 0.1}}
hidden_beacon.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}

data:extend({hidden_beacon})
]]


local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

data:extend({
  {
    type = "autoplace-control",
    name = "hidden_beacon",
    --localised_name = {"", "[entity=iron-ore] ", {"entity-name.iron-ore"}},
    richness = true,
    order = "a-a",
    category = "terrain"
  },

  {
    type = "autoplace-control",
    name = "calcite",
    --localised_name = {"", "[entity=calcite] ", {"entity-name.calcite"}},
    richness = true,
    order = "b-c",
    category = "resource"
  },




  {
    type = "surface-property",
    name = "temperature-celcius",
    default_value = 15,
    hidden_in_factoriopedia = true,
    hidden = true,
  },
  {
    type = "surface-property",
    name = "moshine-exclusive",
    default_value = 0,
    hidden_in_factoriopedia = true,
    hidden = true,
  },


  {
    type = "planet",
    name = planet_name,
    icon = icons .. "planet-timeshift.png",
    starmap_icon = icons .. "starmap-planet-timeshift.png",
    starmap_icon_size = 2048,

    gravity_pull = 5,
    distance = 22,
    orientation = 0.185,
    magnitude = 0.65,
    label_orientation = 0.35,

    --gravity_pull = 10,
    --distance = 11,
    --orientation = 0.1,
    --magnitude = 1.5,
    order = "b[vulcanus]",
    subgroup = "planets",
    map_gen_settings = planet_map_gen.timeshift(),
    pollutant_type = nil,
    solar_power_in_space = 600,
    platform_procession_set =
    {
      arrival = {"planet-to-platform-b"},
      departure = {"platform-to-planet-a"}
    },
    planet_procession_set =
    {
      arrival = {"platform-to-planet-b"},
      departure = {"planet-to-platform-a"}
    },
    procession_graphic_catalogue = planet_catalogue_vulcanus,
    surface_properties =
    {
      ["day-night-cycle"] = 1.5 * minute,
      ["magnetic-field"] = 25,
      ["solar-power"] = 400,
      pressure = 4000,
      gravity = 40
    },
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-vulcanus.ogg", volume = 0.8},
      wind = {filename = "__space-age__/sound/wind/wind-vulcanus.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.5)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 0.6)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 7.0
        }
      }
    },
    surface_render_parameters =
    {
      fog = effects.default_fog_effect_properties(),
      -- clouds = effects.default_clouds_effect_properties(),

      -- Should be based on the default day/night times, ie
      -- sun starts to set at 0.25
      -- sun fully set at 0.45
      -- sun starts to rise at 0.55
      -- sun fully risen at 0.75
      day_night_cycle_color_lookup =
      {
        --{0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        --{0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        --{0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        --{0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
        --{0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
        {0.0, "__timeshift_planet__/graphics/lut/identity-lut.png"},
      },

      terrain_tint_effect =
      {
        noise_texture =
        {
          filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
          size = 4096
        },

        offset = { 0.2, 0, 0.4, 0.8 },
        intensity = { 0.5, 0.2, 0.3, 1.0 },
        scale_u = { 3, 1, 1, 1 },
        scale_v = { 1, 1, 1, 1 },

        global_intensity = 0.3,
        global_scale = 0.1,
        zoom_factor = 3,
        zoom_intensity = 0.6
      }
    }
  },
  {
    type = "space-connection",
    name = "gleba-" .. planet_name,
    subgroup = "planet-connections",
    from = "gleba",
    to = planet_name,
    order = "a",
    length = 100,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },
  --[[{
    type = "space-connection",
    name = "vulcanus-moshine",
    subgroup = "planet-connections",
    from = "vulcanus",
    to = "moshine",
    order = "a",
    length = 3000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus)
  },]]
})
