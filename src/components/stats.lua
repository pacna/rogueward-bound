-- modules
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

-- core
local roguecore = require("core.rogue")

local stats = {}
stats.ID = "stats"

local statsRGBA = colormodule.getColorRGBA(colormodule.WHITE)

function stats.render()
    drawmodule.drawText(statsRGBA, "Player Stats", 28, 33, 13)
    drawmodule.drawText(statsRGBA, "HP: " .. roguecore.currentPlayer.health, 20, 33, 14.5)
    drawmodule.drawText(statsRGBA, "XP: " .. roguecore.currentPlayer.xp, 20, 33, 15.5)
    drawmodule.drawText(statsRGBA, "Atk: " .. roguecore.currentPlayer.atk, 20, 33, 16.5)
end

return stats
