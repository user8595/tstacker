require("lua.defaults")

function gameUI()
    -- board background
    love.graphics.setColor(board.bg)
    love.graphics.rectangle("fill", board.l1x, board.l1y, board.w, board.h)

    -- board grid
    love.graphics.setColor(board.grid)
    -- vertical lines
    for i = 1, 9, 1 do
        love.graphics.line(board.l1x + i * 18, board.l1y, board.l2x + i * 18, board.l2y)
    end
    -- horizontal lines
    for i = 1, 19, 1 do
        love.graphics.line(board.l3x, board.l3y + i * 18, board.l4x, board.l4y + i * 18)
    end

    -- outer borders
    love.graphics.setColor(board.border)
    love.graphics.line(board.l1x, board.l1y, board.l2x, board.l2y)
    love.graphics.setColor(board.border)
    love.graphics.line(board.l1x + 10 * 18, board.l1y, board.l2x + 10 * 18, board.l2y)
    
    love.graphics.setColor(board.top)
    love.graphics.line(board.l3x, board.l3y, board.l4x, board.l4y)
    love.graphics.setColor(board.border)
    love.graphics.line(board.l3x, board.l3y + 20 * 18, board.l4x, board.l4y + 20 * 18)

    -- next queue
    love.graphics.setColor(board.queue)
    love.graphics.rectangle("line", board.nx, board.ny, board.nw, board.nh)

    -- next queue text frame
    love.graphics.rectangle("line", board.n1x, board.n1y, board.n1w, board.n1h)
    love.graphics.rectangle("fill", board.n1x, board.n1y, board.n1w, board.n1h)
    love.graphics.setColor(board.text)
    love.graphics.print("NEXT", monogram, board.n1x + 7, board.n1y - 1)
        
    -- hold queue
    love.graphics.setColor(board.queue)
    love.graphics.rectangle("line", board.hx, board.hy, board.hw, board.hh)
    
    -- hold queue text frame
    love.graphics.setColor(board.queue)
    love.graphics.rectangle("line", board.h1x, board.h1y, board.h1w, board.h1h)
    love.graphics.setColor(board.queue)
    love.graphics.rectangle("fill", board.h1x, board.h1y, board.h1w, board.h1h)
    love.graphics.setColor(board.text)
    love.graphics.print("HOLD", monogram, board.h1x + 7, board.h1y - 1)
end

function keyOverlay()
    if keybinds.hold == "space" then
        keybinds.keyX = love.graphics.getWidth() - 85
        keybinds.keyY = love.graphics.getHeight() - 44
    else
        keybinds.keyX = love.graphics.getWidth() - 102
        keybinds.keyY = love.graphics.getHeight() - 30
    end

    love.graphics.setColor(keybinds.colour)
    if love.keyboard.isDown(keybinds.left) then
        love.graphics.rectangle("line", keybinds.keyX, keybinds.keyY, 10, 10)
        love.graphics.rectangle("fill", keybinds.keyX, keybinds.keyY, 10, 10)
    else
        love.graphics.rectangle("line", keybinds.keyX, keybinds.keyY, 10, 10)
    end
    if love.keyboard.isDown(keybinds.down) then
        love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY, 10, 10)
        love.graphics.rectangle("fill", keybinds.keyX + 14, keybinds.keyY, 10, 10)
    else
        love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY, 10, 10)
    end
    if love.keyboard.isDown(keybinds.up) then
    love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY - 14, 10, 10)
    love.graphics.rectangle("fill", keybinds.keyX + 14, keybinds.keyY - 14, 10, 10)
    else
        love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY - 14, 10, 10)
    end
    if love.keyboard.isDown(keybinds.right) then
        love.graphics.rectangle("line", keybinds.keyX + 28, keybinds.keyY, 10, 10)
        love.graphics.rectangle("fill", keybinds.keyX + 28, keybinds.keyY, 10, 10)
    else
        love.graphics.rectangle("line", keybinds.keyX + 28, keybinds.keyY, 10, 10)
    end

    if love.keyboard.isDown(keybinds.cc) then
        love.graphics.rectangle("line", keybinds.keyX + 44, keybinds.keyY, 10, 10)
        love.graphics.rectangle("fill", keybinds.keyX + 44, keybinds.keyY, 10, 10)
    else
        love.graphics.rectangle("line", keybinds.keyX + 44, keybinds.keyY, 10, 10)
    end

    if love.keyboard.isDown(keybinds.c) then
        love.graphics.rectangle("line", keybinds.keyX + 58, keybinds.keyY, 10, 10)
        love.graphics.rectangle("fill", keybinds.keyX + 58, keybinds.keyY, 10, 10)
    else
        love.graphics.rectangle("line", keybinds.keyX + 58, keybinds.keyY, 10, 10)
    end

    -- changes shape if hold key is set to the space key
    if love.keyboard.isDown(keybinds.hold) then
        if keybinds.hold == "space" then
            love.graphics.rectangle("line", keybinds.keyX + 5, keybinds.keyY + 14, 60, 10)
            love.graphics.rectangle("fill", keybinds.keyX + 5, keybinds.keyY + 14, 60, 10)
        else
            love.graphics.rectangle("line", keybinds.keyX + 72, keybinds.keyY, 10, 10)
            love.graphics.rectangle("fill", keybinds.keyX + 72, keybinds.keyY, 10, 10)
        end
    else
        if keybinds.hold == "space" then
            love.graphics.rectangle("line", keybinds.keyX + 5, keybinds.keyY + 14, 60, 10)
        else
            love.graphics.rectangle("line", keybinds.keyX + 72, keybinds.keyY, 10, 10)
        end
    end
end

function debugUI()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print(love.timer.getFPS() .. " FPS", monogram, 10, 10)
    love.graphics.print(love.graphics.getWidth() .. "x" .. love.graphics.getHeight(), monogram, 10, 25)
    love.graphics.print(love.timer.getFPS() .. " FPS", monogram, 10, 10)
end
