-- Used for the "cat" (biter) attack animation
require("__base__.prototypes.entity.biter-animations")


local blank = {
  filename    = "__kittycat__/graphics/blank.png",
  width       = 1,
  height      = 1,
  frame_count = 1,
  run_mode    = "forward"
}

local cat_scale = 0.15
local cat_tint1 = {r = 0.56, g = 0.46, b = 0.42, a = 0.65}
local cat_tint2 = {r = 1, g = 0.63, b = 0, a = 0.4}

local cat_attack_animation = cat_attack_animation or blank

if settings.startup["kcat-attack-animation"].value then 
	cat_attack_animation = biterattackanimation(small_biter_scale/2, cat_tint1, cat_tint2)
else 
	cat_attack_animation = blank
end


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
          filename = "__kittycat__/graphics/cat-hr.png",
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
--if settings.startup["kcat-collision-player"].value then
--  collision_mask.layers.player = true
--end
collision_mask.layers.player = true
if settings.startup["kcat-collision-trains"].value then
  collision_mask.layers.train = true
end

-- Copied from poison-cloud-visual-dummy
local cat_death_smoke =
{
  type = "smoke-with-trigger",
  name = "kcat-cat-death-smoke",
  flags = {"not-on-map"},
  hidden = true,
  show_when_smoke_off = true,
  --particle_count = 24,
  --particle_spread = { 3.6 * 1.05, 3.6 * 0.6 * 1.05 },
  --particle_distance_scale_factor = 0.5,
  --particle_scale_factor = { 1, 0.707 },
  --particle_duration_variation = 60 * 3,
  --wave_speed = { 0.5 / 80, 0.5 / 60 },
  --wave_distance = { 1, 0.5 },
  --spread_duration_variation = 300 - 20,
  particle_count = 10,
  particle_spread = {1, 1},

  render_layer = "object",

  affected_by_wind = true,
  cyclic = true,
  duration = (1 + 2) * 60,
  fade_away_duration = 2 * 60,
  --spread_duration = (300 - 20) / 2 ,
  --color = {0.014, 0.358, 0.395, 0.322}, -- #035b6452
  color = {1, 1, 1, 1},

  animation =
  {
    width = 152,
    height = 120,
    line_length = 5,
    frame_count = 60,
    shift = {-0.53125, -0.4375},
    priority = "high",
    animation_speed = 0.25,
    filename = "__base__/graphics/entity/smoke/smoke.png",
    flags = { "smoke" }
  },
}

local cat_unit =
{
  type = "unit",
  name = "kcat-cat",
  icon = "__kittycat__/graphics/cat-icon.png",
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
  minable = {mining_time = 1, result = "kcat-cat"},
  distance_per_frame = 0.1,
  movement_speed = 0.2,
  healing_per_tick = 0.02,
  distraction_cooldown = 300,
  --dying_explosion = "blood-explosion-small",
  dying_sound =
  {
    filename = "__kittycat__/sound/cat-vanish.ogg",
    volume = 0.5
  },
  dying_trigger_effect =
  {
    type = "create-smoke",
    entity_name = "kcat-cat-death-smoke"
  },
  affected_by_tiles= true,
  vision_distance = 30,
  run_animation = cat_run_animation,
  working_sound =
  {
    sound =
    {
      variations =
      {
        {filename = "__kittycat__/sound/meow1.ogg"},
        {filename = "__kittycat__/sound/meow2.ogg", volume = 0.5},
        {filename = "__kittycat__/sound/meow3.ogg", volume = 0.5},
      },
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
    animation = cat_attack_animation,
    sound =
    {
      filename = "__kittycat__/sound/cat-hiss.ogg",
      volume = 0.5,
      aggregation = {max_count = 2, remove = true, count_already_playing = true}
    }
  }
}

---------------- OPTIONAL Features ----------------
if settings.startup["kcat-cat-belt-immunity"].value then
  cat_unit.has_belt_immunity = true
end
if settings.startup["kcat-open-gates"].value then
  cat_unit.can_open_gates = true
end

data:extend({cat_death_smoke, cat_unit})
