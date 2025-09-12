require("lua.defaults")

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
    love.graphics.print(love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), monogram, 10, 10)
    local grid = false
    for i = 1, 9, 1 do
        -- what the actual fuck
        if i % 2 >= 1 then
            love.graphics.rectangle("fill", board.x + i * 18, board.y, block.w, block.h)
        else
            love.graphics.rectangle("line", board.x + i * 18, board.y, block.w, block.h)
        end
    end
    
    for i = 0, 19, 1 do
        -- what the actual fuck
        if i % 2 >= 1 then
            love.graphics.rectangle("fill", board.x, board.y + i * 18, block.w, block.h)
        else
            love.graphics.rectangle("line", board.x, board.y + i * 18, block.w, block.h)
        end
    end
end