-- defaults
function defaults()
	love.graphics.setBackgroundColor(bgCol)
end

love.graphics.setDefaultFilter("nearest", "nearest")

-- game version
gameVer = "incomplete"

-- game internal scale
--TODO: Add proper game scaling (?)
SC = 1

-- game fonts
monogram = love.graphics.newFont("/assets/monogram.ttf", 22, "none")
monogramL = love.graphics.newFont("/assets/monogram.ttf", 24)
largeText = love.graphics.newFont("/assets/monogram.ttf", 28)
smallText = love.graphics.newFont("/assets/Picopixel.ttf", 12)
licenseFont = love.graphics.newFont("/assets/monogram.ttf", 18)

-- overall board position
boardPosX = 0
boardPosY = 0

-- game width variable
gWidth = 640
-- game height variable
gHeight = 480

-- window width variable
wWidth = love.graphics.getWidth()
-- window height variable
wHeight = love.graphics.getHeight()


-- text selection background
textSelect = 1
menuSelectY = 55

-- menu text mode
menuTextY = 110

-- pause button select highlight
pauseSelectY = 41

-- next queue count
nextCount = 5

-- game background color
-- stylua: ignore start
bgCol = {
	0.05, 0.05, 0.05
}
-- stylua: ignore end

-- menu colors
titleText = { 1, 1, 1, 1 }
uiText = { 1, 1, 1 }
buttonCol = { 0.3, 0.3, 0.3, 0.5 }
popupCol = { 0, 0, 0 }
popupOverlay = { 0, 0, 0, 0.5 }

-- license text color
licenseCol = { 0.5, 0.5, 0.5 }

board = {
	-- vertical lines
	l1x = gWidth / 2 - 84 + boardPosX,
	l1y = gHeight / 2 - 173 + boardPosY,
	l2x = gWidth / 2 - 84 + boardPosX,
	l2y = gHeight / 2 + 187 + boardPosY,
	-- horizontal lines
	l3x = gWidth / 2 - 84 + boardPosX,
	l3y = gHeight / 2 - 173 + boardPosY,
	l4x = gWidth / 2 + 96 + boardPosX,
	l4y = gHeight / 2 - 173 + boardPosY,

	-- next queue
	nx = gWidth / 2 + 120 + boardPosX,
	ny = gHeight / 2 - 155 + boardPosY,
	nw = 80,
	nh = 45 * nextCount,

	-- next queue text frame
	n1x = gWidth / 2 + 120 + boardPosX,
	n1y = gHeight / 2 - 173 + boardPosY,
	n1w = 80,
	n1h = 20,

	-- hold queue
	hx = gWidth / 2 - 188 + boardPosX,
	hy = gHeight / 2 - 155 + boardPosY,
	hw = 80,
	hh = 45,

	-- hold queue text frame
	h1x = gWidth / 2 - 188 + boardPosX,
	h1y = gHeight / 2 - 173 + boardPosY,
	h1w = 80,
	h1h = 20,

	-- board bg
	w = 180,
	h = 360,
}

-- board colours
-- stylua: ignore start
colour = {
	bg = {
		0.04, 0.04, 0.04,
	},

	grid = {
		0.07, 0.07, 0.07,
	},

	border = {
		0.3, 0.3, 0.3,
	},

	queue = {
		0.3, 0.3, 0.3,
	},

	top = {
		0.2, 0.2, 0.2,
	},

	text = {
		1, 1, 1,
	},
}
-- stylua: ignore end

block = {
	x = board.l1x,
	y = board.l1y
}

-- keybinds
keybinds = {
	-- menus
	up = "up",
	down = "down",
	left = "left",
	right = "right",
	-- game specific
	hDrop = "space",
	sDrop = "down",
	cc = "z",
	c = "x",
	hold = "c",
	restart = "`",

	-- up = "w",
	-- down = "s",
	-- left = "a",
	-- right = "d",
	-- cc = "k",
	-- c = "l",
	-- hold = "space",

	-- x-axis base position
	keyX = gWidth - 102,
	keyY = gHeight - 30,

	-- stylua: ignore start
	-- key colour
	colour = {
		0.75, 0.75, 0.75,
	},
	-- stylua: ignore end
}

-- stats
stats = {
	lines = 0,
	level = 1,
	score = 0,
}

-- level target in marathon mode
levelTarget = 10 * stats.level

-- game state
state = "title" -- values: "title", "menu", "mode", "game"
-- game ui display modes
mode = "none"   -- values: "none", "40", "marathon", "ultra", "practice"

-- booleans
isTimer = false
isOverlay = false
isDebug = false
isPaused = false
isLicense = false

-- menus
isAbout = false
isOptions = false
