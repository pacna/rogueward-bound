-- core
local entitycore = require("core.entity")
local roguecore = require('core.rogue')

-- components
local playercomponent = require('components.player')

local movement = {}
movement.Key = "movement"


local function isFloor(xPos, yPos)
    return roguecore.map[xPos][yPos].type == entitycore.Type.FLOOR
end

local function isValidXPos(xPos)
    return xPos ~= 0 and xPos <= roguecore.ROW
end

local function isValidYPos(yPos)
    return yPos ~= 0 and yPos <= roguecore.COLUMN
end

local function isWithinMap(dx, dy)
    return isValidXPos(dx) and isValidYPos(dy)
end

function movement.handleMessage(msg)
    if msg.key ~= movement.Key then
        return
    end

    local shouldUpdatePlayerPosition = false
    local playerXPos = roguecore.currentPlayer.xPos + msg.value.dx
    local playerYPos = roguecore.currentPlayer.yPos + msg.value.dy

    if isWithinMap(playerXPos, playerYPos) and isFloor(playerXPos, playerYPos) then
        roguecore.currentPlayer:setPos { x = playerXPos, y = playerYPos }
        shouldUpdatePlayerPosition = true
    end

    if shouldUpdatePlayerPosition then
        playercomponent.render()
    end

end

return movement
