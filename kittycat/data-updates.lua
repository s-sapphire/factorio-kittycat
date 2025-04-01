local function add_ingredient(recipe_name, ingredient)
  local recipe = data.raw.recipe[recipe_name]
  if recipe.normal ~= nil then
    table.insert(recipe.normal.ingredients, ingredient)
  end
  if recipe.expensive ~= nil then
    table.insert(recipe.expensive.ingredients, ingredient)
  end
  if recipe.ingredients ~= nil then
    table.insert(recipe.ingredients, ingredient)
  end
end


if settings.startup["kcat-cat-for-space"].value then
  if mods["space-age"] then
    add_ingredient("space-platform-starter-pack", {type="item", name="kcat-cat", amount=1})
  else
    add_ingredient("satellite", {type="item", name="kcat-cat", amount=1})
  end
end
