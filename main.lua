require("lua.defaults")
require("lua.menu")
require("lua.content")
require("lua.states")
require("lua.game")
require("lua.options")
require("lua.string")
require("lua.ui")

if arg[2] == "debug" then
  require("lldebugger").start()
end

function love.load()
  titleBlink()
end

function love.keypressed(key)
  keyFunctions(key)
end

function love.mousepressed(x, y, button)
  --TODO: Add mouse functionality in main menu and mode select screens
  menuClick(x, y, button)
end

function love.update(dt)
  defaults()
  gameLoop(dt)
end

function love.resize(w, h)
  wWidth, wHeight = w, h
end

function love.draw()
  gameContent()

  -- local txt
  -- if isOptionColour then
  --   txt = "true"
  -- else
  --   txt = "false"
  -- end
  -- love.graphics.print(colSel, 30, 75)
  -- love.graphics.print(colSelY, 30, 90)
  -- love.graphics.print(txt, 30, 120)
  -- love.graphics.print(love.mouse.getX() .. ", " .. love.mouse.getY(), monogram, 10, 160)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
  if lldebugger then
    error(msg, 2)
  else
    return love_errorhandler(msg)
  end
end
