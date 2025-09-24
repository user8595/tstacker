require("lua.defaults")

-- popup width and height
local popX, popY, popW, popH = gWidth / 2 - 190, gHeight / 2 - 165, 400, 340
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

-- colour config highlighter
colSel = 1
-- position
colSelY = 0
-- colour highlight variable
colHl = { 0.2, 0.2, 0.2, 0.5 }

-- colour preview in colour select
local colPrev = colour.border
-- rgb values
local rgbV = { 1, 0, 1 }
-- modify colour boolean
colMod = false

-- option highlight column colour
optCol = { 0.2, 0.2, 0.2, 0.5 }

-- settings text colours
textCols = { 1, 1, 1 }

-- options menu item texts
-- header
local offsetY = 80
local function optionsHeader(str)
	love.graphics.setColor(0.35, 0.35, 0.35)
	love.graphics.print(str, monogramL, popX + 17, popY + offsetY)
end

-- left text
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

-- left text, for starting in second column
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
	love.graphics.rectangle("fill", 0, 0, gWidth, gHeight)
	love.graphics.setColor(popupCol)
	love.graphics.rectangle("fill", popX, popY, popW, popH)
	love.graphics.setColor(colour.border)
	love.graphics.rectangle("line", popX, popY, popW, popH)
	love.graphics.setColor(uiText)
	love.graphics.print("Options", largeText, popX + 17, popY + 10)
	love.graphics.setColor(tab1)
	love.graphics.print("General", monogramL, popX + 35, popY + 45)
	love.graphics.setColor(tab2)
	love.graphics.print("Controls", monogramL, popX + 163, popY + 45)
	love.graphics.setColor(tab3)
	love.graphics.print("Style", monogramL, popX + 313, popY + 45)
end

function generalUI()
	printLeft("-- TODO: Finish general screen", 1)
end

function controlsUI()
	printLeft("Left", 1)
	printRight(keybinds.left:gsub("^%l", string.upper), 1)

	printLeft("Right", 2)
	printRight(keybinds.right:gsub("^%l", string.upper), 2)

	printLeft("Soft Drop", 3)
	printRight(keybinds.sDrop:gsub("^%l", string.upper), 3)

	printLeft("Hard Drop", 4)
	printRight(keybinds.hDrop:gsub("^%l", string.upper), 4)

	printLeft("Counter Clockwise", 5)
	printRight(keybinds.cc:gsub("^%l", string.upper), 5)

	printLeft("Clockwise", 6)
	printRight(keybinds.c:gsub("^%l", string.upper), 6)

	printLeft("Hold", 7)
	printRight(keybinds.hold:gsub("^%l", string.upper), 7)
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

	printLeftStyle("Text", 6)
	love.graphics.setColor(colour.text)
	love.graphics.rectangle("fill", popX + 365, swatchY + 25 * 6, 18, 18)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 365, swatchY + 25 * 6, 18, 18)

	printLeftStyle("Popup Background", 7)
	love.graphics.setColor(popupCol)
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
	love.graphics.printf("Up/Down: Select          Left/Right: Change Tabs \nEnter: Adjust", monogram, popX, gHeight - 60,
		400, "center")
	-- stylua: ignore end
end

function inputDialog()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", popX, popY, popW, popH)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", popX + 40, popY + 280, 320, 25)
	love.graphics.setColor(0, 0, 0)
	love.graphics.printf("Press any key for " .. keyText, monogram, popX + 40, popY + 280, 320, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("ESC To cancel", monogram, popX + 40, popY + 310, 320, "center")
end

function colourDialog()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", popX, popY, popW, popH)
	love.graphics.setColor(0, 0, 0)
	love.graphics.rectangle("fill", popX + 105, popY + 127, 185, 125)
	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 105, popY + 127, 185, 125)

	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("fill", popX + 104, popY + 97, 187, 23)
	love.graphics.setColor(0, 0, 0)
	love.graphics.printf("Adjust Colour", monogram, popX + 104, popY + 97, 187, "center")

	love.graphics.setColor(1, 1, 1)
	love.graphics.rectangle("line", popX + 124, popY + 152, 72, 72)
	love.graphics.setColor(colPrev)
	love.graphics.rectangle("fill", popX + 124, popY + 152, 72, 72)
	love.graphics.setColor(0.25, 0.25, 0.25)
	love.graphics.print("Colour", monogramL, popX + 218, popY + 137)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print({ { 1, 0.5, 0.5 }, "R: ", { 1, 1, 1 }, math.floor(rgbV[1] * 100) .. "%" }, monogramL, popX + 218,
		popY + 157)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print({ { 0.5, 1, 0.5 }, "G: ", { 1, 1, 1 }, math.floor(rgbV[2] * 100) .. "%" }, monogramL, popX + 218,
		popY + 177)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print({ { 0.5, 0.5, 1 }, "B: ", { 1, 1, 1 }, math.floor(rgbV[3] * 100) .. "%" }, monogramL, popX + 218,
		popY + 197)
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("Reset", monogramL, popX + 218, popY + 217)
end

function settingsUI()
	-- love.graphics.print(colPrev[1].." " .. colPrev[2].." " .. colPrev[3].." ")

	-- local txt
	-- if colMod then
	-- 	txt = "true"
	-- else
	-- 	txt = "false"
	-- end
	-- love.graphics.print(txt, 0, 20)

	if tabSel == 1 and isOptions then
		generalUI()
	elseif tabSel == 2 and isOptions then
		controlsUI()
	elseif tabSel == 3 and isOptions then
		styleUI()
	else
	end
end

function optionStates()
	if isOptionInput then
		textCols = { 0.5, 0.5, 0.5 }
		inputDialog()
	elseif isOptionColour then
		textCols = { 0.5, 0.5, 0.5 }
		colourDialog()
	else
		textCols = { 1, 1, 1 }
	end
end

function optionsHover()
	-- current options tab highlight
	love.graphics.setColor(colour.border)
	love.graphics.line(popX, popY + 70, popX + 400, popY + 70)
	love.graphics.setColor(tabCol)
	love.graphics.line(popX + tabSelX, popY + 70, popX + 400 / 3 + tabSelX, popY + 70)

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

function colourHighlight()
	-- colour config highlighter
	if isOptionColour then
		love.graphics.setColor(colHl)
		love.graphics.rectangle("fill", popX + 211, popY + 157 + colSelY, 75, 20)
	end
end

function optionsSelect(key)
	-- current tab selection
	if key == "left" and isOptions and isOptionSelect == false and isOptionInput == false and isOptionColour == false or
		key == keybinds.left and isOptions and isOptionSelect == false and isOptionInput == false and isOptionColour == false then
		tabSel = tabSel - 1
		tabSelX = tabSelX - (400 / 3)
		-- reset highlighted options item position
		optSel = 1
		optSelY = 0
		optSelStyle = 1
	elseif key == "right" and isOptions and isOptionSelect == false and isOptionInput == false and isOptionColour == false or
		key == keybinds.right and isOptions and isOptionSelect == false and isOptionInput == false and isOptionColour == false then
		tabSel = tabSel + 1
		tabSelX = tabSelX + (400 / 3)
		optSelY = 0
		optSel = 1
		optSelStyle = 1
	end

	-- current options entry selected
	if key == "up" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 and isOptionColour == false and colMod == false or
		key == keybinds.up and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 and isOptionColour == false and colMod == false then
		optSel = optSel - 1
		optSelY = optSelY - 25
	elseif key == "down" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 and isOptionColour == false and colMod == false or
		key == keybinds.down and isOptions and isOptionSelect == false and isOptionInput == false and tabSel < 3 and isOptionColour == false and colMod == false then
		optSel = optSel + 1
		optSelY = optSelY + 25
	end

	if key == "up" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 and isOptionColour == false and colMod == false or
		key == keybinds.up and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 and isOptionColour == false and colMod == false then
		optSelStyle = optSelStyle - 1
		optSelY = optSelY - 25
	elseif key == "down" and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 and isOptionColour == false and colMod == false or
		key == keybinds.down and isOptions and isOptionSelect == false and isOptionInput == false and tabSel == 3 and isOptionColour == false and colMod == false then
		optSelStyle = optSelStyle + 1
		optSelY = optSelY + 25
	end

	if key == "up" and isOptionColour and colMod == false or key == keybinds.up and isOptionColour and colMod == false then
		colSel = colSel - 1
		colSelY = colSelY - 20
	elseif key == "down" and isOptionColour and colMod == false or key == keybinds.down and isOptionColour and colMod == false then
		colSel = colSel + 1
		colSelY = colSelY + 20
	end

	if key == "return" and isOptionInput == false and tabSel == 2 and optSel == 1 then
		isOptionInput = true
		keyText = "Left"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 2 then
		isOptionInput = true
		keyText = "Right"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 3 then
		isOptionInput = true
		keyText = "Soft Drop"
	elseif key == "return" and isOptionInput == false and tabSel == 2 and optSel == 4 then
		isOptionInput = true
		keyText = "Hard Drop"
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
	elseif key == "escape" and isOptionColour and colMod == false then
		colSel = 1
		colSelY = 0
		isOptionColour = false
		colMod = false
	elseif key == "escape" and colMod then
		colMod = false
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
		keybinds.sDrop = key
		isOptionInput = false
	elseif key ~= "escape" and key ~= "return" and isOptionInput and optSel == 4 then
		keybinds.hDrop = key
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

function colourConfig()
	-- colour value limits
	if rgbV[1] > 1 then
		rgbV[1] = 1
	elseif rgbV[1] < 0 then
		rgbV[1] = 0
	end

	if rgbV[2] > 1 then
		rgbV[2] = 1
	elseif rgbV[2] < 0 then
		rgbV[2] = 0
	end

	if rgbV[3] > 1 then
		rgbV[3] = 1
	elseif rgbV[3] < 0 then
		rgbV[3] = 0
	end

	if colMod then
		colHl = { 0.65, 0.65, 0.65, colHl[4] }
	else
		colHl = { 0.2, 0.2, 0.2, colHl[4] }
	end
	-- colour to edit based on hovered option item
	if optSelStyle == 1 then
		colPrev = colour.bg
		rgbV = colour.bg
	elseif optSelStyle == 2 then
		colPrev = colour.border
		rgbV = colour.border
	elseif optSelStyle == 3 then
		colPrev = colour.top
		rgbV = colour.top
	elseif optSelStyle == 4 then
		colPrev = colour.grid
		rgbV = colour.grid
	elseif optSelStyle == 5 then
		colPrev = colour.queue
		rgbV = colour.queue
	elseif optSelStyle == 6 then
		colPrev = colour.text
		rgbV = colour.text
	elseif optSelStyle == 7 then
		colPrev = popupCol
		rgbV = popupCol
	elseif optSelStyle == 8 then
		colPrev = keybinds.colour
		rgbV = keybinds.colour
	elseif optSelStyle == 9 then
		colPrev = bgCol
		rgbV = bgCol
	else
		colPrev = { 1, 0, 1 }
		rgbV = { 1, 0, 1 }
	end
end

function colourDialogKey(key, isrepeat)
	if key == "return" and isOptionColour == false and tabSel == 3 then
		isOptionColour = true
	elseif key == "return" and isOptionColour and colMod == false and colSel < 4 then
		colMod = true
	elseif key == "return" and isOptionColour and colMod then
		colMod = false
	end

	-- reset colors to default
	if key == "return" and colSel == 4 and optSelStyle == 1 and colMod == false then
		colour.bg = { 0.04, 0.04, 0.04 }
	elseif key == "return" and colSel == 4 and optSelStyle == 2 and colMod == false then
		colour.border = { 0.3, 0.3, 0.3 }
	elseif key == "return" and colSel == 4 and optSelStyle == 3 and colMod == false then
		colour.top = { 0.2, 0.2, 0.2 }
	elseif key == "return" and colSel == 4 and optSelStyle == 4 and colMod == false then
		colour.grid = { 0.07, 0.07, 0.07 }
	elseif key == "return" and colSel == 4 and optSelStyle == 5 and colMod == false then
		colour.queue = { 0.3, 0.3, 0.3 }
	elseif key == "return" and colSel == 4 and optSelStyle == 6 and colMod == false then
		uiText = { 1, 1, 1 }
		colour.text = { 1, 1, 1 }
	elseif key == "return" and colSel == 4 and optSelStyle == 7 and colMod == false then
		popupCol = { 0, 0, 0 }
	elseif key == "return" and colSel == 4 and optSelStyle == 8 and colMod == false then
		keybinds.colour = { 0.75, 0.75, 0.75 }
	elseif key == "return" and colSel == 4 and optSelStyle == 9 and colMod == false then
		bgCol = { 0.05, 0.05, 0.05 }
	end

	-- red colour channel
	if key == "up" and colMod and colSel == 1 or key == keybinds.up and colMod and colSel == 1 then
		rgbV[1] = rgbV[1] + 0.01
	elseif key == "down" and colMod and colSel == 1 or key == keybinds.down and colMod and colSel == 1 then
		rgbV[1] = rgbV[1] - 0.01
		-- green colour channel
	elseif key == "up" and colMod and colSel == 2 or key == keybinds.up and colMod and colSel == 2 then
		rgbV[2] = rgbV[2] + 0.01
	elseif key == "down" and colMod and colSel == 2 or key == keybinds.down and colMod and colSel == 2 then
		rgbV[2] = rgbV[2] - 0.01
		-- blue colour channel
	elseif key == "up" and colMod and colSel == 3 or key == keybinds.up and colMod and colSel == 3 then
		rgbV[3] = rgbV[3] + 0.01
	elseif key == "down" and colMod and colSel == 3 or key == keybinds.down and colMod and colSel == 3 then
		rgbV[3] = rgbV[3] - 0.01
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
		tab1, tab2, tab3 = colour.border, tabCol, colour.border
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

	if colSel > 4 then
		colSel = 1
		colSelY = 0
	elseif colSel < 1 then
		colSel = 4
		colSelY = 20 * 3
	end
end
