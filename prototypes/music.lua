local musicpath = "__Moshine-assets__/sound/ambient/moshine/"
local vol = 1.2

data:extend(
{
--- weight 10 is normal. The higher the number, the higher the probabilities to sound.

  {
    type = "ambient-sound",
    name = "Anemoia_Diorite",
    track_type = "hero-track",
    planet = "moshine",
    sound =
    {
      filename = musicpath .. "Anemoia_Diorite.ogg",
      volume = vol,
    }
  },
  {
    type = "ambient-sound",
    name = "Anemoia_5.12a",
    track_type = "interlude",
    planet = "moshine",
    sound =
    {
      filename = musicpath .. "Anemoia_5.12a.ogg",
      volume = vol,
    }
  },
  {
    type = "ambient-sound",
    name = "Anemoia_Emanate",
    track_type = "main-track",
    planet = "moshine",
    sound =
    {
      filename = musicpath .. "Anemoia_Emanate.ogg",
      volume = vol,
    }
  },
})