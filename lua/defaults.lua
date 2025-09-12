-- overall board position
boardPosX = -9
boardPosY = -18

board = {
    -- vertical lines
    l1x = love.graphics.getWidth() / 2 - 75 + boardPosX,
    l1y = love.graphics.getHeight() / 2 - 155 + boardPosY,
    l2x = love.graphics.getWidth() / 2 - 75 + boardPosX,
    l2y = love.graphics.getHeight() / 2 + 205 + boardPosY,
    -- horizontal lines
    l3x = love.graphics.getWidth() / 2 - 75 + boardPosX,
    l3y = love.graphics.getHeight() / 2 - 155 + boardPosY,
    l4x = love.graphics.getWidth() / 2 + 105 + boardPosX,
    l4y = love.graphics.getHeight() / 2 - 155 + boardPosY,

    -- next queue
    nx = love.graphics.getWidth() / 2 + 120 + boardPosX,
    ny = love.graphics.getHeight() / 2 - 135 + boardPosY,
    nw = 80,
    nh = 60,
    
    -- next queue text frame
    n1x = love.graphics.getWidth() / 2 + 120 + boardPosX,
    n1y = love.graphics.getHeight() / 2 - 155 + boardPosY,
    n1w = 80,
    n1h = 20,
}

block = {
    w = 18,
    h = 18,
}

function fonts()
    monogram = love.graphics.setNewFont("/assets/monogram.ttf", 22)
end