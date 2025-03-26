cat_scale = 0.15
cat_tint1 = {r = 0.56, g = 0.46, b = 0.42, a = 0.65}
cat_tint2 = {r = 1, g = 0.63, b = 0, a = 0.4}

---------------- Cat Animations ----------------
function catrunanimation(scale, tint1, tint2)
  return {
    layers = {
      {
        width = 512,
        height = 300,
        frame_count = 5,
        direction_count = 16,
        animation_speed = 0.3,
        shift = {scale * 0.714844, scale * -0.246094},
        scale = scale,
        stripes = {
          {
            filename = "__kittycat__/graphics/cat_hr.png",
            width_in_frames = 8,
            height_in_frames = 10
          }
        }
      }
    }
  }
end

function catattackanimation(scale, tint1, tint2)
  return {
    layers = {
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-attack-1.png",
          "__base__/graphics/entity/biter/biter-attack-2.png",
          "__base__/graphics/entity/biter/biter-attack-3.png",
          "__base__/graphics/entity/biter/biter-attack-4.png"
        },
        slice = 11,
        lines_per_file = 4,
        line_length = 16,
        width = 182,
        height = 176,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(-2, -26), scale),
        scale = scale,
      },
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-attack-mask1-1.png",
          "__base__/graphics/entity/biter/biter-attack-mask1-2.png",
          "__base__/graphics/entity/biter/biter-attack-mask1-3.png",
          "__base__/graphics/entity/biter/biter-attack-mask1-4.png"
        },
        slice = 11,
        lines_per_file = 4,
        flags = {"mask"},
        line_length = 16,
        width = 178,
        height = 144,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(0, -42), scale),
        scale = scale,
        tint = tint1,
      },
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-attack-mask2-1.png",
          "__base__/graphics/entity/biter/biter-attack-mask2-2.png",
          "__base__/graphics/entity/biter/biter-attack-mask2-3.png",
          "__base__/graphics/entity/biter/biter-attack-mask2-4.png"
        },
        slice = 11,
        lines_per_file = 4,
        flags = {"mask"},
        line_length = 16,
        width = 182,
        height = 144,
        frame_count = 11,
        direction_count = 16,
        animation_speed = 0.4,
        shift = util.mul_shift(util.by_pixel(-2, -42), scale),
        scale = scale,
        tint = tint2,
      },
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-attack-shadow-1.png",
          "__base__/graphics/entity/biter/biter-attack-shadow-2.png",
          "__base__/graphics/entity/biter/biter-attack-shadow-3.png",
          "__base__/graphics/entity/biter/biter-attack-shadow-4.png"
        },
        slice = 11,
        lines_per_file = 4,
        line_length = 16,
        width = 240,
        height = 128,
        frame_count = 11,
        shift = util.mul_shift(util.by_pixel(30, 0), scale),
        direction_count = 16,
        animation_speed = 0.4,
        scale = scale,
        draw_as_shadow = true,
      }
    }
  }
end

function catdieanimation(scale, tint1, tint2)
  return {
    layers = {
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-die-01.png",
          "__base__/graphics/entity/biter/biter-die-02.png",
          "__base__/graphics/entity/biter/biter-die-03.png",
          "__base__/graphics/entity/biter/biter-die-04.png",
          "__base__/graphics/entity/biter/biter-die-05.png",
          "__base__/graphics/entity/biter/biter-die-06.png",
          "__base__/graphics/entity/biter/biter-die-07.png",
          "__base__/graphics/entity/biter/biter-die-08.png",
          "__base__/graphics/entity/biter/biter-die-09.png",
          "__base__/graphics/entity/biter/biter-die-10.png",
          "__base__/graphics/entity/biter/biter-die-11.png",
          "__base__/graphics/entity/biter/biter-die-12.png",
          "__base__/graphics/entity/biter/biter-die-13.png",
          "__base__/graphics/entity/biter/biter-die-14.png",
          "__base__/graphics/entity/biter/biter-die-15.png",
          "__base__/graphics/entity/biter/biter-die-16.png",
          "__base__/graphics/entity/biter/biter-die-17.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 276,
        height = 202,
        frame_count = 17,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -4), scale),
        scale = scale,
      },
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-die-mask1-01.png",
          "__base__/graphics/entity/biter/biter-die-mask1-02.png",
          "__base__/graphics/entity/biter/biter-die-mask1-03.png",
          "__base__/graphics/entity/biter/biter-die-mask1-04.png",
          "__base__/graphics/entity/biter/biter-die-mask1-05.png",
          "__base__/graphics/entity/biter/biter-die-mask1-06.png",
          "__base__/graphics/entity/biter/biter-die-mask1-07.png",
          "__base__/graphics/entity/biter/biter-die-mask1-08.png",
          "__base__/graphics/entity/biter/biter-die-mask1-09.png",
          "__base__/graphics/entity/biter/biter-die-mask1-10.png",
          "__base__/graphics/entity/biter/biter-die-mask1-11.png",
          "__base__/graphics/entity/biter/biter-die-mask1-12.png",
          "__base__/graphics/entity/biter/biter-die-mask1-13.png",
          "__base__/graphics/entity/biter/biter-die-mask1-14.png",
          "__base__/graphics/entity/biter/biter-die-mask1-15.png",
          "__base__/graphics/entity/biter/biter-die-mask1-16.png",
          "__base__/graphics/entity/biter/biter-die-mask1-17.png"
        },
        slice = 4,
        lines_per_file = 4,
        flags = {"mask"},
        line_length = 4,
        width = 198,
        height = 166,
        frame_count = 17,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(0, -22), scale),
        scale = scale,
        tint = tint1,
      },
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-die-mask2-01.png",
          "__base__/graphics/entity/biter/biter-die-mask2-02.png",
          "__base__/graphics/entity/biter/biter-die-mask2-03.png",
          "__base__/graphics/entity/biter/biter-die-mask2-04.png",
          "__base__/graphics/entity/biter/biter-die-mask2-05.png",
          "__base__/graphics/entity/biter/biter-die-mask2-06.png",
          "__base__/graphics/entity/biter/biter-die-mask2-07.png",
          "__base__/graphics/entity/biter/biter-die-mask2-08.png",
          "__base__/graphics/entity/biter/biter-die-mask2-09.png",
          "__base__/graphics/entity/biter/biter-die-mask2-10.png",
          "__base__/graphics/entity/biter/biter-die-mask2-11.png",
          "__base__/graphics/entity/biter/biter-die-mask2-12.png",
          "__base__/graphics/entity/biter/biter-die-mask2-13.png",
          "__base__/graphics/entity/biter/biter-die-mask2-14.png",
          "__base__/graphics/entity/biter/biter-die-mask2-15.png",
          "__base__/graphics/entity/biter/biter-die-mask2-16.png",
          "__base__/graphics/entity/biter/biter-die-mask2-17.png"
        },
        slice = 4,
        lines_per_file = 4,
        flags = {"mask"},
        line_length = 4,
        width = 200,
        height = 166,
        frame_count = 17,
        direction_count = 16,
        shift = util.mul_shift(util.by_pixel(-2, -22), scale),
        scale = scale,
        tint = tint2,
      },
      {
        filenames = {
          "__base__/graphics/entity/biter/biter-die-shadow-01.png",
          "__base__/graphics/entity/biter/biter-die-shadow-02.png",
          "__base__/graphics/entity/biter/biter-die-shadow-03.png",
          "__base__/graphics/entity/biter/biter-die-shadow-04.png",
          "__base__/graphics/entity/biter/biter-die-shadow-05.png",
          "__base__/graphics/entity/biter/biter-die-shadow-06.png",
          "__base__/graphics/entity/biter/biter-die-shadow-07.png",
          "__base__/graphics/entity/biter/biter-die-shadow-08.png",
          "__base__/graphics/entity/biter/biter-die-shadow-09.png",
          "__base__/graphics/entity/biter/biter-die-shadow-10.png",
          "__base__/graphics/entity/biter/biter-die-shadow-11.png",
          "__base__/graphics/entity/biter/biter-die-shadow-12.png",
          "__base__/graphics/entity/biter/biter-die-shadow-13.png",
          "__base__/graphics/entity/biter/biter-die-shadow-14.png",
          "__base__/graphics/entity/biter/biter-die-shadow-15.png",
          "__base__/graphics/entity/biter/biter-die-shadow-16.png",
          "__base__/graphics/entity/biter/biter-die-shadow-17.png"
        },
        slice = 4,
        lines_per_file = 4,
        line_length = 4,
        width = 282,
        height = 192,
        frame_count = 17,
        shift = util.mul_shift(util.by_pixel(4, 0), scale),
        direction_count = 16,
        scale = scale,
        draw_as_shadow = true,
      }
    }
  }
end


---------------- Cat Unit ----------------
local collision_mask = {not_colliding_with_itself = true,
  layers = {is_object = true}
}
--if settings.startup["kittycat-collision-player"].value then
--    collision_mask.layers.player = true
--end
collision_mask.layers.player = true
if settings.startup["kittycat-collision-trains"].value then
  collision_mask.layers.train = true
end

local cat_unit = {
  type = "unit",
  name = "cat",
  icon = "__kittycat__/graphics/cat_icon.png",
  icon_size = 128,
  flags = {
    "placeable-player",
    "placeable-off-grid",
    "breaths-air",
    "player-creation",
  },
  collision_box = {{-0.2, -0.6}, {0.4, 0.6}},
  selection_box = {{-0.3, -0.7}, {0.5, 0.7}},
  collision_mask = collision_mask,
  min_pursue_time = 10 * 60,
  max_pursue_distance = 80,
  max_health = 675,
  minable = {mining_time = 1, result = "cat"},
  distance_per_frame = 0.1,
  movement_speed = 0.2,
  healing_per_tick = 0.02,
  distraction_cooldown = 300,
  dying_explosion = "blood-explosion-small",
  can_open_gates = true,
  affected_by_tiles= true,
  vision_distance = 30,
  run_animation = catrunanimation(cat_scale, cat_tint1, cat_tint2),
  working_sound = {
    sound = {
      filename = "__kittycat__/sound/meow3.ogg",
      volume = 0.5,
      aggregation = {max_count = 1, count_already_playing = true, remove = true}
    },
    --idle_sound = {filename = "__kittycat__/sound/meow1.ogg", volume = 0.5},
    probability = 1 / (40 * 60) -- average cat meow every 40 seconds
  },
  attack_parameters = {
    type = "projectile",
    range = 0.5,
    cooldown = 35,
    ammo_type = {
      target_type = "entity",
      action = {
        type = "direct",
        action_delivery = {
          type = "instant",
          target_effects = {
            type = "damage",
            damage = {amount = 30 , type = "physical"}
          }
        }
      }
    },
    ammo_category = "melee",
    animation = catattackanimation(cat_scale, cat_tint1, cat_tint2),
    sound = {
      filename = "__kittycat__/sound/cat_hiss.ogg",
      volume = 0.5,
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    }
  }
}

if settings.startup["kittycat-cat-belt-immunity"].value then
  cat_unit.has_belt_immunity = true
end

data:extend({cat_unit})
