--require("scripts.init")


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

            if inventory and inventory.can_insert{name = "timeshift_module"} then
                inventory.insert{name = "timeshift_hidden_beacon_module", count = 1}
            else
                log("Could not insert timeshift_module into timeshift_beacon at position " .. serpent.line(entity.position))
            end
        end
    end
end)