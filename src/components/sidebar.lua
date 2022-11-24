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

local keyRGBA = colormodule.getColorRGBA(colormodule.Types.WHITE)
local borderRGBA = colormodule.getColorRGBA(colormodule.Types.RED)

local function drawKeys()
    local imgXPosition = roguecore.ROW + 3
    local textXPosition = roguecore.ROW + 4.5

    local imgYInitPosition = 3
    local textYInitPosition = 3.25

    drawmodule.drawText {
        colorRGBA = keyRGBA,
        text = "Key",
        fontSize = 28,
        xPos = imgXPosition,
        yPos = 1.5
    }

    for header, src in pairs(imgmodule.imgSwitch) do
        drawmodule.drawImage {
            colorRGBA = keyRGBA,
            imgPath = src,
            xPos = imgXPosition,
            yPos = imgYInitPosition
        }
        drawmodule.drawText {
            colorRGBA = keyRGBA,
            text = header,
            fontSize = 20,
            xPos = textXPosition,
            yPos = textYInitPosition
        }

        imgYInitPosition = imgYInitPosition + 1.5
        textYInitPosition = textYInitPosition + 1.5
    end
end

function sidebar.render()
    drawmodule.drawBorders {
        colorRGBA = borderRGBA,
        xPos = 32,
        yPos = 1,
        width = 360 + drawmodule.getTileSize(),
        height = drawmodule.getTileSize() * roguecore.COLUMN
    }

    drawKeys()
    statscomponent.render()
    logcomponent.render()
end

return sidebar
