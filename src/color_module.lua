local color = {}

local COLOR_MAX = 255

function color.getLoveRGBA(r, g, b, a)
    a = a or 0

    return { red = r / COLOR_MAX, green = g / COLOR_MAX, blue = b / COLOR_MAX, alpha = a / COLOR_MAX }
end

return color
