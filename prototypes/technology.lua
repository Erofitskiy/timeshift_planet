


data:extend({
  {
    type = "technology",
    name = "panglia_planet_discovery_panglia",
    icons = util.technology_icon_constant_planet(techicons .. "panglia-tech-panglia.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "panglia",
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {"agricultural-science-pack"},
    unit =
    {
      count = 800,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },
  {
    type = "technology",
    name = "panglia_branbalite_slurry",
    icon = techicons .. "panglia_branbalite_slurry.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_branbalite_slurry"
      },
    },
    prerequisites = {"agriculture", "panglia_planet_discovery_panglia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "panglia_branbalite_plant"
    },
  },

  {
    type = "technology",
    name = "panglia_branbalite_slurry_to_crudeoil",
    icon = techicons .. "panglia_branbalite_slurry_to_crudeoil.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_branbalite_slurry_to_crudeoil"
      },
    },
    prerequisites = {"panglia_branbalite_slurry"},
    research_trigger =
    {
      type = "craft-fluid",
      fluid = "panglia_branbalite_slurry",
      amount = 50,
    },
  },





  {
    type = "technology",
    name = "panglia_panglite_multiplication",
    icon = techicons .. "panglia_panglite_multiplication.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_panglite_multiplication"
      },
    },
    prerequisites = {"panglia_planet_discovery_panglia"},
    research_trigger =
    {
      type = "mine-entity",
      entity = "panglia-huge-panglite-rock"
    }
  },

  {
    type = "technology",
    name = "panglia_advanced_optics_nanotech",
    icon = techicons .. "panglia_advanced_optics_nanotech.png",
    icon_size = 256,
    effects =
    {
    },
    prerequisites = {"panglia_planet_discovery_panglia"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite",
      count = 10,
    }
  },



  {
    type = "technology",
    name = "panglia_crusher",
    icon = techicons .. "panglia_crusher.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_crusher"
      },
    },
    prerequisites = {"matter_printer-technology"},
    unit =
    {
      count = 1000,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
      },
      time = 60
    },
  },


  {
    type = "technology",
    name = "panglia_panglite_fiber",
    icon = techicons .. "panglia_panglite_fiber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_panglite_fiber"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_low_density_structure_from_panglite_fiber"
      },
    },
    prerequisites = {"panglia_panglite_multiplication", "uranium-processing"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite",
      count = 100,
    }
  },



  {
    type = "technology",
    name = "panglia_dna_manipulation",
    icon = techicons .. "panglia_dna_manipulation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "datacell-dna-raw"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_0_recipe"
      },
    },
    prerequisites = {"panglia_advanced_optics_nanotech", "cloning-vat-technology", "moshine-tech-processing-grid", "uranium-processing"},
    unit =
    {
      count = 850,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },

  {
    type = "technology",
    name = "panglia_simulation_chamber",
    icon = techicons .. "panglia_simulation_chamber.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "simulation_chamber"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_1_recipe"
      },
    },
    prerequisites = {"moshine-tech-ai-tier-10", "panglia_dna_manipulation", "matter_printer-technology"},
    unit =
    {
      count = 900,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1}
      },
      time = 60
    }
  },


  {
    type = "technology",
    name = "panglia_simulation_matrix",
    icon = techicons .. "panglia_simulation_matrix.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_2_recipe"
      },
      {
        type = "unlock-recipe",
        recipe = "panglia_cloned_specimen_body_3_recipe"
      },
    },
    prerequisites = {"panglia_simulation_chamber"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_cloned_specimen_body_1",
      count = 1,
    },
  },

  {
    type = "technology",
    name = "panglia_sentient_processor",
    icon = techicons .. "panglia_sentient_processor.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "panglia_sentient_processor"
      },
    },
    prerequisites = {"thinking-brain-technology", "quantum-processor"},
    unit =
    {
      count = 1200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"agricultural-science-pack", 1},
        {"cryogenic-science-pack", 1}
      },
      time = 60
    },
  },







  {
    type = "technology",
    name = "panglia_worker-robots-speed",
    icons = util.technology_icon_constant_movement_speed(techicons .. "panglia_worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.40
      }
    },
    prerequisites = {"panglia_sentient_processor", "electromagnetic-science-pack"},
    unit =
    {
      count_formula = "2^(L-3)*1000",
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
        {"space-science-pack", 1},
        {"electromagnetic-science-pack", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },

  {
    type = "technology",
    name = "panglia_worker-robots-storage-1",
    icons = util.technology_icon_constant_capacity(techicons .. "panglia_worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"panglia_sentient_processor", "worker-robots-storage-3"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },

  {
    type = "technology",
    name = "panglia_worker-robots-storage-2",
    icons = util.technology_icon_constant_capacity(techicons .. "panglia_worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"panglia_worker-robots-storage-1"},
    unit =
    {
      count = 450,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1}
      },
      time = 60
    },
    upgrade = true
  },


})



if data.raw["technology"]["matter_printer-technology"] then
  table.insert(data.raw["technology"]["matter_printer-technology"].prerequisites, "panglia_advanced_optics_nanotech")
  table.insert(data.raw["technology"]["matter_printer-technology"].prerequisites, "panglia_panglite_fiber")
  table.insert(data.raw["technology"]["matter_printer-technology"].effects, {type = "unlock-recipe", recipe = "panglia_universe_precursor"})
end

if data.raw["technology"]["cloning-vat-technology"] then
 table.insert(data.raw["technology"]["cloning-vat-technology"].prerequisites, "panglia_branbalite_slurry")
 table.insert(data.raw["technology"]["panglia_simulation_chamber"].prerequisites, "cloning-vat-technology")
end

if data.raw["technology"]["thinking-brain-technology"] then
  data.raw["technology"]["thinking-brain-technology"].prerequisites = {"panglia_simulation_matrix"}
end



if mods["moshine"] then
  table.insert(data.raw["technology"]["panglia_advanced_optics_nanotech"].prerequisites, "planet-discovery-moshine")
  data.raw["technology"]["panglia_advanced_optics_nanotech"].research_trigger = {
    type = "craft-item",
    item = "glass",
    count = 10
  }
end



--if mods["moshine"] then
--  table.insert(data.raw["technology"]["panglia_planet_discovery_panglia"].prerequisites, "panglia_simulation_matrix")
--end