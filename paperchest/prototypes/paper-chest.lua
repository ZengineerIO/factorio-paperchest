if data.raw.item["solid-paper"] then

  local chest_storage_size = 10

  if settings.startup["paper-chest-extra-small"].value == true then
    chest_storage_size = 5
  end

  data:extend{
    {
      type = "recipe",
      name = "paper-chest",
      enabled = true,
      ingredients = {{"solid-paper", 2}},
      result = "paper-chest"
    },
    {
      type = "item",
      name = "paper-chest",
      icon = "__paperchest__/graphics/icons/paper-chest.png",
      icon_size = 64,
      subgroup = "storage",
      order = "a[items]-a[paper-chest]",
      place_result = "paper-chest",
      stack_size = 50
    },
    {
      type = "container",
      name = "paper-chest",
      icon = "__paperchest__/graphics/icons/paper-chest.png",
      icon_size = 64,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 1, result = "paper-chest"},
      max_health = 100,
      corpse = "small-remnants",
      open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume=0.65 },
      close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.7 },
      resistances =
      {
        {
          type = "fire",
          percent = 10
        },
        {
          type = "impact",
          percent = 30
        }
      },
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      fast_replaceable_group = "container",
      inventory_size = chest_storage_size,
      vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 0.65 },
      picture =
      {
        layers =
        {
          {
            filename = "__paperchest__/graphics/entity/paper-chest/hr-paper-chest.png",
            priority = "extra-high",
            width = 62,
            height = 72,
            -- shift = util.by_pixel(0, -3),
            scale = 0.5,
          },
          {
            filename = "__paperchest__/graphics/entity/paper-chest/hr-paper-chest-shadow.png",
            priority = "extra-high",
            width = 104,
            height = 40,
            shift = util.by_pixel(10, 8), -- {0.3, 0},
            draw_as_shadow = true,
            scale = 0.5,
          }
        }
      },
      circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
      circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    }
  } 
    
end
