require("lua.ui")

local function selectReset()
	textSelect = 1
	menuSelectY = 55
end

function selectFunc()
	-- menu screen
	if textSelect == 1 and state == "menu" then
		menuSelectY = 55
	elseif textSelect < 1 and state == "menu" and isAbout == false then
		textSelect = 4
		menuSelectY = -35
	elseif textSelect > 4 and state == "menu" and isAbout == false then
		textSelect = 1
		menuSelectY = 55
	end

	-- mode screen
	if textSelect == 1 and state == "mode" then
		menuSelectY = 95
	elseif textSelect < 1 and state == "mode" then
		textSelect = 4
		menuSelectY = 5
	elseif textSelect > 4 and state == "mode" then
		textSelect = 1
		menuSelectY = 95
	end

	-- show respective mode ui when highlighted
	if textSelect == 1 and state == "mode" then
		mode = "marathon"
	elseif textSelect == 2 and state == "mode" then
		mode = "40"
	elseif textSelect == 3 and state == "mode" then
		mode = "ultra"
	elseif textSelect == 4 and state == "mode" then
		mode = "practice"
	end

	-- pause screen
	if textSelect == 1 and isPaused and state == "game" then
		pauseSelectY = 41
	elseif textSelect < 1 and isPaused and state == "game" then
		textSelect = 3
		pauseSelectY = 91
	elseif textSelect > 3 and isPaused and state == "game" then
		textSelect = 1
		pauseSelectY = 41
	end
end

local exitInput = 0
local exitTimer = 0
local exitColor = { 0, 0, 0, 1 }
local exitText = { 1, 1, 1, 1 }

-- exit confirmation text function
function exitTimeout(dt)
	if exitInput == 0 then
	end

	if exitInput == 1 then
		exitTimer = exitTimer + dt
	end

	if exitTimer < 1 then
		exitColor[4] = 1
		exitText[4] = 1
	end

	if exitTimer >= 1 then
		exitColor[4] = exitColor[4] - dt * 2.5
		exitText[4] = exitText[4] - dt * 2.5
		if exitColor[4] <= 0 and exitText[4] <= 0 then
			exitColor[4] = 0
			exitText[4] = 0
		end
	end
	if exitTimer >= 1.45 then
		exitTimer = 0
		exitInput = 0
	end
end

local boxY = 90
-- exit confirmation text box
function exitPopup(dt)
	if exitInput == 1 then
		love.graphics.setColor(exitColor)
		love.graphics.rectangle("fill",  wWidth / 2 - 84, wHeight - boxY, 180, 30)
		love.graphics.setColor(exitText)
		love.graphics.printf("Press ESC to quit", monogramL,  wWidth / 2 - 84, wHeight - boxY + 5, 180, "center")
	elseif exitInput == 2 then
		love.event.quit(0)
	else
	end
end

function menuTextEffect(dt)
	-- mode screen
	if state == "mode" and menuTextY < 140 then
		menuTextY = menuTextY + dt * 530
	end
	if state == "mode" and menuTextY > 144 then
		menuTextY = 144
	end

	-- menu screen
	if state == "menu" and menuTextY > 110 then
		menuTextY = menuTextY - dt * 530
	end
	if state == "menu" and menuTextY < 110 then
		menuTextY = 110
	end
end

-- reset menu items to default position/colour
local function menuReset()
	bt = 0
	buttonCol[4] = 0.5
	exitInput = 0
	exitTimer = 0
end

function inputMenu(key)
	if key == "escape" and state == "title" then
		exitInput = exitInput + 1
	elseif key == "escape" and state == "menu" and isAbout == false and isOptions == false then
		state = "title"
		selectReset()
		menuReset()
	elseif key == "escape" and state == "menu" and isOptions and isOptionInput == false and isOptionSelect == false then
		isOptions = false
		tabSel = 1
		tabSelX = 0
		optSel = 1
		optSelY = 0
		optSelStyle = 1
	elseif key == "escape" and state == "menu" and isAbout then
		isAbout = false
		isLicense = false
	elseif key == "escape" and state == "mode" then
		state = "menu"
		mode = "none"
		selectReset()
	end

	if key == "f4" and isDebug == false then
		isDebug = true
	elseif key == "f4" and isDebug then
		isDebug = false
	end

	if key == "f8" and isOverlay == false then
		isOverlay = true
	elseif key == "f8" and isOverlay then
		isOverlay = false
	end

	-- for testing purposes
	-- if key == "f6" and isTimer == false then
	-- 	isTimer = true
	-- elseif key == "f6" and isTimer then
	-- 	isTimer = false
	-- end

	-- if key == "f7" and mode == "none" then
	--     mode = "marathon"
	-- elseif key == "f7" and mode == "marathon" then
	--     mode = "40"
	-- elseif key == "f7" and mode == "40" then
	--     mode = "none"
	-- loops
	-- end
end

function menuSelectKey(key)
	if key == keybinds.down and state == "menu" and isAbout == false and isOptions == false or
		key == keybinds.down and state == "mode"
	then
		menuSelectY = menuSelectY - 30
		textSelect = textSelect + 1
	elseif key == keybinds.up and state == "menu" and isAbout == false and isOptions == false or
		key == keybinds.up and state == "mode"
	then
		menuSelectY = menuSelectY + 30
		textSelect = textSelect - 1
	end

	if key == keybinds.down and isPaused then
		pauseSelectY = pauseSelectY + 25
		textSelect = textSelect + 1
	elseif key == keybinds.up and isPaused then
		pauseSelectY = pauseSelectY - 25
		textSelect = textSelect - 1
	end
end

function titleEffect(dt)
	if state == "title" then
		b:update(dt)
		bf:update(dt)
	end
end

function menuEffect(dt)
	if state == "menu" or state == "mode" then
		bt = bt + dt
		if bt > 0 and bt <= 1 then
			buttonCol[4] = buttonCol[4] - dt / 5.5
			optCol[4] = optCol[4] - dt / 5.5
		elseif bt >= 1 and bt < 2 then
			buttonCol[4] = buttonCol[4] + dt / 5.5
			optCol[4] = optCol[4] + dt / 5.5
		elseif bt >= 2 then
			bt = 0
		end
	end
end

-- title select menu
function tSMenu(key)
	if key == "return" and state == "title" then
		state = "menu"
		exitInput = 0
		exitTimer = 0
	elseif key == "return" and state == "menu" and textSelect == 1 and isAbout == false and isOptions == false then
		state = "mode"
	elseif key == "return" and state == "menu" and textSelect == 2 and isAbout == false and isOptions == false then
		isOptions = true
	elseif key == "return" and state == "menu" and textSelect == 3 and isAbout == false and isOptions == false then
		isAbout = true
	elseif key == "return" and state == "menu" and textSelect == 4 and isAbout == false and isOptions == false then
		love.event.quit(0)
	elseif key == "return" and state == "mode" and textSelect >= 1 then
		state = "game"
	end
end

iconIncrement = 1
function menuClick(x, y, button)
	-- license screen
	if x >= 33 and x <= 179 and y >= 412 and y <= 440 and isAbout and isLicense == false and button == 1 then
		isLicense = true
	elseif x >= 33 and x <= 176 and y >= 412 and y <= 440 and isAbout and isLicense == true and button == 1 then
		isLicense = false
	end

	if x >= 36 and x <= 99 and y >= 260 and y <= 325 and isAbout and isLicense == false then
		iconIncrement = iconIncrement + 1
	end
end

function iconEgg()
	if iconIncrement == 1 then
		iconAbout = icoEasterEgg[1]
	elseif iconIncrement == 2 then
		iconAbout = icoEasterEgg[2]
	elseif iconIncrement == 3 then
		iconAbout = icoEasterEgg[3]
	elseif iconIncrement == 4 then
		iconAbout = icoEasterEgg[4]
	end

	if iconIncrement > 4 then
		iconIncrement = 1
	end
end

function licenseHover()
	local x, y = love.mouse.getPosition()

	-- checks for mouse input
	if x >= 33 and x <= 179 and y >= 412 and y <= 440 and isAbout and love.mouse.isDown(1) then
		licenseCol = {0.35, 0.35, 0.35}
	elseif x >= 33 and x <= 179 and y >= 412 and y <= 440 and isAbout then
		licenseCol = {0.75, 0.75, 0.75}
	else
		licenseCol = {0.5, 0.5, 0.5}
	end
end

-- key toggles
function overlayToggle()
	if isDebug then
		debugUI()
	else
	end

	if isOverlay and isAbout == false then
		keyOverlay()
	else
	end
end
