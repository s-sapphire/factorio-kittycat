---------------- Cat Item ----------------
local cat_item =
{
  type = "item",
  name = "cat",
  icon = "__kittycat__/graphics/cat-icon.png",
  icon_size = 128,
  stack_size = 1,
  weight = 5000,
  flags = {"not-stackable"},
  place_result = "cat",
  subgroup="defensive-structure",
}

local cat_trap_item =
{
  type = "item",
  name = "cat-trap",
  icon = "__kittycat__/graphics/cat-trap.png",
  icon_size = 95,
  stack_size = 50,
  place_result = "cat-trap",
  subgroup="defensive-structure",
}

data:extend({cat_item, cat_trap_item})
