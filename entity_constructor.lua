local Attack = require("abilities.attack")
local Heal   = require("abilities.heal")
local assets = require("assets.assets")
assert(assets.default, "default asset missing")
local Vec2   = require("vec2")

local Entity = {}
Entity.__index = Entity

function Entity.new(x, y, name, life, image, type)
    image = image or assets.default
    return setmetatable({
        Pos = Vec2.new(x, y),
        Attack = Attack.new(),
        Heal = Heal.new(),
        name = name or "unnamed",
        life = life or 100,
        image = image,
        r = 0,
        scaleX = math.min(1, 100 / image:getHeight()),
        scaleY = math.min(1, 100 / image:getHeight()),
        state = "idle",
        direction = "right",
        speed = 1,
        type = type or "enemy",
        toBeRemoved = false,
    }, Entity)
end

function Entity:update()
    self:movement()
    -- self:death()
end

function Entity:movement()
    if love.keyboard.isDown("right") and self.type == "player" then
        self.Pos:add(1,0)
        self.direction = "right"
    end
    if love.keyboard.isDown("left") and self.type == "player" then
        self.Pos:add(-1,0)
        self.direction = "left"
    end
    if love.keyboard.isDown("up") and self.type == "player" then
        self.Pos:add(0,-1)
        self.direction = "up"
    end
    if love.keyboard.isDown("down") and self.type == "player" then
        self.Pos:add(0,1)
        self.direction = "down"
    end
end

function Entity:draw()
    love.graphics.draw(self.image, self.Pos.x, self.Pos.y, self.r, self.scaleX, self.scaleY)
end

function Entity:death()
    if self.life <= 0 then
        self = nil
    end
end

return Entity