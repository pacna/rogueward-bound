local colormodule = require('modules.color')
local drawmodule = require('modules.draw')
local roguemodule = require("components.rogue")
local imgmodule = require("modules.img")

local sidebar = {}
sidebar.ID = "sidebar"


local keyRGBA = colormodule.getColorRGBA(colormodule.WHITE)
local playerStatsRGBA = colormodule.getColorRGBA(colormodule.WHITE)
local gameLogRGBA = colormodule.getColorRGBA(colormodule.WHITE)
local borderRGBA = colormodule.getColorRGBA(colormodule.RED)


local function drawKeys()
    local imgXPosition = roguemodule.ROW + 3
    local textXPosition = roguemodule.ROW + 4.5

    local imgYInitPosition = 3
    local textYInitPosition = 3.25

    drawmodule.drawText(keyRGBA, "Key", 28, imgXPosition, 1.5)

    for key, value in pairs(imgmodule.imgSwitch) do
        drawmodule.drawImage(keyRGBA, value, imgXPosition, imgYInitPosition)
        drawmodule.drawText(keyRGBA, key, 20, textXPosition, textYInitPosition)

        imgYInitPosition = imgYInitPosition + 1.5
        textYInitPosition = textYInitPosition + 1.5
    end
end

local function drawPlayerStats()
    drawmodule.drawText(playerStatsRGBA, "Player Stats", 28, 33, 13)
    drawmodule.drawText(playerStatsRGBA, "HP: " .. roguemodule.currentPlayer.health, 20, 33, 14.5)
    drawmodule.drawText(playerStatsRGBA, "XP: " .. roguemodule.currentPlayer.xp, 20, 33, 15.5)
    drawmodule.drawText(playerStatsRGBA, "Atk: " .. roguemodule.currentPlayer.atk, 20, 33, 16.5)
end

local function drawGameLog()
    drawmodule.drawText(gameLogRGBA, "Game log", 28, 33, 18)
    drawmodule.drawText(gameLogRGBA, "Have fun!", 20, 33, 19.5)
end

function sidebar.render()
    drawmodule.drawBorders(borderRGBA, 32, 1, 360 + drawmodule.getTileSize(),
        drawmodule.getTileSize() * roguemodule.COLUMN)

    drawKeys()
    drawPlayerStats()
    drawGameLog()
end

return sidebar
