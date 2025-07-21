


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
    prerequisites = {"timeshift_planet_discovery_timeshift"},
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
      {
        type = "unlock-recipe",
        recipe = "nano_forge"
      },
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
    name = "timeshift_universe_incubator",
    icon = techicons .. "placeholder.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "matter_printer"
      },
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
]]

  {
    type = "technology",
    name = "timeshift_dna_manipulation",
    icon = techicons .. "timeshift_dna_manipulation.png",
    icon_size = 256,
    effects =
    {
    },
    prerequisites = {"timeshift_nano_tech", "cloning-vat-technology"},
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
    name = "timeshift_life_simulator",
    icon = techicons .. "timeshift_life_simulator.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "life_simulator"
      },
    },
    prerequisites = {"matter_printer-technology", "timeshift_dna_manipulation"},
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
  table.insert(data.raw["technology"]["thinking-brain-technology"].prerequisites, "timeshift_life_simulator")
end
if data.raw["technology"]["matter_printer-technology"] then
  table.insert(data.raw["technology"]["matter_printer-technology"].prerequisites, "timeshift_advanced_optics")
end