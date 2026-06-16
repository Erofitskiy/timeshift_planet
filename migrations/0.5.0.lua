if game.surfaces["panglia"] then
  local set = game.surfaces["panglia"].map_gen_settings
  if set and set.autoplace_settings and set.autoplace_settings["entity"] and set.autoplace_settings["entity"].settings and set.autoplace_settings["entity"].settings["panglia-huge-igneous-rock"] == nil then
    local set = game.surfaces["panglia"].map_gen_settings
    set.autoplace_settings["entity"].settings["panglia-huge-igneous-rock"] = {frequency = 1, richness = 1, size = 1}
    set.autoplace_settings["entity"].settings["panglia-big-rock"] = {frequency = 1, richness = 1, size = 1}
    game.surfaces["panglia"].map_gen_settings = set
    --game.print(serpent.block(game.surfaces["panglia"].map_gen_settings.autoplace_settings["entity"].settings["panglia-huge-igneous-rock"]))
    game.surfaces["panglia"].regenerate_entity({"panglia-huge-igneous-rock", "panglia-big-rock"})
  end
end