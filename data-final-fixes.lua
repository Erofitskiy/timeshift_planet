

for i, inserter in pairs(data.raw["inserter"]) do
  if not string.find(inserter.name, "_panglia_fast_version") then
    local newinserter = table.deepcopy(inserter)
    newinserter.name = inserter.name .. "_panglia_fast_version"
    newinserter.hidden = true
    newinserter.rotation_speed = inserter.rotation_speed * beacon_multiplier
    newinserter.extension_speed = inserter.extension_speed * beacon_multiplier
    data:extend({newinserter})
  end
end