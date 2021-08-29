local scene
local sceneName

function love.load()
	ChangeScene("world")
end

function love.update(dt)
	if scene.update then scene:update(dt) end
end

function love.draw()
	if scene.draw then scene:draw() end
end

function love.keypressed(key,scancode,isrepeat)
	if scene.keypressed then scene:keypressed(key,scancode,isrepeat) end
end

function love.keyreleased(key,scancode)
	if scene.keyreleased then scene:keyreleased(key,scancode) end
end

function love.mousepressed(x,y,button,istouch,presses)
	if scene.mousepressed then scene:mousepressed(x,y,button,istouch,presses) end
end

function love.mousereleased(x,y,button,istouch,presses)
	if scene.mousereleased then scene:mousereleased(x,y,button,istouch,presses) end
end

function love.touchpressed(id,x,y,dx,dy,pressure)
	if scene.touchpressed then scene:touchpressed(id,x,y,dx,dy,pressure) end
end

function love.touchreleased(id,x,y,dx,dy,pressure)
	if scene.touchreleased then scene:touchreleased(id,x,y,dx,dy,pressure) end
end

function love.touchmoved(id,x,y,dx,dy,pressure)
	if scene.touchmoved then scene:touchmoved(id,x,y,dx,dy,pressure) end
end

function ChangeScene(nextScene)
	scene = require("scenes/"..nextScene)
	sceneName = nextScene
	if scene.load then scene:load() end
end

function GetScene()
	if scene then return sceneName end
end