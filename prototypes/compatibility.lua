


if data.raw["agricultural-tower"]["processing-grid"] and data.raw["agricultural-tower"]["processing-grid"].accepted_seeds then
	table.insert(data.raw["agricultural-tower"]["processing-grid"].accepted_seeds, "datacell-dna-raw")
end


--if data.raw.item["universe_precursor"] then
--	data.raw.item["universe_precursor"].subgroup = "panglia-processes"
--  data.raw.item["universe_precursor"].order = "a[universe_precursor]"
--end

if data.raw.item["matter_printer"] then
	data.raw.item["matter_printer"].subgroup = "panglia-production-machine"
  data.raw.item["matter_printer"].order = "a[matter_printer]"
end
if data.raw.item["cloning-vat"] then
	data.raw.item["cloning-vat"].subgroup = "panglia-production-machine"
  data.raw.item["cloning-vat"].order = "c[cloning-vat]"
end
if data.raw.item["thinking-brain"] then
	data.raw.item["thinking-brain"].subgroup = "panglia-production-machine"
  data.raw.item["thinking-brain"].order = "f[universe_precursor]"
end


if data.raw.recipe["matter_printer"] then
  data.raw.recipe["matter_printer"].ingredients =
  {
    {type = "item", name = "assembling-machine-3", amount = 3},
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "productivity-module-2", amount = 10},
    {type = "item", name = "uranium-235", amount = 5},
    {type = "item", name = "panglia_panglite_fiber", amount = 5},
  }
end

if data.raw.recipe["thinking-brain"] then
	data.raw.recipe["thinking-brain"].ingredients =
  {
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "low-density-structure", amount = 5},
    {type = "item", name = "ai-tier-10", amount = 1},
    {type = "item", name = "panglia_cloned_specimen_body_3_genius", amount = 1},
    {type = "fluid", name = "panglia_branbalite_slurry", amount = 150},
  }
end

--if data.raw.technology["cloning-vat-technology"] then
--	table.insert(data.raw.technology["cloning-vat-technology"].effects, {type = "unlock-recipe", recipe = "cloning-vat"})
--end

if data.raw.recipe["cloning-vat"] then
	data.raw.recipe["cloning-vat"].ingredients = {
    {type = "item", name = "biochamber", amount = 1},
    {type = "item", name = "processing-unit", amount = 1},
    {type = "item", name = "carbon-fiber", amount = 5},
    {type = "fluid", name = "panglia_branbalite_slurry", amount = 150},
  }
  data.raw.recipe["cloning-vat"].category = "crafting-with-fluid"
end


if data.raw["assembling-machine"]["cloning-vat"] then
  table.insert(data.raw["assembling-machine"]["cloning-vat"].allowed_module_categories, "panglia_module")
end


if mods["quality-seeds"] then
  if quality_seeds and quality_seeds.ignore_plants then
    table.insert(quality_seeds.ignore_plants, "panglia_branbalite_plant")
    table.insert(quality_seeds.ignore_plants, "processing-grid-process-dna")
  end
end

if mods["snouz_better_asteroid_collector"] then
  data.raw["technology"]["snouz_better_asteroid_collector"].prerequisites = {"panglia_sentient_processor"}
  data.raw["recipe"]["snouz_better_asteroid_collector"].ingredients =
  {
    {type = "item", name = "asteroid-collector", amount = 2},
    {type = "item", name = "panglia_sentient_processor", amount = 1},
    {type = "item", name = "electric-engine-unit", amount = 6};
    {type = "fluid", name = "fluoroketone-cold", amount = 6, ignored_by_stats = 3},
  }
  data.raw["recipe"]["snouz_better_asteroid_collector"].results = {
    {type = "item", name = "snouz_better_asteroid_collector", amount = 1},
    {type = "fluid", name = "fluoroketone-hot", amount = 3, temperature = 180, ignored_by_stats = 3, ignored_by_productivity = 3}
  }
  data.raw["item"]["snouz_better_asteroid_collector"].default_import_location = "panglia"
end

if mods["snouz_long_electric_gun_turret"] then
  data.raw["recipe"]["snouz_long_electric_gun_turret"].ingredients =
  {
    {type = "item", name = "gun-turret", amount = 2},
    {type = "item", name = "supercapacitor", amount = 1},
    {type = "item", name = "radar", amount = 1},
    {type = "item", name = "panglia_panglite_fiber", amount = 5},
  }
  data.raw["item"]["snouz_long_electric_gun_turret"].default_import_location = "panglia"

  data.raw["technology"]["snouz_long_electric_gun_turret"].prerequisites = {"panglia_panglite_fiber", "electromagnetic-plant"}
  data.raw["technology"]["snouz_long_electric_gun_turret"].unit.ingredients =
  {
    {"automation-science-pack", 1},
    {"logistic-science-pack", 1},
    {"military-science-pack", 1},
    {"chemical-science-pack", 1},
    --{"production-science-pack", 1},
    {"utility-science-pack", 1},
    {"space-science-pack", 1},
    --{"metallurgic-science-pack", 1},
    {"electromagnetic-science-pack", 1},
    --{"agricultural-science-pack", 1},
    --{"cryogenic-science-pack", 1},
    --{"promethium-science-pack", 1}
  }
end