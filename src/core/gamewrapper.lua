-- modules
local colormodule = require("modules.color")
local keyboardmodule = require("modules.keyboard")

-- core
local roguecore = require("core.rogue")

-- components
local playercomponent = require('components.player')

-- factories
local rendererfactory = require('factories.renderer')

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
    roguecore.loadWorld()
end

function gamewrapper.draw()
    rendererfactory.renders()
end

function gamewrapper.move(key)
    if keyboardmodule.isQuit(key) then
        love.event.quit()
    else
        roguecore.moveAndRenderPlayer(key, playercomponent.render)
    end
end

return gamewrapper
