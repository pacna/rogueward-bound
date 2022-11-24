-- modules
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

-- core
local roguecore = require("core.rogue")

local player = {}
player.ID = "player"

local backgroundColorRGBA = colormodule.getColorRGBA(colormodule.Types.WHITE)

function player.render()
    drawmodule.drawImage {
        colorRGBA = backgroundColorRGBA,
        imgPath = roguecore.currentPlayer.imgSrc,
        xPos = roguecore.currentPlayer.xPos,
        yPos = roguecore.currentPlayer.yPos
    }
end

return player
