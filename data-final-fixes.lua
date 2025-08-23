

for i, inserter in pairs(data.raw["inserter"]) do
  if not string.find(inserter.name, "_panglia_fast_version") then
    local newinserter = table.deepcopy(inserter)
    newinserter.name = inserter.name .. "_panglia_fast_version"
    --newinserter.original_name = inserter.name
    newinserter.localised_name = {"entity-name." .. inserter.name}
    newinserter.localised_description = {"entity-name." .. inserter.name}
    newinserter.rotation_speed = inserter.rotation_speed * beacon_multiplier
    newinserter.extension_speed = inserter.extension_speed * beacon_multiplier
    if inserter.minable and inserter.minable.result then
      newinserter.placeable_by = {item = inserter.minable.result, count = 1}
    end
    data:extend({newinserter})
  end
end

for i, belt in pairs(data.raw["transport-belt"]) do
  if not string.find(belt.name, "_panglia_fast_version") then
    local newbelt = table.deepcopy(belt)
    newbelt.name = belt.name .. "_panglia_fast_version"
    --newbelt.original_name = belt.name
    newbelt.localised_name = {"entity-name." .. belt.name}
    newbelt.localised_description = {"entity-name." .. belt.name}
    newbelt.speed = belt.speed * beacon_multiplier
    if belt.minable and belt.minable.result then
      newbelt.placeable_by = {item = belt.minable.result, count = 1}
    end
    data:extend({newbelt})
  end
end

for i, belt in pairs(data.raw["underground-belt"]) do
  if not string.find(belt.name, "_panglia_fast_version") then
    local newbelt = table.deepcopy(belt)
    newbelt.name = belt.name .. "_panglia_fast_version"
    --newbelt.original_name = belt.name
    newbelt.localised_name = {"entity-name." .. belt.name}
    newbelt.localised_description = {"entity-name." .. belt.name}
    newbelt.speed = belt.speed * beacon_multiplier
    if belt.minable and belt.minable.result then
      newbelt.placeable_by = {item = belt.minable.result, count = 1}
    end
    data:extend({newbelt})
  end
end

for i, belt in pairs(data.raw["splitter"]) do
  if not string.find(belt.name, "_panglia_fast_version") then
    local newbelt = table.deepcopy(belt)
    newbelt.name = belt.name .. "_panglia_fast_version"
    --newbelt.original_name = belt.name
    newbelt.localised_name = {"entity-name." .. belt.name}
    newbelt.localised_description = {"entity-name." .. belt.name}
    newbelt.speed = belt.speed * beacon_multiplier
    if belt.minable and belt.minable.result then
      newbelt.placeable_by = {item = belt.minable.result, count = 1}
    end
    data:extend({newbelt})
  end
end