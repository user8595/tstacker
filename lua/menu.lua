require("lua.ui")

local function selectReset()
    textSelect = 1
    menuSelectY = 55  
end

function selectFunc()
    -- menu screen
    if textSelect < 1 and state == "menu" and isAbout == false then
        textSelect = 4
        menuSelectY = -35
    elseif textSelect > 4 and state == "menu" and isAbout == false then
        textSelect = 1
        menuSelectY = 55
    end

end

function inputMenu(key, isrepeat)
    if key == "escape" and state == "title" then
        love.event.quit(0)
    elseif key == "escape" and state == "menu" and isAbout == false and isOptions == false then
        state = "title"
        selectReset()
    elseif key == "escape" and state == "mode" then
        state = "menu"
        selectReset()
    end

    if key == "f4" and isDebug == false then
        isDebug = true
    elseif key == "f4" and isDebug == true then
        isDebug = false
    end
    
    if key == "f8" and isOverlay == false then
        isOverlay = true
    elseif key == "f8" and isOverlay == true then
        isOverlay = false
    end

    -- for testing purposes
    -- if key == "f6" and isTimer == false then
    --     isTimer = true
    -- elseif key == "f6" and isTimer == true then
    --     isTimer = false
    -- end

    -- if key == "f7" and mode == "none" then
    --     mode = "marathon"
    -- elseif key == "f7" and mode == "marathon" then
    --     mode = "40"
    -- elseif key == "f7" and mode == "40" then
    --     mode = "none"
    -- loops
    -- end
end

function menuSelectKey(key, isrepeat)
    if key == keybinds.down and state == "menu" and isAbout == false and isOptions == false then
        menuSelectY = menuSelectY - 30
        textSelect = textSelect + 1
    elseif key == keybinds.up and state == "menu" and isAbout == false and isOptions == false then
        menuSelectY = menuSelectY + 30
        textSelect = textSelect - 1
    end
end

function tSMenu(key, isrepeat)
    if key == "return" and state == "title" then
        state = "menu"
    elseif key == "return" and state == "menu" and textSelect == 1 and isAbout == false and isOptions == false then
        state = "mode"
    elseif key == "return" and state == "menu" and textSelect == 2 and isAbout == false and isOptions == false then
        isOptions = true
    elseif key == "return" and state == "menu" and textSelect == 3 and isAbout == false and isOptions == false then
        isAbout = true
    elseif key == "return" and state == "menu" and textSelect == 4 and isAbout == false and isOptions == false then
        love.event.quit(0)
    end
end

-- key toggles
function debugToggle()
    if isDebug == true then
        debugUI()
    else
    end

    if isOverlay == true then
        keyOverlay()
    else
    end
end