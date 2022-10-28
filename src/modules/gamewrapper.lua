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
end

function gamewrapper.move(key)
    if keyboardmodule.isUpPressed(key) then
        print("up")
    elseif keyboardmodule.isDownPressed(key) then
        print("down")
    elseif keyboardmodule.isLeftPressed(key) then
        print("left")
    elseif keyboardmodule.isRightPressed(key) then
        print("right")
    else
    end
end

return gamewrapper
