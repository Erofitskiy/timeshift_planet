


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
  data.raw.item["cloning-vat"].order = "b[cloning-vat]"
end
if data.raw.item["thinking-brain"] then
	data.raw.item["thinking-brain"].subgroup = "panglia-production-machine"
  data.raw.item["thinking-brain"].order = "e[universe_precursor]"
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