


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