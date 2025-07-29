--require("scripts.init")

script.on_load(function()
    if not global then global = {} end
    if not global.timeshift_generators then
        global.timeshift_generators = {}
    end
end)

script.on_event(defines.events.on_chunk_generated, function(event)
    local surface = event.surface
    local area = event.area

    -- Find all entities in the new chunk
    local entities = surface.find_entities_filtered{area = area}

    for _, entity in pairs(entities) do
        -- Check if the entity is a timeshift_beacon
        if entity.name == "timeshift_hidden_beacon" then
            -- Check if the entity has an inventory
            local inventory = entity.get_module_inventory() -- Assuming it's a chest-type inventory

            if inventory and inventory.can_insert{name = "timeshift_hidden_beacon_module"} then
                inventory.insert{name = "timeshift_hidden_beacon_module", count = 1}
            else
                log("Could not insert timeshift_module into timeshift_beacon at position " .. serpent.line(entity.position))
            end
        --[[elseif entity.name == "timeshift_energy_roots" then
            entity.destructible = false
            entity.minable = false
            local spawner = surface.create_entity{name = "timeshift_energy_roots_hidden_spawner", position = entity.position, force = "neutral"}
            spawner.force = game.forces.enemy
            spawner.destructible = false
            --entity.operable = false
            game.print("" .. tostring(spawner.force))]]
        end
    end



    local entities = surface.find_entities_filtered{area = area, name = "timeshift_energy_roots"}

    for _, entity in pairs(entities) do
        if entity.valid then
            table.insert(global.timeshift_generators, {
                entity = entity,
                last_energy = entity.energy or 0,
                cooldown = 0,
            })
        end
    end


end)

local function find_valid_position_around(surface, center, radius)
    for _ = 1, 20 do  -- Try 20 random spots
        local angle = math.random() * math.pi * 2
        local r = math.random() * radius
        local x = center.x + math.cos(angle) * r
        local y = center.y + math.sin(angle) * r
        local pos = {x = x, y = y}
        if surface.can_place_entity{name="timeshift_energy_roots_tesla_turret", position=pos} then
            return pos
        end
    end
    return nil
end
--[[
script.on_event(defines.events.on_chunk_generated, function(event)
    local surface = event.surface
    local area = event.area
    local entities = surface.find_entities_filtered{area = area, name = "timeshift_energy_roots"}

    for _, entity in pairs(entities) do
        if entity.valid then
            table.insert(global.timeshift_generators, {
                entity = entity,
                last_energy = entity.energy or 0,
                cooldown = 0,
            })
        end
    end
end)]]


script.on_nth_tick(300, function()
    if not global.timeshift_generators then return end  -- Prevent crash
    for i, data in pairs(global.timeshift_generators) do
        local entity = data.entity
        if not (entity and entity.valid) then
            table.remove(global.timeshift_generators, i)
        else
            local current_energy = entity.energy
            game.print("" .. current_energy)
            local delta = current_energy - data.last_energy

            -- Optional: clamp to prevent noise or recharge spikes
            if delta < -1000 then  -- Large energy output (used)
                -- Check cooldown
                if data.cooldown <= 0 then
                    -- Try to place turret nearby
                    local surface = entity.surface
                    local pos = find_valid_position_around(surface, entity.position, 10)

                    if pos then
                        local turret = surface.create_entity{
                            name = "timeshift_energy_roots_tesla_turret",
                            position = pos,
                            force = entity.force
                        }
                        turret.force = game.forces.enemy
                        data.cooldown = 1800  -- 30 seconds
                    end
                end
            end

            -- Update
            data.last_energy = current_energy
            data.cooldown = math.max(0, (data.cooldown or 0) - 600)
        end
    end
end)