require("lua.textures")

function gameInit()
	isPaused = false
	isTimer = false
	textSelect = 1
	sec = 0
	min = 0
end

-- time variables
sec = 0
min = 0

-- game time function
function gameTime(dt)
	-- rendered time strings
	secString = string.format("%s%.3f", 0, sec)
	minString = string.format("%02d", min)

	if sec >= 10 then
		secString = string.format("%.3f", sec)
	else
		secString = string.format("%s%.3f", 0, sec)
	end

	if sec < 60 and isTimer then
		sec = sec + dt
	elseif sec > 59 and isTimer then
		min = min + 1
		sec = 0
	end
end

function pauseKey(key)
	if key == "escape" and state == "game" and isPaused == false then
		isPaused = true
		textSelect = 1
	elseif key == "escape" and state == "game" and isPaused then
		isPaused = false
		textSelect = 1
	end
	
	-- pause screen functionality
	if key == "return" and isPaused and textSelect == 1 then
		isPaused = false
	elseif key == "return" and isPaused and textSelect == 2 then
		gameInit()
	elseif key == "return" and isPaused and textSelect == 3 then
		state = "menu"
		menuTextY = 110
		mode = "none"
		gameInit()
	end
end

function game()
	isTimer = true
	love.graphics.draw(bTex, block.x, block.y)
end