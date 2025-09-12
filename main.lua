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
    for i = 0, 10, 1 do
        love.graphics.line(board.l1x + i * 18, board.l1y, board.l2x + i * 18, board.l2y)
    end

    for i = 0, 20, 1 do
        love.graphics.line(board.l3x, board.l3y + i * 18, board.l4x, board.l4y + i * 18)
    end
end