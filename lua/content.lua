function gameContent()
	love.graphics.push()
	love.graphics.translate((wWidth - gWidth) / 2, (wHeight - gHeight) / 2)
	love.graphics.scale(SC, SC)
	if state == "game" then
		grid()
	else
	end
	boardUI()
	states()
	popupStates()
	exitPopup()
	overlayToggle()
	love.graphics.pop()
end

function gameLoop(dt)
	if state == "title" then
		titleEffect(dt)
		exitTimeout(dt)
	elseif state == "menu" or state == "mode" then
		menuEffect(dt)
		menuTextEffect(dt)
		selectFunc()
	end

	if isAbout then
		licenseHover()
		iconEgg()
	end

	if isOptions then
		optionsSelFunc(dt)
		colourConfig()
	end

	if isPaused == false then
		gameTime(dt)
	elseif isPaused then
		menuEffect(dt)
		menuTextEffect(dt)
		selectFunc()
	end
end
