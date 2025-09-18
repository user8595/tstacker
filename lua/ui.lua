local cron = require("lib.cron")
require("lua.textures")

-- pause screen button
local pauseX =  wWidth / 2 - 54
local pauseY = wHeight / 2 - 50

iconAbout = icoEasterEgg[1]

function gameEffect()
	function tb()
		titleText = { 1, 1, 1, 0 }
	end
	function tbD()
		titleText = { 1, 1, 1, 1 }
	end
	b = cron.every(1, tb)
	bf = cron.every(2, tbD)

	-- menu timer for button effect
	bt = 0
end

function version()
	love.graphics.setColor(0.25, 0.25, 0.25)
	love.graphics.print(gameVer, monogram, 10, wHeight - 27)
end

function title()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", 0, 0, wWidth, wHeight)
	love.graphics.setColor(uiText)
	love.graphics.draw(logo, board.l1x - 125, board.l1y + 40)
	love.graphics.print({ titleText, "Press Enter" }, monogram,  wWidth / 2 - 36, wHeight / 2 + 100)
end

function menu()
	love.graphics.setColor(0.25, 0.25, 0.25, 0.25)
	love.graphics.rectangle("fill", board.l1x, wHeight / 2 - menuTextY, board.w, 24)
	love.graphics.setColor(uiText)
	love.graphics.printf("Main Menu", monogramL, board.l1x, wHeight / 2 - menuTextY, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Play", largeText, board.l1x, wHeight / 2 - 55, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Options", largeText, board.l1x, wHeight / 2 - 25, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("About", largeText, board.l1x, wHeight / 2 + 5, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Exit", largeText, board.l1x, wHeight / 2 + 35, board.w, "center")
end

function menuSelect()
	love.graphics.setColor(buttonCol)
	love.graphics.rectangle("fill", board.l1x, wHeight / 2 - menuSelectY, board.w, 27)
end

function menuTip()
	love.graphics.setColor(0.5, 0.5, 0.5)
    -- stylua: ignore start
    love.graphics.printf(keybinds.up:gsub("^%l", string.upper) .. "/" .. keybinds.down:gsub("^%l", string.upper) .. ": Select\nEnter: Confirm", monogram, board.l1x, wHeight - 46, board.w, "center")
	-- stylua: ignore end
end

function about()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", 0, 0, wWidth, wHeight)
	love.graphics.setColor(1, 1, 1)
	love.graphics.draw(iconAbout, board.l1x - 200, board.l1y + 195, 0, 0.25, 0.25)
	love.graphics.setColor(uiText)
	love.graphics.print("TStacker", largeText, board.l1x - 200, board.l1y + 270)
	love.graphics.print("Simple old-school\nstacker game", monogram, board.l1x - 200, board.l1y + 298)
	love.graphics.printf("© 2025 eightyfivenine\n" .. gameVer, monogram, board.l1x - 200, board.l1y + 336, 573, "right")
end

function licenseButton()
	local showText = "show"
	if isLicense then
		showText = "hide"
	else
		showText = "show"
	end
	love.graphics.setColor(licenseCol)
	love.graphics.print("Licensed under the\nMIT License.", monogram, board.l1x - 200, board.l1y + 340)
	love.graphics.setColor(0.5, 0.5, 0.5)
	love.graphics.print("Click text above to " .. showText .. " full license", smallText, board.l1x - 200, board.l1y + 380)
end

function license()
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", 0, 0, wWidth, wHeight)
	love.graphics.setColor(uiText)
	love.graphics.print(licenseText, licenseFont, board.l1x - 200, board.l1y - 20)
end

function modes()
	love.graphics.setColor(0.25, 0.25, 0.25, 0.25)
	love.graphics.rectangle("fill", board.l1x, wHeight / 2 - menuTextY, board.w, 24)
	love.graphics.setColor(uiText)
	love.graphics.printf("Select Mode", monogramL, board.l1x, wHeight / 2 - menuTextY, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Marathon", largeText, board.l1x, wHeight / 2 - 95, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Sprint", largeText, board.l1x, wHeight / 2 - 65, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Ultra", largeText, board.l1x, wHeight / 2 - 35, board.w, "center")
	love.graphics.setColor(uiText)
	love.graphics.printf("Practice", largeText, board.l1x, wHeight / 2 - 5, board.w, "center")
end

function pauseScreen()
	love.graphics.setColor(popupCol)
	love.graphics.rectangle("fill", pauseX, pauseY, 120, 35)
	love.graphics.setColor(colour.border)
	love.graphics.rectangle("line", pauseX, pauseY, 120, 35)
	love.graphics.setColor(uiText)
	love.graphics.printf("PAUSE", largeText, pauseX, pauseY + 5, 120, "center")
	love.graphics.printf("Continue", largeText, pauseX, pauseY + 40, 120, "center")
	love.graphics.printf("Restart", largeText, pauseX, pauseY + 65, 120, "center")
	love.graphics.printf("Exit", largeText, pauseX, pauseY + 90, 120, "center")
end

function pauseSelect()
	-- prevents highlighter from being rendered in front of the text by drawing the highlighter first
	-- which means we need to put the overlay in this highlight function, so that it's drawn first, then the pause screen itself
	love.graphics.setColor(popupOverlay)
	love.graphics.rectangle("fill", 0, 0, wWidth, wHeight)
	love.graphics.setColor(buttonCol)
	love.graphics.rectangle("fill", pauseX, pauseY + pauseSelectY, 117, 24)
end

function boardUI()
	-- outer borders
	love.graphics.setColor(colour.border)
	love.graphics.line(board.l1x, board.l1y, board.l2x, board.l2y)
	love.graphics.setColor(colour.border)
	love.graphics.line(board.l1x + 10 * 18, board.l1y, board.l2x + 10 * 18, board.l2y)

	love.graphics.setColor(colour.top)
	love.graphics.line(board.l3x, board.l3y, board.l4x, board.l4y)
	love.graphics.setColor(colour.border)
	love.graphics.line(board.l3x, board.l3y + 20 * 18, board.l4x, board.l4y + 20 * 18)

	-- next queue
	love.graphics.setColor(colour.bg)
	love.graphics.rectangle("fill", board.nx, board.ny, board.nw, board.nh)
	love.graphics.setColor(colour.queue)
	love.graphics.rectangle("line", board.nx, board.ny, board.nw, board.nh)

	-- next queue text frame
	love.graphics.rectangle("fill", board.n1x - 1, board.n1y, board.n1w + 2, board.n1h)
	love.graphics.setColor(colour.text)
	love.graphics.print("NEXT", monogram, board.n1x + 7, board.n1y - 1)

	-- hold queue
	love.graphics.setColor(colour.bg)
	love.graphics.rectangle("fill", board.hx, board.hy, board.hw, board.hh)
	love.graphics.setColor(colour.queue)
	love.graphics.rectangle("line", board.hx, board.hy, board.hw, board.hh)

	-- hold queue text frame
	love.graphics.setColor(colour.queue)
	love.graphics.rectangle("fill", board.h1x - 1, board.h1y, board.h1w + 2, board.h1h)
	love.graphics.setColor(colour.text)
	love.graphics.print("HOLD", monogram, board.h1x + 7, board.h1y - 1)
end

function grid()
	-- board background
	love.graphics.setColor(colour.bg)
	love.graphics.rectangle("fill", board.l1x, board.l1y, board.w, board.h)

	-- board grid
	love.graphics.setColor(colour.grid)
	-- vertical lines
	for i = 1, 9, 1 do
		love.graphics.line(board.l1x + i * 18, board.l1y, board.l2x + i * 18, board.l2y)
	end
	love.graphics.setColor(colour.grid)
	-- horizontal lines
	for i = 1, 19, 1 do
		love.graphics.line(board.l3x, board.l3y + i * 18, board.l4x, board.l4y + i * 18)
	end
end

function linesShort()
	local textY
	if mode == "ultra" then
		textY = board.ny + 245
	else
		textY = board.ny + 278
	end
	-- lines text
	love.graphics.setColor(colour.border)
	love.graphics.print("Lines", smallText, board.nx, textY)
	love.graphics.setColor(colour.text)
	love.graphics.print(stats.lines, monogramL, board.nx, textY + 7)
end

function lines()
	local textY = board.hy + 288
	-- lines text
	love.graphics.setColor(colour.text)
	love.graphics.printf(stats.lines, largeText, board.hx + 45, textY, 40, "center")
	love.graphics.setColor(colour.border)
	love.graphics.line(board.hx + 45, textY + 26, board.hx + 85, textY + 26)
	love.graphics.setColor(colour.text)
	love.graphics.printf(levelTarget, largeText, board.hx + 45, textY + 27, 40, "center")
end

function score()
	-- score text
	love.graphics.setColor(colour.border)
	love.graphics.print("Score", smallText, board.nx, board.ny + 278)
	love.graphics.setColor(colour.text)
	love.graphics.print(stats.score, monogramL, board.nx, board.ny + 285)
end

function timer()
	-- timer text
	love.graphics.setColor(colour.border)
	love.graphics.print("Time", smallText, board.nx, board.ny + 310)
	love.graphics.setColor(colour.text)
	love.graphics.print(minString .. ":" .. secString, monogramL, board.nx, board.ny + 317)
end

function keyOverlay()
	if keybinds.hold == "space" then
		keybinds.keyX = wWidth - 85
		keybinds.keyY = wHeight - 44
	else
		keybinds.keyX = wWidth - 102
		keybinds.keyY = wHeight - 30
	end

	love.graphics.setColor(keybinds.colour)
	if love.keyboard.isDown(keybinds.left) then
		love.graphics.rectangle("line", keybinds.keyX, keybinds.keyY, 10, 10)
		love.graphics.rectangle("fill", keybinds.keyX, keybinds.keyY, 10, 10)
	else
		love.graphics.rectangle("line", keybinds.keyX, keybinds.keyY, 10, 10)
	end
	if love.keyboard.isDown(keybinds.down) then
		love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY, 10, 10)
		love.graphics.rectangle("fill", keybinds.keyX + 14, keybinds.keyY, 10, 10)
	else
		love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY, 10, 10)
	end
	if love.keyboard.isDown(keybinds.up) then
		love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY - 14, 10, 10)
		love.graphics.rectangle("fill", keybinds.keyX + 14, keybinds.keyY - 14, 10, 10)
	else
		love.graphics.rectangle("line", keybinds.keyX + 14, keybinds.keyY - 14, 10, 10)
	end
	if love.keyboard.isDown(keybinds.right) then
		love.graphics.rectangle("line", keybinds.keyX + 28, keybinds.keyY, 10, 10)
		love.graphics.rectangle("fill", keybinds.keyX + 28, keybinds.keyY, 10, 10)
	else
		love.graphics.rectangle("line", keybinds.keyX + 28, keybinds.keyY, 10, 10)
	end

	if love.keyboard.isDown(keybinds.cc) then
		love.graphics.rectangle("line", keybinds.keyX + 44, keybinds.keyY, 10, 10)
		love.graphics.rectangle("fill", keybinds.keyX + 44, keybinds.keyY, 10, 10)
	else
		love.graphics.rectangle("line", keybinds.keyX + 44, keybinds.keyY, 10, 10)
	end

	if love.keyboard.isDown(keybinds.c) then
		love.graphics.rectangle("line", keybinds.keyX + 58, keybinds.keyY, 10, 10)
		love.graphics.rectangle("fill", keybinds.keyX + 58, keybinds.keyY, 10, 10)
	else
		love.graphics.rectangle("line", keybinds.keyX + 58, keybinds.keyY, 10, 10)
	end

	-- changes shape if hold key is set to the space key
	if love.keyboard.isDown(keybinds.hold) then
		if keybinds.hold == "space" then
			love.graphics.rectangle("line", keybinds.keyX + 5, keybinds.keyY + 14, 60, 10)
			love.graphics.rectangle("fill", keybinds.keyX + 5, keybinds.keyY + 14, 60, 10)
		else
			love.graphics.rectangle("line", keybinds.keyX + 72, keybinds.keyY, 10, 10)
			love.graphics.rectangle("fill", keybinds.keyX + 72, keybinds.keyY, 10, 10)
		end
	else
		if keybinds.hold == "space" then
			love.graphics.rectangle("line", keybinds.keyX + 5, keybinds.keyY + 14, 60, 10)
		else
			love.graphics.rectangle("line", keybinds.keyX + 72, keybinds.keyY, 10, 10)
		end
	end
end

-- debug menu function
function debugUI()
	local condOverlay = ""
	local condOverlay1 = ""
	local condOverlay2 = ""
	local popup = "none"
	local condY = 85
	local condY1 = 85

	if isAbout then
		popup = "isAbout"
	elseif isOptions then
		popup = "isOptions"
	elseif isPaused then
		popup = "isPaused"
	else
		popup = "none"
	end

	if isOverlay then
		condOverlay = "isOverlay"
	else
	end

	if isTimer then
		condOverlay1 = "isTimer"
		-- moves isTimer text to top if isOverlay is false
		if isOverlay == false then
			condY = condY - 15
		end
	else
	end

	if isLicense then
		condOverlay2 = "isLicense"
		if isOverlay or isTimer then
			condY1 = condY1 + 15
		end
	else
	end

	love.graphics.setColor(1, 1, 1)
	love.graphics.print(love.timer.getFPS() .. " FPS", monogram, 10, 10)
	love.graphics.print(wWidth .. "x" .. wHeight, monogram, 10, 25)
	love.graphics.print(state, monogram, 10, 40)
	love.graphics.print(mode, monogram, 10, 55)
	love.graphics.print(popup, monogram, 10, 70)
	love.graphics.print(condOverlay, monogram, 10, condY)
	love.graphics.print(condOverlay1, monogram, 10, condY + 15)
	love.graphics.print(condOverlay2, monogram, 10, condY1)
end
