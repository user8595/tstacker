require("lua.ui")

local function selectReset()
	textSelect = 1
	menuSelectY = 55
end

function selectFunc()
	-- menu screen
	if textSelect == 1 and state == "mode" then
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
		textSelect = 3
		menuSelectY = 35
	elseif textSelect > 3 and state == "mode" then
		textSelect = 1
		menuSelectY = 95
	end

	if textSelect == 1 and state == "mode" then
		mode = "marathon"
	elseif textSelect == 2 and state == "mode" then
		mode = "40"
	elseif textSelect == 3 and state == "mode" then
		mode = "practice"
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

local boxY = 44
-- exit confirmation text box
function exitPopup(dt)
	if exitInput == 1 then
		love.graphics.setColor(exitColor)
		love.graphics.rectangle("fill", wWidth / 2 - 84, wHeight - boxY, 180, 30)
		love.graphics.setColor(exitText)
		love.graphics.printf("Press ESC to quit", monogramL, wWidth / 2 - 84, wHeight - boxY + 5, 180, "center")
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

function inputMenu(key, isrepeat)
	if key == "escape" and state == "title" then
		exitInput = exitInput + 1
	elseif key == "escape" and state == "menu" and isAbout == false and isOptions == false then
		state = "title"
		selectReset()
		bt = 0
		buttonCol[4] = 0.5
	elseif key == "escape" and state == "menu" and isOptions == true then
		isOptions = false
		exitInput = 0
		exitTimer = 0
	elseif key == "escape" and state == "menu" and isAbout == true then
		isAbout = false
	elseif key == "escape" and state == "mode" then
		state = "menu"
		mode = "none"
		selectReset()
	end

	if key == "f4" and isDebug == false then
		isDebug = true
	elseif key == "f4" and isDebug == true then
		isDebug = false
	end

	if key == "f8" and isOverlay == false then
		isOverlay = true
	elseif key == "f8" and isOverlay == true then
		isOverlay = false
	end

	-- for testing purposes
	-- if key == "f6" and isTimer == false then
	--     isTimer = true
	-- elseif key == "f6" and isTimer == true then
	--     isTimer = false
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

function menuSelectKey(key, isrepeat)
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
		elseif bt >= 1 and bt < 2 then
			buttonCol[4] = buttonCol[4] + dt / 5.5
		elseif bt >= 2 then
			bt = 0
		end
	end
end

-- title select menu
function tSMenu(key, isrepeat)
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
	end

	if key == "return" and state == "mode" and textSelect == 1 then

	end
end

-- key toggles
function debugToggle()
	if isDebug == true then
		debugUI()
	else
	end

	if isOverlay == true then
		keyOverlay()
	else
	end
end
