-- core
local roguecore = require('core.rogue')
local entitycore = require('core.entity')

-- factories
local publisher = require('factories.messagebus.publisher')

local item = {}
item.Key = "item"

function item.handleMessage(msg)
    if msg.key ~= item.Key then
        return
    end

    local itemContent = msg.value

    if itemContent.atk ~= 0 then
        roguecore.currentPlayer:addAtkPower(itemContent.atk)
    end

    if itemContent.health ~= 0 then
        roguecore.currentPlayer:addHealth(itemContent.health)
    end

    roguecore.map[itemContent.xPos][itemContent.yPos] = entitycore.createFloor()
    roguecore.currentPlayer:setPos { x = itemContent.xPos, y = itemContent.yPos }

    publisher.send(publisher.Types.LOG,
        { type = itemContent.type, health = itemContent.health, atk = itemContent.atk, xp = 0 })
end

return item
