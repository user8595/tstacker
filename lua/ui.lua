function gameUI()
    love.graphics.setColor(0.07, 0.07, 0.07)
    for i = 1, 9, 1 do
        love.graphics.line(board.l1x + i * 18, board.l1y, board.l2x + i * 18, board.l2y)
    end
    
    for i = 1, 19, 1 do
        love.graphics.line(board.l3x, board.l3y + i * 18, board.l4x, board.l4y + i * 18)
    end

    love.graphics.setColor(0.8, 0.8, 0.8, 1)
    love.graphics.line(board.l1x, board.l1y, board.l2x, board.l2y)
    love.graphics.line(board.l1x + 10 * 18, board.l1y, board.l2x + 10 * 18, board.l2y)
    
    love.graphics.setColor(0.35, 0.35, 0.35, 1)
    love.graphics.line(board.l3x, board.l3y, board.l4x, board.l4y)
    love.graphics.setColor(0.8, 0.8, 0.8, 1)
    love.graphics.line(board.l3x, board.l3y + 20 * 18, board.l4x, board.l4y + 20 * 18)

    -- next queue
    love.graphics.rectangle("line", board.nx, board.ny, board.nw, board.nh)
    -- next queue text frame
    love.graphics.rectangle("line", board.n1x, board.n1y, board.n1w, board.n1h)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", board.n1x, board.n1y, board.n1w, board.n1h)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("NEXT", monogram, board.n1x + 7, board.n1y - 1)
end

function debugUI()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(love.timer.getFPS() .. " FPS", monogram, 10, 10)
    love.graphics.print(love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), monogram, 10, 25)
    love.graphics.print(love.timer.getFPS() .. " FPS", monogram, 10, 10)
end