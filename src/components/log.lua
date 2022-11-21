-- modules
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

local log = {}
log.ID = "log"

local displayedText = "Have fun!"

local logRGBA = colormodule.getColorRGBA(colormodule.WHITE)

function log.updateLog(text)
    displayedText = text
end

function log.render()
    drawmodule.drawText {
        colorRGBA = logRGBA,
        text = "Game log",
        fontSize = 28,
        xPos = 33,
        yPos = 18
    }
    drawmodule.drawText {
        colorRGBA = logRGBA,
        text = displayedText,
        fontSize = 20,
        xPos = 33,
        yPos = 19.5
    }
end

return log
