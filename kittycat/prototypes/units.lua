-- Used to make the "cat" (biter) attack animation
require("__base__.prototypes.entity.biter-animations")

local cat_scale = 0.15
local cat_tint1 = {r = 0.56, g = 0.46, b = 0.42, a = 0.65}
local cat_tint2 = {r = 1, g = 0.63, b = 0, a = 0.4}

---------------- Cat Animations ----------------
local cat_run_animation = 
{
  layers =
  {
    {
      width = 512,
      height = 300,
      frame_count = 5,
      direction_count = 16,
      animation_speed = 0.3,
      shift = {cat_scale * 0.714844, cat_scale * -0.246094},
      scale = cat_scale,
      stripes =
      {
        {
          filename = "__kittycat__/graphics/cat_hr.png",
          width_in_frames = 8,
          height_in_frames = 10
        }
      }
    }
  }
}

---------------- Cat Unit ----------------
local collision_mask = {not_colliding_with_itself = true,
  layers = {is_object = true}
}
--if settings.startup["kittycat-collision-player"].value then
--  collision_mask.layers.player = true
--end
collision_mask.layers.player = true
if settings.startup["kittycat-collision-trains"].value then
  collision_mask.layers.train = true
end

local cat_unit =
{
  type = "unit",
  name = "cat",
  icon = "__kittycat__/graphics/cat_icon.png",
  icon_size = 128,
  flags =
  {
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
  affected_by_tiles= true,
  vision_distance = 30,
  run_animation = cat_run_animation,
  working_sound =
  {
    sound =
    {
      filename = "__kittycat__/sound/meow3.ogg",
      volume = 0.5,
      aggregation = {max_count = 1, count_already_playing = true, remove = true}
    },
    --idle_sound = {filename = "__kittycat__/sound/meow1.ogg", volume = 0.5},
    probability = 1 / (40 * 60) -- average cat meow every 40 seconds
  },
  attack_parameters =
  {
    type = "projectile",
    range = 0.5,
    cooldown = 35,
    ammo_type =
    {
      target_type = "entity",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            type = "damage",
            damage = {amount = 30 , type = "physical"}
          }
        }
      }
    },
    ammo_category = "melee",
    -- TODO make custom animations
    animation = biterattackanimation(small_biter_scale/2, cat_tint1, cat_tint2),
    sound =
    {
      filename = "__kittycat__/sound/cat_hiss.ogg",
      volume = 0.5,
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    }
  }
}

---------------- OPTIONAL Features ----------------
if settings.startup["kittycat-cat-belt-immunity"].value then
  cat_unit.has_belt_immunity = true
end
if settings.startup["kittycat-open-gates"].value then
  cat_unit.can_open_gates = true
end

data:extend({cat_unit})
