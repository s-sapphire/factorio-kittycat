data:extend (
  {
    {
      type = "technology",
      name = "kcat-cat-luring",
      icon = "__kittycat__/graphics/cat-research.png",
      icon_size = 128,

      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "kcat-cat-luring"
        },
        {
          type = "unlock-recipe",
          recipe = "kcat-cat-trap"
        }
      },
      prerequisites = {"circuit-network", "laser-turret"},
      unit =
      {
        count = 75,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
        },
        time = 30
      },
      order = "c-g-a",
    },
  })
