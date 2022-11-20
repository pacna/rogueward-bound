-- modules
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

-- core
local roguecore = require("core.rogue")

local stats = {}
stats.ID = "stats"

local statsRGBA = colormodule.getColorRGBA(colormodule.WHITE)

function stats.render()
    drawmodule.drawText {
        colorRGBA = statsRGBA,
        text = "Player Stats",
        fontSize = 28,
        xPos = 33,
        yPos = 13
    }
    drawmodule.drawText {
        colorRGBA = statsRGBA,
        text = "HP: " .. roguecore.currentPlayer.health,
        fontSize = 20,
        xPos = 33,
        yPos = 14.5
    }
    drawmodule.drawText {
        colorRGBA = statsRGBA,
        text = "XP: " .. roguecore.currentPlayer.xp,
        fontSize = 20,
        xPos = 33,
        yPos = 15.5
    }
    drawmodule.drawText {
        colorRGBA = statsRGBA,
        text = "Atk: " .. roguecore.currentPlayer.atk,
        fontSize = 20,
        xPos = 33,
        yPos = 16.5
    }
end

return stats
