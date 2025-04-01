---------------- Cat Recipe ----------------
local recipe_category =
{
  type = "recipe-category",
  name = "kcat-cat-luring"
}

local cat_recipe =
{
  type = "recipe",
  name = "kcat-cat-luring",
  allow_productivity = true,
  allowed_module_categories = {"speed", "efficiency"},
  show_amount_in_title = false,
  enabled = false,
  allow_quality = false,
  auto_recycle = false,
  energy_required = 300, --Time needed to craft
  order = "z",
  --category = "crafting-with-fluid",
  category = "kcat-cat-luring",
  results = {{type="item", name="kcat-cat", amount=1,probability=0.5}},
  ingredients =
  {
    --{type="fluid", name="water",amount=200}, 
    {type="item", name="raw-fish",amount=5}, 
    {type="item", name="laser-turret",amount=1},
    {type="item", name="programmable-speaker",amount=1},
    {type="item", name="wooden-chest",amount=1},
    {type="item", name="stone", amount=10}
  },
}

if mods["space-age"] then
  cat_recipe.surface_conditions =
  {
    {
      property = "pressure",
      min = 100
    }
  }
end

local cat_trap_recipe =
{
  type = "recipe",
  name = "kcat-cat-trap",
  results = {{type="item", name="kcat-cat-trap", amount=1}},
  ingredients =
  {
    {type="item", name="wooden-chest", amount=1},
    {type="item", name="iron-stick", amount=1}
  }
}

data:extend({recipe_category, cat_recipe, cat_trap_recipe})
