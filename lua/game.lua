require("lua.defaults")

function debugToggle()
    if isDebug == true then
        debugUI()
    else
    end
end

function overlayToggle()
    if isOverlay == true then
        keyOverlay()
    else
    end
end
