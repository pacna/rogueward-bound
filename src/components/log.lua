-- modules
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

local log = {}
log.ID = "log"

local logRGBA = colormodule.getColorRGBA(colormodule.WHITE)

function log.render()
    drawmodule.drawText(logRGBA, "Game log", 28, 33, 18)
    drawmodule.drawText(logRGBA, "Have fun!", 20, 33, 19.5)
end

return log
