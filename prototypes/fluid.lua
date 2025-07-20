data:extend({
  {
    type = "fluid",
    name = "nanobots_hive",
    subgroup = "timeshift-processes",
    default_temperature = 15,
    max_temperature = 5000,
    heat_capacity = "0.2kJ",
    icon = icons .. "nanobots_hive.png",
    base_color = {0.5, 0.5, 0.5},
    flow_color = {1.0, 1.0, 1.0},
    order = "a[fluid]-a[water]-c[nanobots_hive]",
    gas_temperature = 15,
    auto_barrel = false
  },

})
