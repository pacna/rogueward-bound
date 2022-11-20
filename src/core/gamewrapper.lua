-- modules
local colormodule = require("modules.color")

-- core
local roguecore = require("core.rogue")

-- factories
local rendererfactory = require('factories.renderer')
local handlerfactory = require('factories.messagebus.handler')
local publisher = require('factories.messagebus.publisher')

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

function gamewrapper.update()
    handlerfactory.run()
end

function gamewrapper.draw()
    rendererfactory.renders()
end

function gamewrapper.move(key)
    publisher.send("keyboard", { keycode = key })
end

return gamewrapper
