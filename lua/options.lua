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
local isOptionSelect = false
-- input config option boolean
local isOptionInput = false

local keyText = ""

-- highlighted option entry
optSel = 1
-- current highlight position
optSelY = 0

-- option highlight column colour
local optCol = {0.2, 0.2, 0.2, 0.5}

-- settings text colours
local textCols = {
	1, 1, 1
}

-- options menu item texts
-- left text
local offsetY = 80
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

	controlsDialog()
end

function styleUI()
	printLeft("-- TODO: Finish style screen", 1)
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

function optionsTip()
	love.graphics.setColor(0.5, 0.5, 0.5)
	-- stylua: ignore start
	love.graphics.printf("Up/Down: Select          Left/Right: Change Tabs \nEnter: Adjust", monogram, popX, wHeight - 60, 400, "center")
	-- stylua: ignore end
end

-- TODO: FInish input config
function controlsDialog()
love.graphics.rectangle("fill", popX + 40, popY + 280, 320, 25)
	love.graphics.setColor(0, 0, 0)
	love.graphics.printf("Press any key for " .. keyText, monogram, popX + 40, popY + 280, 320, "center")
end

function optionsHover()
	love.graphics.setColor(colour.border)
	love.graphics.line(popX, popY + 70, popX + 400, popY + 70)
	love.graphics.setColor(tabCol)
	love.graphics.line(popX + tabSelX, popY + 70, popX + 400 / 3 + tabSelX , popY + 70)

	love.graphics.setColor(optCol)
	love.graphics.rectangle("fill", popX + 10, popY + offsetY + optSelY, popW - 20, 25)
end

function optionsSelect(key)
	-- current tab selection
	if key == "left" and isOptions and isOptionSelect == false or key == keybinds.left and isOptions and isOptionSelect == false then
		tabSel = tabSel - 1
		tabSelX = tabSelX - (400 / 3)
		-- reset highlighted options item position
		optSel = 1
		optSelY = 0
	elseif key == "right" and isOptions and isOptionSelect == false or key == keybinds.right and isOptions and isOptionSelect == false then
		tabSel = tabSel + 1
		tabSelX = tabSelX + (400 / 3)
		optSel = 1
		optSelY = 0
	end

	-- current options entry selected
	if key == "up" and isOptions and isOptionSelect == false or key == keybinds.up and isOptions and isOptionSelect == false then
		optSel = optSel - 1
		optSelY = optSelY - 25
	elseif key == "down" and isOptions and isOptionSelect == false or key == keybinds.down and isOptions and isOptionSelect == false then
		optSel = optSel + 1
		optSelY = optSelY + 25
	end
end

-- TODO: Finish input config
function optionInputConfig(key)
	if key == "return" and isOptionInput == false then
		isOptionInput = true
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
	elseif optSel > 7 and tabSel == 2 then
		optSel = 1
		optSelY = 0
	elseif optSel < 1 and tabSel == 2 then
		optSel = 7
		optSelY = 25 * 6
	-- NOTE: placeholders
	elseif optSel > 1 and tabSel == 3 then
		optSel = 1
		optSelY = 0
	elseif optSel < 1 and tabSel == 3 then
		optSel = 1
		optSelY = 0
	end
end
