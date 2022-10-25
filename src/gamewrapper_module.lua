local colormodule = require("color_module")
local roguemodule = require("rogue_module")
local drawmodule = require("draw_module")

local gamewrapper = {}
gamewrapper.width = 2000
gamewrapper.height = 1300
gamewrapper.title = "Love Rogue"
gamewrapper.backgroundColor = colormodule.getColorRGBA(colormodule.GRAY)


function gamewrapper.init()
    math.randomseed(os.time())
    love.window.setMode(gamewrapper.width, gamewrapper.height)
    love.window.setTitle(gamewrapper.title)
    love.graphics.setBackgroundColor(gamewrapper.backgroundColor.red, gamewrapper.backgroundColor.green,
        gamewrapper.backgroundColor.blue)
    roguemodule.loadWorld()
end

function gamewrapper.draw()
    drawmodule.drawMap(roguemodule.map)
    drawmodule.drawSidebar()
end

return gamewrapper
