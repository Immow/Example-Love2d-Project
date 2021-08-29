local Player = require("player")

local world = {}

function world:draw()
    Player:draw()
end

function world:update(dt)
    Player:update(dt)
end

function world:keypressed(key, scancode, isrepeat)
    if key == "space" then
        ChangeScene("house")
        print(Player.name.." has entered the "..GetScene())
    end

    if love.keyboard.isDown("d") then
        debug.debug()
        print("hello")
    end
    if love.keyboard.isDown("r") then
        love.event.quit("restart")
    end
end

return world