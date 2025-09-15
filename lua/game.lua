-- time variables
sec = 0
min = 0

function gameTime(dt)
    if sec <= 60 and isTimer == true then
        sec = sec + dt
    elseif sec >= 60 and isTimer == true then
        sec = 0
        min = min + 1
    elseif isTimer == false then
        sec = 0
        min = 0
    end
    
    if sec >= 10 then 
        secString = string.format("%.3f", sec)
    else
        secString = string.format("%s%.3f", 0, sec)
    end
    
    minString = string.format("%02d", min)
end

function game()
    
end