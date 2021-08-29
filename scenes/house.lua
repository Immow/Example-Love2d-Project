local Entity = require("entity_constructor")
local assets = require("assets.assets")
local Enemy = Entity.new(50,0, "Psy Duck", 200, assets.psyduck)
local Player = require("player")

local house = {}

print(Enemy.name.." has "..Enemy.life.." life")
Player.Attack:shock(Enemy)
print(Enemy.name.." has "..Enemy.life.." life")
Enemy.Heal:default(Enemy)
print(Enemy.name.." has "..Enemy.life.." life")

function house:draw()
    Enemy:draw()
    Player:draw()
end

function house:update(dt)
    Enemy:update()
    Player:update()
end

function house:keypressed(key, scancode, isrepeat)
    if key == "space" then
        ChangeScene("world")
        print(Player.name.." has entered the "..GetScene())
    end
    if key == "a" then
        Player.Attack:shock(Enemy)
        print(Enemy.name.." has "..Enemy.life.." life")
    end
    if key == "p" then
        local x, y = Player.Pos:getPos()
        print("Player is at x: "..x.." y: "..y)
    end
    if key == "s" then
        Player.Pos:setPos(100,100)
    end
end

return house