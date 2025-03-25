---------------- Cat Recipe ----------------
local cat_recipe = {
  type = "recipe",
  name = "zcat-luring",
  allow_productivity = true,
  allowed_module_categories = {"speed", "efficiency"},
  show_amount_in_title = false,
  enabled = false,
  energy_required = 300, --Time needed to craft
  order = "z",
  category = "crafting-with-fluid",
  results = {{type="item", name="cat", amount=1,probability=0.35}},
  ingredients = {
    {type="fluid", name="water",amount=200}, 
    {type="item", name="raw-fish",amount=20}, 
    {type="item", name="laser-turret",amount=1},
    {type="item", name="programmable-speaker",amount=1},
    {type="item", name="wooden-chest",amount=1},
    {type="item", name="stone", amount=10}
  },
}

if mods["space-age"] then
  cat_recipe.surface_conditions = {
    {
      property = "pressure",
      min = 100
    }
  }
end

data:extend({cat_recipe})
