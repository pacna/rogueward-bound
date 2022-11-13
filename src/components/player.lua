-- modules
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

-- core
local roguecore = require("core.rogue")

local player = {}
player.ID = "player"

local backgroundColorRGBA = colormodule.getColorRGBA(colormodule.WHITE)

function player.render()
    drawmodule.drawImage(backgroundColorRGBA, roguecore.currentPlayer.imgSrc, roguecore.currentPlayer.xPos,
        roguecore.currentPlayer.yPos)
end

return player
