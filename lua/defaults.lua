-- defaults
function defaults()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(bgCol)
end

monogram = love.graphics.setNewFont("/assets/monogram.ttf", 22)
monogramL = love.graphics.setNewFont("/assets/monogram.ttf", 24)
largeText = love.graphics.setNewFont("/assets/monogram.ttf", 28)
smallText = love.graphics.setNewFont("/assets/Picopixel.ttf", 12)

-- overall board position
boardPosX = 0
boardPosY = 0

wWidth = love.graphics.getWidth()
wHeight = love.graphics.getHeight()

-- text selection background
textSelect = 1
menuSelectY = 55

-- next queue count
nextCount = 3

-- game background color
bgCol = {
  0.05, 0.05, 0.05
}

titleText = { 1, 1, 1, 1 }
uiText = { 1, 1, 1, 1 }
buttonCol = { 0.3, 0.3, 0.3, 0.5 }
popupCol = { 0, 0, 0 }
popupOverlay = { 0, 0, 0, 0.5 }

board = {
  -- vertical lines
  l1x = wWidth / 2 - 84 + boardPosX,
  l1y = wHeight / 2 - 173 + boardPosY,
  l2x = wWidth / 2 - 84 + boardPosX,
  l2y = wHeight / 2 + 187 + boardPosY,
  -- horizontal lines
  l3x = wWidth / 2 - 84 + boardPosX,
  l3y = wHeight / 2 - 173 + boardPosY,
  l4x = wWidth / 2 + 96 + boardPosX,
  l4y = wHeight / 2 - 173 + boardPosY,

  -- next queue
  nx = wWidth / 2 + 120 + boardPosX,
  ny = wHeight / 2 - 155 + boardPosY,
  nw = 80,
  nh = 45 * nextCount,

  -- next queue text frame
  n1x = wWidth / 2 + 120 + boardPosX,
  n1y = wHeight / 2 - 173 + boardPosY,
  n1w = 80,
  n1h = 20,

  -- hold queue
  hx = wWidth / 2 - 188 + boardPosX,
  hy = wHeight / 2 - 155 + boardPosY,
  hw = 80,
  hh = 45,

  -- hold queue text frame
  h1x = wWidth / 2 - 188 + boardPosX,
  h1y = wHeight / 2 - 173 + boardPosY,
  h1w = 80,
  h1h = 20,

  -- board bg
  w = 180,
  h = 360,
}

-- board colours
colour = {
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
  restart = "`",

  -- keybinds
  -- up = "w",
  -- down = "s",
  -- left = "a",
  -- right = "d",
  -- cc = "k",
  -- c = "l",
  -- hold = "space",

  -- x-axis base position
  keyX = wWidth - 102,
  keyY = wHeight - 30,

  -- key colour
  colour = {
    0.75, 0.75, 0.75
  }
}

-- stats
stats = {
  lines = 0,
  score = 0,
}

-- game state
state = "title" -- "title", "menu", "mode", "game"
mode = "none"   -- "40", "marathon"

-- booleans
isTimer = false
isOverlay = false
isDebug = false

-- menus
isAbout = false
isOptions = false

