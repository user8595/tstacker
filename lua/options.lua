-- popup width and height
local popX, popY = wWidth / 2 - 190, wHeight / 2 - 165
-- tabbar text colour variables
local opt1, opt2, opt3
-- tab option text colours
local optSel = { 1, 1, 1 }
-- selected tab
local tabSel = 1
-- line highlight position
local tabSelX = 0
-- selected option boolean
local isOptionSelect = false

function options()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", 0, 0, wWidth, wHeight)
	love.graphics.setColor(popupCol)
	love.graphics.rectangle("fill", popX, popY, 400, 340)
	love.graphics.setColor(colour.border)
	love.graphics.rectangle("line", popX, popY, 400, 340)
	love.graphics.setColor(uiText)
	love.graphics.print("Options", largeText, popX + 17, popY + 10)
	love.graphics.setColor(opt1)
	love.graphics.print("Handling", monogramL, popX + 32, popY + 44)
	love.graphics.setColor(opt2)
	love.graphics.print("Controls", monogramL, popX + 163, popY + 45)
	love.graphics.setColor(opt3)
	love.graphics.print("Colours", monogramL, popX + 303, popY + 45)
end

function optionsTip()
	love.graphics.setColor(0.5, 0.5, 0.5)
	-- stylua: ignore start
	love.graphics.printf("Up/Down: Select          Left/Right: Change Tabs \nEnter: Adjust", monogram, popX, wHeight - 60, 400, "center")
	-- stylua: ignore end
end

function optionsHover()
	love.graphics.setColor(colour.border)
	love.graphics.line(popX, popY + 70, popX + 400, popY + 70)
	love.graphics.setColor(optSel)
	love.graphics.line(popX + tabSelX, popY + 70, popX + 400 / 3 + tabSelX , popY + 70)
end

function optionsSelect(key)
	if key == "left" and isOptions and isOptionSelect == false then
		tabSel = tabSel - 1
		tabSelX = tabSelX - (400 / 3)
	elseif key == "right" and isOptionSelect == false then
		tabSel = tabSel + 1
		tabSelX = tabSelX + (400 / 3)
	end
end

function optionsSelFunc(dt)
	if tabSel > 3 then
		tabSel = 1
		tabSelX = 0
	elseif tabSel < 1 then
		tabSel = 3
		tabSelX = 0 + (400 / 3) * 2
	end

	if tabSel == 1 then
		opt1, opt2, opt3 = optSel, colour.border, colour.border
	elseif tabSel == 2 then
		opt1, opt2, opt3 = colour.border, optSel,  colour.border
	elseif tabSel == 3 then
		opt1, opt2, opt3 = colour.border, colour.border, optSel
	else
	end
end
