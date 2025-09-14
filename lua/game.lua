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

function states()
    if state == "title" then
        title()
    elseif state == "menu" then
        menuSelect()
        menu()
    elseif state == "mode" or state == "game" then
        modes()
        if mode == "none" then
        elseif mode == "40" then
            timer()
            lines40()
        elseif mode == "marathon" then
            timer()
            lines()
            score()
        end
    elseif state == "game" then
        game()
        grid()
    end
end

function modeStates()
    if mode == "40" and state == "game" then

    elseif mode == "marathon" and state == "game" then

    end
end