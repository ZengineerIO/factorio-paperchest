if not paperchest then paperchest = {} end

require("prototypes.fiber-chest")
require("prototypes.paper-chest")


if data.raw.item["cellulose-fiber-chest"] then 

  if data.raw.item["solid-paper"] then 

    data.raw.container["cellulose-fiber-chest"].next_upgrade = "paper-chest"
    data.raw.container["paper-chest"].next_upgrade = "wooden-chest"
  else 
    data.raw.container["cellulose-fiber-chest"].next_upgrade = "wooden-chest"
  end
end
