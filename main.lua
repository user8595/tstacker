require("lua.defaults")
require("lua.ui")

function love.load()
    fonts()
end

function love.keypressed(key, isrepeat)
    if key == "escape" then
        love.event.quit(0)
    end
end

function love.update(dt)
    
end

function love.draw()
    debugUI()
    gameUI()
end