-- fonts
function fonts()
    monogram = love.graphics.setNewFont("/assets/monogram.ttf", 22)
end

-- overall board position
boardPosX = 0
boardPosY = 0

-- next queue count
nextCount = 3

-- game background color
bgCol = {
    0.05, 0.05, 0.05
}

board = {
    -- vertical lines
    l1x = love.graphics.getWidth() / 2 - 84 + boardPosX,
    l1y = love.graphics.getHeight() / 2 - 173 + boardPosY,
    l2x = love.graphics.getWidth() / 2 - 84 + boardPosX,
    l2y = love.graphics.getHeight() / 2 + 187 + boardPosY,
    -- horizontal lines
    l3x = love.graphics.getWidth() / 2 - 84 + boardPosX,
    l3y = love.graphics.getHeight() / 2 - 173 + boardPosY,
    l4x = love.graphics.getWidth() / 2 + 96 + boardPosX,
    l4y = love.graphics.getHeight() / 2 - 173 + boardPosY,

    -- next queue
    nx = love.graphics.getWidth() / 2 + 120 + boardPosX,
    ny = love.graphics.getHeight() / 2 - 155 + boardPosY,
    nw = 80,
    nh = 50 * nextCount,
    
    -- next queue text frame
    n1x = love.graphics.getWidth() / 2 + 120 + boardPosX,
    n1y = love.graphics.getHeight() / 2 - 173 + boardPosY,
    n1w = 80,
    n1h = 20,

    -- hold queue
    hx = love.graphics.getWidth() / 2 - 188 + boardPosX,
    hy = love.graphics.getHeight() / 2 - 155 + boardPosY,
    hw = 80,
    hh = 50,
    
    -- hold queue text frame
    h1x = love.graphics.getWidth() / 2 - 188 + boardPosX,
    h1y = love.graphics.getHeight() / 2 - 173 + boardPosY,
    h1w = 80,
    h1h = 20,

    -- board bg
    w = 180,
    h = 360,

    -- board colours
    bg = {
        0.04, 0.04, 0.04
    },

    grid = {
        0.07, 0.07, 0.07
    },
    
    border = {
        0.3, 0.3, 0.3
    },

    queue = {
        0.3, 0.3, 0.3
    },

    top = {
        0.2, 0.2, 0.2
    },

    text = {
        1, 1, 1
    }
}

block = {
    w = 18,
    h = 18,
}

keybinds = {
    up = "up",
    down = "down",
    left = "left",
    right = "right",
    cc = "z",
    c = "x",
    hold = "c",
    
    -- keybinds
    -- up = "w",
    -- down = "s",
    -- left = "a",
    -- right = "d",
    -- cc = "k",
    -- c = "l",
    -- hold = "space",

    -- x-axis base position
    keyX = love.graphics.getWidth() - 85,
    keyY = love.graphics.getHeight() - 30,

    -- key colour
    colour = {
        0.75, 0.75, 0.75
    }
}

isOverlay = false
isDebug = false