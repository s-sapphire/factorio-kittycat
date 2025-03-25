---------------- Cat Item ----------------
local cat_item = {
  type = "item",
  name = "cat",
  icon = "__kittycat__/graphics/cat_icon.png",
  icon_size = 128,
  stack_size = 1,
  flags = {"not-stackable"},
  place_result = "cat",
  subgroup="defensive-structure",
}

data:extend({cat_item})
