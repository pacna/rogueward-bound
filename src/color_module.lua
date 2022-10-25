local color = {}
color.WHITE = 1
color.BLACK = 2
color.BLUE = 3
color.LIGHT_BLUE = 4
color.GRAY = 5
color.RED = 6

--[[const]]
local COLOR_MAX = 255

local colorSwitch = {
    [color.WHITE] = { 255, 255, 255, 255 },
    [color.BLACK] = { 0, 0, 0, 255 },
    [color.BLUE] = { 52, 49, 76 },
    [color.LIGHT_BLUE] = { 0, 223, 252 },
    [color.GRAY] = { 35, 35, 35 },
    [color.RED] = { 200, 0, 0, 255 }
}

function color.getLoveRGBA(r, g, b, a)
    a = a or 0

    return { red = r / COLOR_MAX, green = g / COLOR_MAX, blue = b / COLOR_MAX, alpha = a / COLOR_MAX }
end

function color.getColorRGBA(colorType)
    local colorRGBA = colorSwitch[colorType]
    return color.getLoveRGBA(colorRGBA[1], colorRGBA[2], colorRGBA[3], colorRGBA[4])
end

return color
