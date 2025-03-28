local building_scale = 0.4

--local connector_template = table.deepcopy(universal_connector_template)
--for _, v in pairs(connector_template) do
--  if v.scale then
--    v.scale = v.scale*0.8
--  end
--end
--print("=================================")
--print(serpent.block(connector_template))
--print("=================================")

local conn_offset = util.by_pixel(-5, -6)
local circuit_connector_def = 
{variation=9, main_offset=conn_offset, shadow_offset=conn_offset, show_shadow=true}
---------------- Cat Trap Building ----------------
local cat_trap =
{
  type = "assembling-machine",
  name = "cat-trap",
  icon = "__kittycat__/graphics/cat-trap.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
  minable = {mining_time = 0.2, result = "cat-trap"},
  max_health = 120,
  energy_usage = "1MW",
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 2 }
  },
  crafting_speed = 1,
  crafting_categories = {"cat-luring"},
  module_slots = 2,
  allowed_effects = {"speed", "consumption", "pollution", "productivity"},
  allowed_module_categories = {"speed", "efficiency"},

  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  --circuit_connector = circuit_connector_definitions.create_vector(connector_template,
  circuit_connector = circuit_connector_definitions.create_vector(universal_connector_template,
    {
      circuit_connector_def,
      circuit_connector_def,
      circuit_connector_def,
      circuit_connector_def,
    }),
  corpse = "cat-trap-remnants",
  dying_explosion = "wooden-chest-explosion",
  collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  icon_draw_specification = {scale = 0.7},
  graphics_set =
  {
    -- TODO Make animation of laser under box
    animation =
    {
      layers =
      {
        {
          filename = "__kittycat__/graphics/cat-trap.png",
          width = 112,
          height = 95,
          frame_count = 1,
          priority = "high",
          scale = building_scale
        },
        {
          filename = "__kittycat__/graphics/cat-trap-shadow.png",
          priority = "high",
          width = 76,
          height = 50,
          shift = util.by_pixel(12, 8),
          draw_as_shadow = true,
          scale = building_scale
        }
      }
    }
  },
}

local cat_trap_remnants =
{
  type = "corpse",
  name = "cat-trap-remnants",
  icon = "__kittycat__/graphics/cat-trap.png",
  hidden_in_factoriopedia = true,
  flags = {"placeable-neutral", "not-on-map"},
  --subgroup = "assembling-machine-remnants",
  animation =
  {
    filename = "__kittycat__/graphics/cat-trap-remnants.png",
    line_length = 1,
    width = 110,
    height = 95,
    direction_count = 1,
    shift = util.by_pixel(7.5, -1),
    scale = building_scale
  }
}

data:extend({cat_trap, cat_trap_remnants})
