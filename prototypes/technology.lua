local techicons = "__Moshine-assets__/graphics/technology/"


data:extend({
  {
    type = "technology",
    name = "planet-discovery-timeshift",
    icons = util.technology_icon_constant_planet(techicons .. "moshine-tech-moshine.png"),
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
})