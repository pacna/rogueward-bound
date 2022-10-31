local colormodule = require("modules.color")
local keyboardmodule = require("modules.keyboard")
local roguemodule = require("modules.rogue")
local drawmodule = require("modules.draw")

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
    drawmodule.drawPlayer()
end

function gamewrapper.move(key)
    if keyboardmodule.isQuit(key) then
        love.event.quit()
    else
        roguemodule.moveAndRenderPlayer(key, drawmodule.drawPlayer)
    end
end

return gamewrapper
