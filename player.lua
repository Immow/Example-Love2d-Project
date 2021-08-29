local Entity = require("entity_constructor")
local assets = require("assets.assets")

local Player = Entity.new(75, 90,"Pikachu", 100, assets.pikachu, "player")

return Player