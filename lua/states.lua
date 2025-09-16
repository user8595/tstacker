function states()
	-- game states
	if state == "title" then
		title()
		version()
	elseif state == "menu" then
		menuSelect()
		menu()
		menuTip()
		version()
	elseif state == "mode" then
		menuSelect()
		menuTip()
		modes()
	elseif state == "game" then
		game()
		grid()
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
	else
	end
end

function popupStates()
	if isOptions == true then
		options()
	elseif isAbout == true then
		about()
	else
	end
end

function modeStates()
	if mode == "40" and state == "game" then
	elseif mode == "marathon" and state == "game" then
	end
end
