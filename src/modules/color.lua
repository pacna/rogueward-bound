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

function color.getLoveRGBA(args)
    args.a = args.a or 0

    return { red = args.r / COLOR_MAX, green = args.g / COLOR_MAX, blue = args.b / COLOR_MAX, alpha = args.a / COLOR_MAX }
end

function color.getColorRGBA(colorType)
    local colorRGBA = colorSwitch[colorType]
    return color.getLoveRGBA {
        r = colorRGBA[1],
        g = colorRGBA[2],
        b = colorRGBA[3],
        a = colorRGBA[4]
    }
end

return color
