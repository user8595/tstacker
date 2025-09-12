board = {
    -- vertical lines
    l1x = love.graphics.getWidth() / 2 - 75,
    l1y = love.graphics.getHeight() / 2 - 155,
    l2x = love.graphics.getWidth() / 2 - 75,
    l2y = love.graphics.getHeight() / 2 + 205,
    -- horizontal lines
    l3x = love.graphics.getWidth() / 2 - 75,
    l3y = love.graphics.getHeight() / 2 - 155,
    l4x = love.graphics.getWidth() / 2 + 105,
    l4y = love.graphics.getHeight() / 2 - 155,
}

block = {
    w = 18,
    h = 18,
}

function fonts()
    monogram = love.graphics.setNewFont("/assets/monogram.ttf", 22)
end