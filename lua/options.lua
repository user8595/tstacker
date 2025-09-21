require("lua.defaults")

-- popup width and height
local popX, popY, popW = wWidth / 2 - 190, wHeight / 2 - 165, 400
-- tabbar text colour variables
local tab1, tab2, tab3
-- tab option text colours
local tabCol = { 1, 1, 1 }
-- selected tab
tabSel = 1
-- line highlight position
tabSelX = 0

-- selected option boolean
isOptionSelect = false
-- input config option boolean
isOptionInput = false
-- change colour dialogue
isOptionColour = false

local keyText = ""

-- highlighted option entry
optSel = 1
-- current highlight position
optSelY = 0

-- for style menu
optSelStyle = 1
-- options menu style offset
styleOffsetY = 0

-- option highlight column colour
optCol = {0.2, 0.2, 0.2, 0.5}

-- settings text colours
local textCols = {1, 1, 1}

-- options menu item texts
-- left text
local offsetY = 80
local function optionsHeader(str)
	love.graphics.setColor(0.35, 0.35, 0.35)
	love.graphics.print(str, monogramL, popX + 17, popY + offsetY)
end

local function printLeft(str, pos)
	love.graphics.setColor(textCols)
	if pos == 1 then
		love.graphics.print(str, monogramL, popX + 17, popY + offsetY)
	elseif pos == 2 then
		love.graphics.print(str, monogramL, popX + 17, popY + offsetY + 25)
	else
		love.graphics.print(str, monogramL, popX + 17, popY + offsetY + 25 * (pos - 1))
	end
end

local function printLeftStyle(str, pos)
	love.graphics.setColor(textCols)
	if pos == 1 then
		love.graphics.print(str, monogramL, popX + 17, popY + offsetY + 25)
	elseif pos == 2 then
		love.graphics.print(str, monogramL, popX + 17, popY + offsetY + 25 * 2)
	else
		love.graphics.print(str, monogramL, popX + 17, popY + offsetY + 25 * pos)
	end
end

-- right text
local function printRight(str, pos)
	love.graphics.setColor(textCols)
	if pos == 1 then
		love.graphics.printf(str, monogramL, popX + 17, popY + offsetY, popW - 17 * 2, "right")
	elseif pos == 2 then
		love.graphics.printf(str, monogramL, popX + 17, popY + offsetY + 25, popW - 17 * 2, "right")
	else
		love.graphics.printf(str, monogramL, popX + 17, popY + offsetY + 25 * (pos - 1), popW - 17 * 2, "right")
	end
end

-- options popup
function options()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", 0, 0, wWidth, wHeight)
	love.graphics.setColor(popupCol)
	love.graphics.rectangle("fill", popX, popY, popW, 340)
	love.graphics.setColor(colour.border)
	love.graphics.rectangle("line", popX, popY, popW, 340)
	love.graphics.setColor(uiText)
	love.graphics.print("Options", largeText, popX + 17, popY + 10)
	love.graphics.setColor(tab1)
	love.graphics.print("Handling", monogramL, popX + 32, popY + 44)
	love.graphics.setColor(tab2)
	love.graphics.print("Controls", monogramL, popX + 163, popY + 45)
	love.graphics.setColor(tab3)
	love.graphics.print("Style", monogramL, popX + 313, popY + 45)
end

function handlingUI()
	printLeft("-- TODO: Finish handling screen", 1)
end

function controlsUI()
	printLeft("Left", 1)
	printRight(keybinds.left:gsub("^%l", string.upper), 1)

	printLeft("Right", 2)
	printRight(keybinds.right:gsub("^%l", string.upper), 2)

	printLeft("Hard Drop", 3)
	printRight(keybinds.up:gsub("^%l", string.upper), 3)
	
	printLeft("Soft Drop", 4)
	printRight(keybinds.down:gsub("^%l", string.upper), 4)

	printLeft("Counter Clockwise", 5)
	printRight(keybinds.cc:gsub("^%l", string.upper), 5)

	printLeft("Clockwise", 6)
	printRight(keybinds.c:gsub("^%l", string.upper), 6)

	printLeft("Hold", 7)
	printRight(keybinds.hold:gsub("^%l", string.upper), 7)

	if isOptionInput then
		textCols = {0.5, 0.5, 0.5}
		inputDialog()
	else
		textCols = {1, 1, 1}
	end
end

function styleUI()
	local swatchY = popY + offsetY + 3

	optionsHeader("Colours")
	printLeftStyle("Board Background", 1)
	love.graphics.setColor(colour.bg)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25, 18, 18)

	printLeftStyle("Border", 2)
	love.graphics.setColor(colour.border)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 2, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 2, 18, 18)

	printLeftStyle("Top Border", 3)
	love.graphics.setColor(colour.top)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 3, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 3, 18, 18)

	printLeftStyle("Grid", 4)
	love.graphics.setColor(colour.grid)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 4, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 4, 18, 18)

	printLeftStyle("Next Queue", 5)
	love.graphics.setColor(colour.queue)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 5, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 5, 18, 18)

	printLeftStyle("Game Text", 6)
	love.graphics.setColor(colour.text)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 6, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 6, 18, 18)

	printLeftStyle("Menu Text", 7)
	love.graphics.setColor(uiText)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 7, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 7, 18, 18)

	printLeftStyle("Input Overlay", 8)
	love.graphics.setColor(keybinds.colour)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 8, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 8, 18, 18)

	printLeftStyle("Game Background", 9)
	love.graphics.setColor(bgCol)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 9, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 9, 18, 18)
end

function optionsTip()
	love.graphics.setColor(0.5, 0.5, 0.5)
	-- stylua: ignore start
	love.graphics.printf("Up/Down: Select          Left/Right: Change Tabs \nEnter: Adjust", monogram, popX, wHeight - 60, 400, "center")
	-- stylua: ignore end
end

function inputDialog()
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", popX + 40, popY + 280, 320, 25)
	love.graphics.setColor(0, 0, 0)
	love.graphics.printf("Press any key for " .. keyText, monogram, popX + 40, popY + 280, 320, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("ESC To cancel", monogram, popX + 40, popY + 310, 320, "center")
end

--TODO: Finish colour change dialog functionality
function colourDialog()
	love.graphics.setColour(0, 0, 0)
	love.graphics.rectangle("fill", popX + 40, popY + 280, 320, 25)
end

function settingsUI()
	if tabSel == 1 and isOptions then
		handlingUI()
	elseif tabSel == 2 and isOptions then
		controlsUI()
	elseif tabSel == 3 and isOptions then
		styleUI()
	else
	end
end

function optionsHover()
	-- current options tab highlight
	love.graphics.setColor(colour.border)
	love.graphics.line(popX, popY + 70, popX + 400, popY + 70)
	love.graphics.setColor(tabCol)
	love.graphics.line(popX + tabSelX, popY + 70, popX + 400 / 3 + tabSelX , popY + 70)
	
	-- options select highlight
	love.graphics.setColor(optCol)
	love.graphics.rectangle("fill", popX + 10, popY + offsetY + optSelY + styleOffsetY, popW - 20, 25)
	
	-- moves highlighter downwards if in the style tab
	if tabSel == 3 then
		styleOffsetY = 25
	else
		styleOffsetY = 0
	end
end

function optionsSelect(key)
	-- current tab selection
	if key == "left" and isOptions and isOptionSelect == false and isOptionInput == false or key == keybinds.left and isOptions and isOptionSelect == false and isOptionInput == false then
		tabSel = tabSel - 1
		tabSelX = tabSelX - (400 / 3)
		-- reset highlighted options item position
		optSel = 1
		optSelY = 0
		optSelStyle = 1
	elseif key == "right" and isOptions and isOptionSelect == false and isOptionInput == false or key == keybinds.right and isOptions and isOptionSelect == false and isOptionInput == false then
		tabSel = tabSel + 1
		tabSelX = tabSelX + (400 / 3)
		optSelY = 0
		optSel = 1
		optSelStyle = 1
	end
	
	-- current options entry selected
	if key == "up" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 or key == keybinds.up and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 then
		optSel = optSel - 1
		optSelY = optSelY - 25
	elseif key == "down" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 or key == keybinds.down and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 then
		optSel = optSel + 1
		optSelY = optSelY + 25
	end

	if key == "up" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 or key == keybinds.up and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 then
		optSelStyle = optSelStyle - 1
		optSelY = optSelY - 25
	elseif key == "down" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 or key == keybinds.down and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 then
		optSelStyle = optSelStyle + 1
		optSelY = optSelY + 25
	end
	
	if key == "return" and isOptionInput == false and tabSel == 2 and optSel == 1 then
		isOptionInput = true
		keyText = "Left"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 2 then
		isOptionInput = true
		keyText = "Right"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 3 then
		isOptionInput = true
		keyText = "Hard Drop"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 4 then
		isOptionInput = true
		keyText = "Soft Drop"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 5 then
		isOptionInput = true
		keyText = "Counter Clockwise"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 6 then
		isOptionInput = true
		keyText = "Clockwise"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 7 then
		isOptionInput = true
		keyText = "Hold"
	elseif key == "escape" and isOptionInput then
		isOptionInput = false
		keyText = ""
	end
end

function optionInputConfig(key)
	if key ~= "escape" and key ~= "return" and isOptionInput and optSel == 1 then
		keybinds.left = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 2 then
		keybinds.right = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 3 then
		keybinds.up = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 4 then
		keybinds.down = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 5 then
		keybinds.cc = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 6 then
		keybinds.c = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 7 then
		keybinds.hold = key
		isOptionInput = false
	end
end

function optionsSelFunc(dt)
	-- current tab selection function
	if tabSel > 3 then
		tabSel = 1
		tabSelX = 0
	elseif tabSel < 1 then
		tabSel = 3
		tabSelX = 0 + (400 / 3) * 2
	end
	
	-- current highlighted options tab
	if tabSel == 1 then
		tab1, tab2, tab3 = tabCol, colour.border, colour.border
	elseif tabSel == 2 then
		tab1, tab2, tab3 = colour.border, tabCol,  colour.border
	elseif tabSel == 3 then
		tab1, tab2, tab3 = colour.border, colour.border, tabCol
	else
	end

	-- current selected options item function
	-- NOTE: placeholders
	if optSel > 1 and tabSel == 1 then
		optSel = 1
		optSelY = 0
	elseif optSel < 1 and tabSel == 1 then
		optSel = 1
		optSelY = 0
	-- input screen
	elseif optSel > 7 and tabSel == 2 then
		optSel = 1
		optSelY = 0
	elseif optSel < 1 and tabSel == 2 then
		optSel = 7
		optSelY = 25 * 6
	-- style screen
	elseif optSelStyle > 9 and tabSel == 3 then
		optSelStyle = 1
		optSelY = 0
	elseif optSelStyle < 1 and tabSel == 3 then
		optSelStyle = 9
		optSelY = 25 * 8
	end
end
