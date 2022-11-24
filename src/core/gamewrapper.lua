-- core
local roguecore = require("core.rogue")
local settingcore = require('core.setting')

-- factories
local rendererfactory = require('factories.renderer')
local handlerfactory = require('factories.messagebus.handler')
local publisher = require('factories.messagebus.publisher')

local gamewrapper = {}

function gamewrapper.init()
    settingcore.load()
    roguecore.loadWorld()
end

function gamewrapper.update()
    handlerfactory.run()
end

function gamewrapper.draw()
    rendererfactory.renders()
end

function gamewrapper.move(key)
    publisher.send(publisher.Types.KEYBOARD, { keycode = key })
end

return gamewrapper
