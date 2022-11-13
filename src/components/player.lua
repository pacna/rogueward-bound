local roguemodule = require("components.rogue")
local drawmodule = require('modules.draw')
local colormodule = require('modules.color')

local player = {}
player.ID = "player"

local playerBackgroundColorRGBA = colormodule.getColorRGBA(colormodule.WHITE)

function player.render()
    drawmodule.drawImage(playerBackgroundColorRGBA, roguemodule.currentPlayer.imgSrc, roguemodule.currentPlayer.xPos,
        roguemodule.currentPlayer.yPos)
end

return player
