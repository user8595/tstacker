function gameContent()
    if state == "game" then
        grid()
    else
    end
    boardUI()
    states()
    popupStates()
    exitPopup()
    overlayToggle()
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
	end
    
	if isPaused == false then
		gameTime(dt)
	elseif isPaused then
		menuEffect(dt)
		menuTextEffect(dt)
		selectFunc()
	end
end