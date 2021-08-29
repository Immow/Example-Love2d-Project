local Vec2 = {}

Vec2.__index = Vec2

function Vec2.new(x,y)
    return setmetatable({
    x = x or 0,
    y = y or 0,
    }, Vec2)
end

function Vec2:add(x, y)
    self.x = self.x + (x)
    self.y = self.y + (y or x)
end

function Vec2:getPos()
    return self.x, self.y
end

function Vec2:setPos(x,y)
    self.x = x
    self.y = y
end

return Vec2