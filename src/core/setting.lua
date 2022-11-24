-- modules
local colormodule = require("modules.color")

local setting = {}

local default = {
    WIDTH = 2000,
    HEIGHT = 1300,
    TITLE = "Love Rogue",
}


local backgroundColorRGBA = colormodule.getColorRGBA(colormodule.Types.GRAY)

function setting.load()
    math.randomseed(os.time())
    love.window.setMode(default.WIDTH, default.HEIGHT)
    love.window.setTitle(default.TITLE)
    love.graphics.setBackgroundColor(backgroundColorRGBA.red, backgroundColorRGBA.green, backgroundColorRGBA.blue)
end

return setting
