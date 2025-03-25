require("prototypes.technologies")
require("prototypes.items")
require("prototypes.units")
require("prototypes.recipies")

---------------- OPTIONAL Easter Egg Conent ----------------
if settings.startup["kittycat-easter-egg"].value then
  local cat_item = data.raw["item"].cat
  local cat_recipe = data.raw["recipe"]["zcat-luring"]
  --cat_item.weight = 1 * tons / 100 / 3
  cat_item.rocket_launch_products = {{type="module", name="mouse", amount=1}}
  cat_item.send_to_orbit_mode = "automated"
  table.insert(cat_recipe.allowed_module_categories, "mouse")
  ---------------- Mouse Module ----------------
  local mouse_module = {
    type = "module",
    name = "mouse",
    icon = "__kittycat__/graphics/mouse.png",
    tier=1,
    icon_size = 64,
    stack_size = 50,
    subgroup="module",
    category="mouse",
    order = "z",
    hidden = true,
    effect = { speed = 2.5, productivity = 2.5},
    --limitation = {"zcat-luring"},
    --limitation_message_key="cat_luring_only"
  }
  local mouse_mod_type = {
    type = "module-category",
    name = "mouse",
    hidden = true
  }
  data:extend({mouse_module, mouse_mod_type})
end
