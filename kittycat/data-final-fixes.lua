-- This is performed here, in case other mods added any new damage types
if settings.startup["kcat-invincible-cats"].value then
  -- Make our cats very, very hard to kill
  local cat_unit = data.raw["unit"]["kcat-cat"]

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

-- plz no recycle kthx
if mods["quality"] then
  data.raw["recipe"]["kcat-cat-recycling"] = nil
end

-- As of Factorio 2.0, we can no longer have a module (or module category) be disallowed in a
-- recipe (or machine) by default, nor can it be blacklisted. This means we need to go through
-- every machine and specifically add whitelists to them that include everything BUT the mouse
-- module category.
if settings.startup["kcat-easter-egg"].value then
  local module_categories = {}
  for cname, _ in pairs(data.raw["module-category"]) do
    if cname ~= "kcat-mouse" then
      table.insert(module_categories, cname)
    end
  end

  local machine_types = {"assembling-machine", "furnace", "lab", "beacon", "mining-drill", "rocket-silo"}
  for _, machine_type in pairs(machine_types) do
    for mname, machine in pairs(data.raw[machine_type]) do
      if not machine.allowed_module_categories then
        machine.allowed_module_categories = module_categories
      end
      if mname ~= "kcat-cat-trap" then
        -- In case someone else has done this already and added our category
        machine.allowed_module_categories["kcat-mouse"] = nil
      end
    end
  end
end
