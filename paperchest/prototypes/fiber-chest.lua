if data.raw.item["cellulose-fiber"] then

  local item_subgroup = mods["angelsindustries"] and "angels-chests-small-a" or "storage"
  local item_order = mods["angelsindustries"] and "a[chest]-a[cellulose-fiber-chest]-a[paper-chest]" or "a[items]-a[cellulose-fiber-chest]"
  
  local chest_storage_size = 5

  if settings.startup["paper-chest-extra-small"].value == true then
    chest_storage_size = 1
  end

  data:extend{
    {
      type = "corpse",
      name = "cellulose-fiber-chest-remnants",
      localised_name = {"remnant-name", {"entity-name.cellulose-fiber-chest"}},
      icon = "__paperchest__/graphics/icons/cellulose-fiber-chest.png",
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
        filename = "__paperchest__/graphics/entity/cellulose-fiber-chest/remnants/cellulose-fiber-chest-remnants.png",
        priority = "extra-high",
        width = 56,
        height = 38,
        frame_count = 1,
        direction_count = 1,
        shift = util.by_pixel(9, 0),
        hr_version = {
          filename = "__paperchest__/graphics/entity/cellulose-fiber-chest/remnants/hr-cellulose-fiber-chest-remnants.png",
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
      name = "cellulose-fiber-chest",
      enabled = true,
      ingredients = {{"cellulose-fiber", 2}},
      result = "cellulose-fiber-chest"
    },
    {
      type = "item",
      name = "cellulose-fiber-chest",
      icon = "__paperchest__/graphics/icons/cellulose-fiber-chest.png",
      icon_size = 64,
      subgroup = item_subgroup,
      order = item_order,
      place_result = "cellulose-fiber-chest",
      stack_size = 50
    },
    {
      type = "container",
      name = "cellulose-fiber-chest",
      icon = "__paperchest__/graphics/icons/cellulose-fiber-chest.png",
      icon_size = 64,
      flags = {"placeable-neutral", "player-creation"},
      minable = {mining_time = 0.1, result = "cellulose-fiber-chest"},
      max_health = 50,
      corpse = "cellulose-fiber-chest-remnants",
      open_sound = { filename = "__base__/sound/wooden-chest-open.ogg", volume=0.6},
      close_sound = { filename = "__base__/sound/wooden-chest-close.ogg", volume = 0.6 },
      collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      fast_replaceable_group = "container",
      inventory_size = chest_storage_size,
      vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 0.5 },
      picture =
      {
        layers = 
        {
          {
            filename = "__paperchest__/graphics/entity/cellulose-fiber-chest/cellulose-fiber-chest.png",
            priority = "extra-high",
            width = 32,
            height = 36,
            shift = util.by_pixel(0.5, -2),
            hr_version = {
              filename = "__paperchest__/graphics/entity/cellulose-fiber-chest/hr-cellulose-fiber-chest.png",
              priority = "extra-high",
              width = 62,
              height = 72,
              shift = util.by_pixel(0.5, -2),
              scale = 0.5,
            }
          },
          {
            filename = "__paperchest__/graphics/entity/cellulose-fiber-chest/cellulose-fiber-chest-shadow.png",
            priority = "extra-high",
            width = 52,
            height = 20,
            shift = util.by_pixel(11, 6.5),
            draw_as_shadow = true,
            hr_version = {
              filename = "__paperchest__/graphics/entity/cellulose-fiber-chest/hr-cellulose-fiber-chest-shadow.png",
              priority = "extra-high",
              width = 104,
              height = 40,
              shift = util.by_pixel(11, 6.5),
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
