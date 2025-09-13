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

    -- for testing purposes
    if key == "f6" and isTimer == false then
        isTimer = true
    elseif key == "f6" and isTimer == true then
        isTimer = false
    end

    if key == "f7" and mode == "none" then
        mode = "marathon"
    elseif key == "f7" and mode == "marathon" then
        mode = "40"
    elseif key == "f7" and mode == "40" then
        mode = "none"
    -- loops
    end
end

function love.update(dt)
    gameTime(dt)
end

function love.draw()
    gameUI()
    if mode == "none" then
    elseif mode == "40" then
        timer()
        lines40()
    elseif mode == "marathon" then
        timer()
        lines()
        score()
    end
    debugToggle()
end
