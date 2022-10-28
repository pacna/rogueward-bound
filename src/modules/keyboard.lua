local keyboard = {}

local keySwitch = {
    ["up"] = { "up", "w" },
    ["down"] = { "down", "s" },
    ["left"] = { "left", "a" },
    ["right"] = { "right", "d" }
}

function keyboard.isUpPressed(key)
    return keySwitch["up"][1] == key or keySwitch["up"][2] == key
end

function keyboard.isDownPressed(key)
    return keySwitch["down"][1] == key or keySwitch["down"][2] == key
end

function keyboard.isLeftPressed(key)
    return keySwitch["left"][1] == key or keySwitch["left"][2] == key
end

function keyboard.isRightPressed(key)
    return keySwitch["right"][1] == key or keySwitch["right"][2] == key
end

return keyboard
