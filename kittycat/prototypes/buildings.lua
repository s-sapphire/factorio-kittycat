---------------- Cat Trap Building ----------------
local cat_trap = {
  type = "assembling-machine",
  name = "cat-trap",
  icon = "__kittycat__/graphics/cat_trap.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
  minable = {mining_time = 0.2, result = "cat-trap"},
  max_health = 120,
  energy_usage = "1MW",
  energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 2 }
  },
  crafting_speed = 1,
  crafting_categories = {"cat-luring"},
  module_slots = 2,
  allowed_effects = {"speed", "consumption", "pollution", "productivity"},
  allowed_module_categories = {"speed", "efficiency", "mouse"},

  -- TODO make corpse graphic
  --corpse = "__base__/graphics/entity/wooden-chest/remnants/wooden-chest-remnants.png",
  corpse = "wooden-chest-remnants",
  dying_explosion = "wooden-chest-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  icon_draw_specification = {scale = 0.7},
  graphics_set =
  {
    -- TODO Make animation of laser under box
    animation = {
      layers =
      {
        {
          filename = "__kittycat__/graphics/cat_trap.png",
          width = 112,
          height = 95,
          frame_count = 1,
          priority = "high",
          shift = util.by_pixel(0.5, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/wooden-chest/wooden-chest-shadow.png",
          priority = "high",
          width = 104,
          height = 40,
          shift = util.by_pixel(10, 6.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    }
  },
}

data:extend({cat_trap})
