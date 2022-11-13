-- modules
local colormodule = require('modules.color')
local drawmodule = require('modules.draw')
local imgmodule = require("modules.img")

-- core
local roguecore = require("core.rogue")

-- components
local logcomponent = require('components.log')
local statscomponent = require('components.stats')

local sidebar = {}
sidebar.ID = "sidebar"


local keyRGBA = colormodule.getColorRGBA(colormodule.WHITE)
local borderRGBA = colormodule.getColorRGBA(colormodule.RED)


local function drawKeys()
    local imgXPosition = roguecore.ROW + 3
    local textXPosition = roguecore.ROW + 4.5

    local imgYInitPosition = 3
    local textYInitPosition = 3.25

    drawmodule.drawText(keyRGBA, "Key", 28, imgXPosition, 1.5)

    for header, src in pairs(imgmodule.imgSwitch) do
        drawmodule.drawImage(keyRGBA, src, imgXPosition, imgYInitPosition)
        drawmodule.drawText(keyRGBA, header, 20, textXPosition, textYInitPosition)

        imgYInitPosition = imgYInitPosition + 1.5
        textYInitPosition = textYInitPosition + 1.5
    end
end

function sidebar.render()
    drawmodule.drawBorders(borderRGBA, 32, 1, 360 + drawmodule.getTileSize(),
        drawmodule.getTileSize() * roguecore.COLUMN)

    drawKeys()
    statscomponent.render()
    logcomponent.render()
end

return sidebar
