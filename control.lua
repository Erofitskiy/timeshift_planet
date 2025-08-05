local seconds_interval = 15
local number_of_turret_vars = 8


script.on_event(defines.events.on_chunk_generated, function(event)
    local surface = event.surface
    local area = event.area

    -- Find all entities in the new chunk
    local entities = surface.find_entities_filtered{area = area}

    for _, entity in pairs(entities) do
        if entity.valid then
            if entity.name == "timeshift_hidden_beacon" then
                local inventory = entity.get_module_inventory()
                if inventory and inventory.can_insert{name = "timeshift_hidden_beacon_module"} then
                    inventory.insert{name = "timeshift_hidden_beacon_module", count = 1}
                else
                    log("Could not insert timeshift_module into timeshift_beacon at position " .. serpent.line(entity.position))
                end
            elseif entity.name == "timeshift_energy_roots" then
                if not storage.timeshift_generators then storage.timeshift_generators = {} end
                table.insert(storage.timeshift_generators, {
                    entity = entity,
                })
                local rand = math.random(0, 1)
                if rand == 0 then entity.direction = defines.direction.north else entity.direction = defines.direction.east end
            end
        end
    end
end)


local function try_place_from_radius(surface, center, radius_min, radius_max, name)
    for radius = radius_min, radius_max do
        local attempts = 8 + math.floor(radius / 2)  -- More attempts for larger rings
        for i = 1, attempts do
            local angle = math.random() * math.pi * 2
            local r = radius + math.random()  -- Slight jitter to avoid perfect circle clumping
            local pos = {
                x = center.x + math.cos(angle) * r,
                y = center.y + math.sin(angle) * r
            }

            if surface.can_place_entity{name = name, position = pos} then
                return pos
            end
        end
    end
    return nil
end

local function try_place_or_force_clear_turret(surface, center)
    local maxradius = 20
    local pos = try_place_from_radius(surface, center, 2, maxradius, "timeshift_energy_roots_tesla_turret_1")
    if pos then
        return pos
    else
        local candidates = surface.find_entities_filtered{
            area = {
                {center.x - maxradius, center.y - maxradius},
                {center.x + maxradius, center.y + maxradius}
            },
        }

        -- Filter out protected types
        for _, entity in pairs(candidates) do
            if entity.valid and entity.name ~= "timeshift_energy_roots" and not string.find(entity.name, "timeshift_energy_roots_tesla_turret") and entity.name ~= "character" then
                local pos = entity.position
                entity.destroy({do_cliff_correction = true, raise_destroy = true})
                --return pos
            end
        end
    end

    -- Still nothing
    return nil
end


script.on_nth_tick(seconds_interval * 60, function()
    if not storage.timeshift_generators then storage.timeshift_generators = {} end
    for i, data in pairs(storage.timeshift_generators) do
        local entity = data.entity
        if not (entity and entity.valid) then
            table.remove(storage.timeshift_generators, i)
        elseif entity.energy_generated_last_tick and entity.energy_generated_last_tick > 10 then
            local surface = entity.surface
            local pos = try_place_or_force_clear_turret(surface, entity.position)
            if pos then
                local turrNum = math.random(1, number_of_turret_vars)
                local turret = surface.create_entity{
                    name = "timeshift_energy_roots_tesla_turret_" .. turrNum,
                    position = pos,
                    force = entity.force
                }
                turret.force = game.forces.enemy
            end
        end
    end
end)