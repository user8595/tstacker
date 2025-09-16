require("lua.textures")

-- time variables
sec = 0
min = 0

-- rendered time strings
secString = string.format("%s%.3f", 0, sec)
minString = string.format("%02d", min)

-- game time function
function gameTime(dt)
	if sec >= 10 then
		secString = string.format("%.3f", sec)
	else
		secString = string.format("%s%.3f", 0, sec)
	end
	if sec < 60 and isTimer == true then
		sec = sec + dt
	elseif sec >= 60 and isTimer == true then
		sec = 0
		min = min + 1
	end
end

function game()
	isTimer = true
    love.graphics.draw(bTex, block.x, block.y)
end

function pauseKey(key, isrepeat)
	if key == "escape" and state == "game" and isPaused == false then
		isPaused = true
	elseif key == "escape" and state == "game" and isPaused == true then
		isPaused = false
	end
end
