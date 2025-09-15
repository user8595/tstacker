require("lua.defaults")
require("lua.menu")
require("lua.states")
require("lua.game")
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
end

function love.update(dt)
    if state == "title" then
        titleEffect(dt)
        exitTimeout(dt)
    elseif state == "menu" or state == "mode" then
        menuEffect(dt)
        selectFunc()
    elseif state == "game" then
        gameTime(dt)
    else
    end
end

function love.draw()
    boardUI()
    states()
    popupStates()
    debugToggle()
    exitPopup()
    -- love.graphics.print(textSelect, 30, 75)
    -- love.graphics.print(menuSelectY, 30, 90)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end
