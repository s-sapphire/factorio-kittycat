require("prototypes.technologies")
require("prototypes.items")
require("prototypes.units")
require("prototypes.buildings")
require("prototypes.recipes")

---------------- OPTIONAL Easter Egg Content ----------------
if settings.startup["kcat-easter-egg"].value then
  local cat_item = data.raw["item"]["kcat-cat"]

  local cat_recipe = data.raw["recipe"]["kcat-cat-luring"]
  cat_item.rocket_launch_products = {{type="module", name="kcat-mouse", amount=1}}
  cat_item.send_to_orbit_mode = "automated"
  table.insert(cat_recipe.allowed_module_categories, "kcat-mouse")

  local cat_trap = data.raw["assembling-machine"]["kcat-cat-trap"]
  table.insert(cat_trap.allowed_module_categories, "kcat-mouse")

  ---------------- Mouse Module ----------------
  local mouse_module =
  {
    type = "module",
    name = "kcat-mouse",
    icon = "__kittycat__/graphics/mouse.png",
    tier=1,
    icon_size = 64,
    stack_size = 50,
    subgroup="module",
    category="kcat-mouse",
    order = "z",
    hidden = true,
    effect = { speed = 2.5, productivity = 2.5 },
  }
  local mouse_mod_type =
  {
    type = "module-category",
    name = "kcat-mouse",
    hidden = true
  }
  data:extend({mouse_mod_type, mouse_module})
end
