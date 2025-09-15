local cron = require("lib.cron")

function gameEffect()
    function tb()
        titleText = {1, 1, 1, 0}
    end
    function tbD()
        titleText = {1, 1, 1, 1}
    end
    b = cron.every(1, tb)
    bf = cron.every(2, tbD)

    -- menu timer for button effect
    bt = 0
end

function title()
    love.graphics.print("TStacker", monogramL, wWidth / 2 - 28, wHeight / 2 - 120)
    love.graphics.print({titleText, "Press Enter"}, monogram, wWidth / 2 - 36, wHeight / 2 + 100)
    love.graphics.print({{0.5, 0.5, 0.5}, "incomplete"}, monogram, 10, wHeight - 27)
end

function menu()
    love.graphics.setColor(uiText)
    love.graphics.printf("Play", button, board.l1x, wHeight / 2 - 55, board.w, "center")
    love.graphics.setColor(uiText)
    love.graphics.printf("Options", button, board.l1x, wHeight / 2 - 25, board.w, "center")
    love.graphics.setColor(uiText)
    love.graphics.printf("About", button, board.l1x, wHeight / 2 + 5, board.w, "center")
    love.graphics.setColor(uiText)
    love.graphics.printf("Exit", button, board.l1x, wHeight / 2 + 35, board.w, "center")
end

function menuSelect()
    love.graphics.setColor(buttonCol)
    love.graphics.rectangle("fill", board.l1x, wHeight / 2 - menuSelectY, board.w, 27)
end

function modes()
    
end

function gameUI()
    -- board background
    love.graphics.setColor(colour.bg)
    love.graphics.rectangle("fill", board.l1x, board.l1y, board.w, board.h)

    
    -- outer borders
    love.graphics.setColor(colour.border)
    love.graphics.line(board.l1x, board.l1y, board.l2x, board.l2y)
    love.graphics.setColor(colour.border)
    love.graphics.line(board.l1x + 10 * 18, board.l1y, board.l2x + 10 * 18, board.l2y)
    
    love.graphics.setColor(colour.top)
    love.graphics.line(board.l3x, board.l3y, board.l4x, board.l4y)
    love.graphics.setColor(colour.border)
    love.graphics.line(board.l3x, board.l3y + 20 * 18, board.l4x, board.l4y + 20 * 18)
    
    -- next queue
    love.graphics.setColor(colour.bg)
    love.graphics.rectangle("fill", board.nx, board.ny, board.nw, board.nh)
    love.graphics.setColor(colour.queue)
    love.graphics.rectangle("line", board.nx, board.ny, board.nw, board.nh)

    -- next queue text frame
    love.graphics.rectangle("line", board.n1x, board.n1y, board.n1w, board.n1h)
    love.graphics.rectangle("fill", board.n1x, board.n1y, board.n1w, board.n1h)
    love.graphics.setColor(colour.text)
    love.graphics.print("NEXT", monogram, board.n1x + 7, board.n1y - 1)
    
    -- hold queue
    love.graphics.setColor(colour.bg)
    love.graphics.rectangle("fill", board.hx, board.hy, board.hw, board.hh)
    love.graphics.setColor(colour.queue)
    love.graphics.rectangle("line", board.hx, board.hy, board.hw, board.hh)
    
    -- hold queue text frame
    love.graphics.setColor(colour.queue)
    love.graphics.rectangle("line", board.h1x, board.h1y, board.h1w, board.h1h)
    love.graphics.setColor(colour.queue)
    love.graphics.rectangle("fill", board.h1x, board.h1y, board.h1w, board.h1h)
    love.graphics.setColor(colour.text)
    love.graphics.print("HOLD", monogram, board.h1x + 7, board.h1y - 1)
end

function grid() 
    -- board grid
    love.graphics.setColor(colour.grid)
    -- vertical lines
    for i = 1, 9, 1 do
        love.graphics.line(board.l1x + i * 18, board.l1y, board.l2x + i * 18, board.l2y)
    end
    love.graphics.setColor(colour.grid)
    -- horizontal lines
    for i = 1, 19, 1 do
        love.graphics.line(board.l3x, board.l3y + i * 18, board.l4x, board.l4y + i * 18)
    end
end

function lines40()
    -- lines text
    love.graphics.setColor(colour.border)
    love.graphics.print("Lines", smallText, board.nx, board.ny + 278)
    love.graphics.setColor(colour.text)
    love.graphics.print(stats.lines, monogramL, board.nx, board.ny + 285)
end

function lines()
    -- lines text
    love.graphics.setColor(colour.border)
    love.graphics.print("Lines", smallText, board.nx, board.ny + 278)
    love.graphics.setColor(colour.text)
    love.graphics.print(stats.lines, monogramL, board.nx, board.ny + 285)
end

function score()
    -- score text
    love.graphics.setColor(colour.border)
    love.graphics.print("Score", smallText, board.nx, board.ny + 278)
    love.graphics.setColor(colour.text)
    love.graphics.print(stats.score, monogramL, board.nx, board.ny + 285)
end

function timer()
    -- timer text
    love.graphics.setColor(colour.border)
    love.graphics.print("Time", smallText, board.nx, board.ny + 310)
    love.graphics.setColor(colour.text)
    love.graphics.print(minString .. ":" .. secString, monogramL, board.nx, board.ny + 317)
end

function keyOverlay()
    if keybinds.hold == "space" then
        keybinds.keyX = wWidth - 85
        keybinds.keyY = wHeight - 44
    else
        keybinds.keyX = wWidth - 102
        keybinds.keyY = wHeight - 30
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

-- debug menu function
function debugUI()    
    local condOverlay = ""
    local condOverlay1 = ""
    local popup = "none"
    local condY = 85

    if isOverlay == true then
        condOverlay = "isOverlay"
    else
    end
    if isTimer == true then
        condOverlay1 = "isTimer"
        -- moves isTimer text to top if isOverlay is false
        if isOverlay == false then
            condY = condY - 15
        end
    else
    end

    if isAbout == true then
        popup = "isAbout"
    elseif isOptions == true then
        popup = "isOptions"
    else
        popup = "none"
    end

    love.graphics.setColor(1, 1, 1)
    love.graphics.print(love.timer.getFPS() .. " FPS", monogram, 10, 10)
    love.graphics.print(wWidth .. "x" .. wHeight, monogram, 10, 25)
    love.graphics.print(state, monogram, 10, 40)
    love.graphics.print(mode, monogram, 10, 55)
    love.graphics.print(popup, monogram, 10, 70)
    love.graphics.print(condOverlay, monogram, 10, condY)
    love.graphics.print(condOverlay1, monogram, 10, condY + 15)
end
