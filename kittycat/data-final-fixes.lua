-- As of Factorio 2.0, we can no longer have a module be disallowed in a recipe
-- by default, nor can it be blacklisted, this means we need to go through every
-- recipe and specifically add whitelists to them that include everything but the
-- mouse module

--if settings.startup["kittycat-easter-egg"] then
--  local module_categories = {}
--  for _, category in pairs(data.raw["module-category"]) do
--    table.insert(module_categories, category)
--  end
--  module_categories.mouse = nil

--  for rec_name, rec in pairs(data.raw["recipe"]) do
--    if rec_name ~= "zcat-luring" then
--      print(rec_name)
--      if not rec.allowed_module_categories then
--        -- Copy the table, so any time anything else messes with it, it doesn't
--        -- mess up all recipes
--        rec.allowed_module_categories = table.deepcopy(module_categories)
--      end
--    end
--  end
--end

if settings.startup["kittycat-invincible-cats"].value then
  -- Make our cats very, very hard to kill
  local cat_unit = data.raw["unit"].cat

  cat_unit.max_health = 1000000
  cat_unit.healing_per_tick = 1000000

  local resistances = {}
  for k, _ in pairs(data.raw["damage-type"]) do
    table.insert(resistances,
      {
        type = k,
        decrease = 1000000,
        percent = 100
      })
  end
  cat_unit.resistances = resistances
end
