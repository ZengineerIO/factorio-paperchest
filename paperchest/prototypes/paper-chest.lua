if data.raw.item["solid-paper"] then

  local item_subgroup = mods["angelsindustries"] and "angels-chests-small-a" or "storage"
  local item_order = mods["angelsindustries"] and "a[chest]-a[paper-chest]-a[wood]" or "a[items]-a[paper-chest]"

  local chest_storage_size = 10

  if settings.startup["paper-chest-extra-small"].value == true then
    chest_storage_size = 5
  end

  data:extend{
    {
      type = "corpse",
      name = "paper-chest-remnants",
      localised_name = {"remnant-name", {"entity-name.paper-chest"}},
      icon = "__paperchest__/graphics/icons/paper-chest.png",
      icon_size = 64, icon_mipmaps = 4,
      flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
      subgroup = "storage-remnants",
      order = "a-f-a",
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      tile_width = 1,
      tile_height = 1,
      selectable_in_game = false,
      time_before_removed = 60 * 60 * 15, -- 15 minutes
      final_render_layer = "remnants",
      remove_on_tile_placement = false,
      animation = {
        filename = "__paperchest__/graphics/entity/paper-chest/remnants/paper-chest-remnants.png",
        priority = "extra-high",
        width = 56,
        height = 38,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(9, 0),
        hr_version = {
          filename = "__paperchest__/graphics/entity/paper-chest/remnants/hr-paper-chest-remnants.png",
          priority = "extra-high",
          width = 110,
          height = 74,
          frame_count = 1,
          direction_count = 1,
          shift = util.by_pixel(9, 0),
          scale = 0.5,
        }
      }
    },
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
      subgroup = item_subgroup,
      order = item_order,
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
      max_health = 30,
      corpse = "paper-chest-remnants",
      open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume=0.65 },
      close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.7 },
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
            filename = "__paperchest__/graphics/entity/paper-chest/paper-chest.png",
            priority = "extra-high",
            width = 32,
            height = 36,
            shift = util.by_pixel(0, -2),
            hr_version = {
              filename = "__paperchest__/graphics/entity/paper-chest/hr-paper-chest.png",
              priority = "extra-high",
              width = 62,
              height = 72,
              Shift = util.by_pixel(0, -2),
              scale = 0.5,
            }
          },
          {
            filename = "__paperchest__/graphics/entity/paper-chest/hr-paper-chest-shadow.png",
            priority = "extra-high",
            width = 52,
            height = 20,
            shift = util.by_pixel(10, 6),
            draw_as_shadow = true,
            hr_version = {
              filename = "__paperchest__/graphics/entity/paper-chest/hr-paper-chest-shadow.png",
              priority = "extra-high",
              width = 104,
              height = 40,
              shift = util.by_pixel(10, 6),
              draw_as_shadow = true,
              scale = 0.5,
            }
          }
        }
      },
      circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
      circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance
    }
  } 
    
end
