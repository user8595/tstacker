require("lua.defaults")
require("lua.menu")
require("lua.content")
require("lua.states")
require("lua.game")
require("lua.string")
require("lua.ui")

if arg[2] == "debug" then
	require("lldebugger").start()
end

function love.load()
	defaults()
	gameEffect()
end

function love.keypressed(key, isrepeat)
	inputMenu(key, isrepeat)
	tSMenu(key, isrepeat)
	menuSelectKey(key, isrepeat)
	pauseKey(key, isrepeat)
end

function love.mousepressed(x, y, button)
	menuClick(x, y, button)
end

function love.update(dt)
	gameLoop(dt)
end

function love.draw()
	gameContent()
	-- love.graphics.print(textSelect, 30, 75)
	-- love.graphics.print(pauseSelectY, 30, 90)
	love.graphics.print(love.mouse.getX() .. ", " .. love.mouse.getY(), monogram, 10, 160)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
	if lldebugger then
		error(msg, 2)
	else
		return love_errorhandler(msg)
	end
end
