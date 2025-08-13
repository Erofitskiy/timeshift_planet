


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
    prerequisites = {"panglia_planet_discovery_panglia", "planet-discovery-moshine"},
    research_trigger =
    {
      type = "craft-item",
      item = "glass",
      count = 10
    }
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
    prerequisites = {"panglia_panglite_multiplication"},
    research_trigger =
    {
      type = "craft-item",
      item = "panglia_panglite",
      count = 50,
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
    prerequisites = {"panglia_dna_manipulation", "matter_printer-technology"},
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