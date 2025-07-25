


data:extend({
  {
    type = "technology",
    name = "timeshift_planet_discovery_timeshift",
    icons = util.technology_icon_constant_planet(techicons .. "timeshift-tech-timeshift.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = planet_name,
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {},
    unit =
    {
      count = 1,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 1
    }
  },
  {
    type = "technology",
    name = "timeshift_advanced_optics",
    icon = techicons .. "timeshift_advanced_optics.png",
    icon_size = 256,
    effects =
    {
    },
    prerequisites = {"timeshift_planet_discovery_timeshift", "planet-discovery-moshine"},
    research_trigger =
    {
      type = "craft-item",
      item = "glass",
      count = 10
    }
  },


  {
    type = "technology",
    name = "timeshift_nano_tech",
    icon = techicons .. "timeshift_nano_tech.png",
    icon_size = 256,
    effects =
    {
    },
    prerequisites = {"timeshift_advanced_optics"},

    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 60
    }
  },
--[[
  {
    type = "technology",
    name = "timeshift_nano_forge",
    icon = techicons .. "timeshift_nano_forge.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nano_forge"
      },
    },
    prerequisites = {"timeshift_nano_tech"},

    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 60
    }
  },


  {
    type = "technology",
    name = "timeshift_nanobots_hive",
    icon = techicons .. "timeshift_nanobots_hive.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "nanobots_hive"
      },
    },
    prerequisites = {"timeshift_nano_forge"},

    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 60
    }
  },
]]
  {
    type = "technology",
    name = "timeshift_dna_manipulation",
    icon = techicons .. "timeshift_dna_manipulation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "datacell-dna-raw"
      },
      {
        type = "unlock-recipe",
        recipe = "human_body_0_recipe"
      },
    },
    prerequisites = {"timeshift_nano_tech", "cloning-vat-technology", "moshine-tech-processing-grid", "uranium-processing"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "timeshift_simulation_chamber",
    icon = techicons .. "timeshift_simulation_chamber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "simulation_chamber"
      },
      {
        type = "unlock-recipe",
        recipe = "human_body_1_recipe"
      },
    },
    prerequisites = {"timeshift_dna_manipulation", "matter_printer-technology"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 60
    }
  },


  {
    type = "technology",
    name = "timeshift_simulation_matrix",
    icon = techicons .. "timeshift_simulation_matrix.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "human_body_2_recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "human_body_3_recipe"
      },
    },
    prerequisites = {"timeshift_simulation_chamber"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 1},
      },
      time = 60
    }
  },
})



--if data.raw["technology"]["cloning-vat-technology"] then
-- table.insert(data.raw["technology"]["cloning-vat-technology"].prerequisites, "moshine-tech-ai-tier-2")
--end
if data.raw["technology"]["thinking-brain-technology"] then
  data.raw["technology"]["thinking-brain-technology"].prerequisites = {"timeshift_simulation_matrix"}
end
if data.raw["technology"]["matter_printer-technology"] then
  table.insert(data.raw["technology"]["matter_printer-technology"].prerequisites, "timeshift_advanced_optics")
end