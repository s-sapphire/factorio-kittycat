---------------- Cat Item ----------------
local cat_item =
{
  type = "item",
  name = "kcat-cat",
  icon = "__kittycat__/graphics/cat-icon.png",
  icon_size = 128,
  stack_size = 1,
  weight = 5000,
  flags = {"not-stackable"},
  place_result = "kcat-cat",
  subgroup="defensive-structure",
}

local cat_trap_item =
{
  type = "item",
  name = "kcat-cat-trap",
  icon = "__kittycat__/graphics/cat-trap.png",
  icon_size = 95,
  stack_size = 50,
  place_result = "kcat-cat-trap",
  subgroup="defensive-structure",
}

data:extend({cat_item, cat_trap_item})
