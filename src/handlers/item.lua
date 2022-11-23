-- core
local roguecore = require('core.rogue')
local entitycore = require('core.entity')

local item = {}
item.Key = "item"

function item.handleMessage(msg)
    if msg.key ~= item.Key then
        return
    end

    local entityHealth = msg.value.health
    local entityAtk = msg.value.atk

    if entityAtk ~= 0 then
        roguecore.currentPlayer:addAtkPower(entityAtk)
    end

    if entityHealth ~= 0 then
        roguecore.currentPlayer:addHealth(entityHealth)
    end

    roguecore.map[msg.value.xPos][msg.value.yPos] = entitycore.createFloor()
    roguecore.currentPlayer:setPos { x = msg.value.xPos, y = msg.value.yPos }
end

return item
