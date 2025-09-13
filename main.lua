require("lua.defaults")
require("lua.game")
require("lua.ui")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest")
    love.graphics.setBackgroundColor(bgCol)
    fonts()
end

function love.keypressed(key, isrepeat)
    if key == "escape" then
        love.event.quit(0)
    end
    
    if key == "f4" and isDebug == false then
        isDebug = true
    elseif key == "f4" and isDebug == true then
        isDebug = false
    end
    
    if key == "f8" and isOverlay == false then
        isOverlay = true
    elseif key == "f8" and isOverlay == true then
        isOverlay = false
    end
end

function love.update(dt)
    
end

function love.draw()
    gameUI()
    overlayToggle()
    debugToggle()
end