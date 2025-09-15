function states()
    if state == "title" then
        title()
    elseif state == "menu" then
        menuSelect()
        menu()
        menuTip()
    elseif state == "mode" then
        menuTip()
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