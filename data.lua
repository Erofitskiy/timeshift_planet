planet_name = "timeshift"
icons = "__timeshift_planet__/graphics/icons/"
entity = "__timeshift_planet__/graphics/entity/"
techicons = "__timeshift_planet__/graphics/technology/"



require "prototypes_planet.hidden_beacon"
require "prototypes_planet.terrain"
require "prototypes_planet.decoratives"
require "prototypes_planet.planet"



require "prototypes.technology"
require "prototypes.items_recipes"
--require "prototypes.nano_forge"
require "prototypes.simulation_chamber"
require "prototypes.compatibility"




if data.raw["agricultural-tower"]["processing-grid"] and data.raw["agricultural-tower"]["processing-grid"].accepted_seeds then
	table.insert(data.raw["agricultural-tower"]["processing-grid"].accepted_seeds, "datacell-dna-raw")
end
