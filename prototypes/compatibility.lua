


if data.raw["agricultural-tower"]["processing-grid"] and data.raw["agricultural-tower"]["processing-grid"].accepted_seeds then
	table.insert(data.raw["agricultural-tower"]["processing-grid"].accepted_seeds, "datacell-dna-raw")
end


if data.raw.item["universe_precursor"] then
	data.raw.item["universe_precursor"].subgroup = "timeshift-processes"
  data.raw.item["universe_precursor"].order = "a[universe_precursor]"
end

if data.raw.item["matter_printer"] then
	data.raw.item["matter_printer"].subgroup = "timeshift-production-machine"
  data.raw.item["matter_printer"].order = "a[matter_printer]"
end
if data.raw.item["cloning-vat"] then
	data.raw.item["cloning-vat"].subgroup = "timeshift-production-machine"
  data.raw.item["cloning-vat"].order = "b[cloning-vat]"
end
if data.raw.item["thinking-brain"] then
	data.raw.item["thinking-brain"].subgroup = "timeshift-production-machine"
  data.raw.item["thinking-brain"].order = "e[universe_precursor]"
end

if data.raw.recipe["thinking-brain"] then
	data.raw.recipe["thinking-brain"].ingredients =
  {
    {type = "item", name = "processing-unit", amount = 10},
    {type = "item", name = "low-density-structure", amount = 5},
    {type = "item", name = "ai-tier-10", amount = 1},
    {type = "item", name = "human_body_3_genius", amount = 1},
    {type = "fluid", name = "timeshift_nutrients_slurry", amount = 150},
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
    {type = "fluid", name = "timeshift_nutrients_slurry", amount = 150},
  }
  data.raw.recipe["cloning-vat"].category = "crafting-with-fluid"
end