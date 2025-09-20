require("lua.menu")

function states()
	-- game states
	if state == "title" then
		title()
		version()
	elseif state == "menu" and isOptions == false then
		menuSelect()
		menu()
		menuTip()
		if isAbout == false then
			version()
		else
		end
	elseif state == "mode" then
		menuSelect()
		menuTip()
		modes()
	elseif state == "game"and isPaused == false then
		game()
	end

	-- game modes
	if mode == "none" then
	elseif mode == "40" or mode == "practice" then
		timer()
		linesShort()
	elseif mode == "marathon" then
		timer()
		lines()
		score()
	elseif mode == "ultra" then
		timer()
		linesShort()
		score()
	end
end

function popupStates()
	if isOptions then
		options()
		settingsUI()
		optionsHover()
		optionsTip()
	elseif isAbout and isLicense == false then
		about()
		licenseButton()
	elseif isLicense then
		license()
		licenseButton()
	else
		-- reset easter egg orientation
		iconIncrement = 1
	end
	
	if isPaused then
		pauseSelect()
		pauseScreen()
		menuTip()
	end
end

function modeStates()
	if mode == "40" and state == "game" then
	elseif mode == "marathon" and state == "game" then
	elseif mode == "ultra" and state == "game" then
	elseif mode == "practice" and state == "game" then
	end
end
