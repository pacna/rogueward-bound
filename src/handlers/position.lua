-- core
local entitycore = require("core.entity")
local roguecore = require('core.rogue')

-- factories
local publisher = require('factories.messagebus.publisher')

local position = {}
position.Key = "position"


local function isFloor(xPos, yPos)
    return roguecore.map[xPos][yPos].type == entitycore.Types.FLOOR
end

local function isItem(xPos, yPos)
    return (roguecore.map[xPos][yPos].type == entitycore.Types.HEALTH or
        roguecore.map[xPos][yPos].type == entitycore.Types.WEAPON or
        roguecore.map[xPos][yPos].type == entitycore.Types.SCROLL)
end

local function isEnemy(xPos, yPos)
    return (roguecore.map[xPos][yPos].type == entitycore.Types.MINION or
        roguecore.map[xPos][yPos].type == entitycore.Types.BOSS)
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

function position.handleMessage(msg)
    if msg.key ~= position.Key then
        return
    end

    local playerXPos = roguecore.currentPlayer.xPos + msg.value.dx
    local playerYPos = roguecore.currentPlayer.yPos + msg.value.dy

    if not isWithinMap(playerXPos, playerYPos) then
        return
    end

    if isItem(playerXPos, playerYPos) then
        local selectedEntity = roguecore.map[playerXPos][playerYPos]
        publisher.send(publisher.Types.LOG,
            { type = selectedEntity.type, health = selectedEntity.health, atk = selectedEntity.atk,
                xp = selectedEntity.xp })

        publisher.send(publisher.Types.ITEM,
            { health = selectedEntity.health, atk = selectedEntity.atk, xPos = playerXPos, yPos = playerYPos })
        return
    end

    if isEnemy(playerXPos, playerYPos) then
        publisher.send(publisher.Types.BRAWL, { xPos = playerXPos, yPos = playerYPos })
        return
    end

    if isFloor(playerXPos, playerYPos) then
        roguecore.currentPlayer:setPos { x = playerXPos, y = playerYPos }
    end

end

return position
