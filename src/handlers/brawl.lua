-- core
local entitycore = require("core.entity")
local roguecore = require('core.rogue')

-- factories
local publisher = require('factories.messagebus.publisher')

local brawl = {}
brawl.Key = "brawl"

local function battle(enemy, player, xPos, yPos)
    local enemyRemainingHealth = enemy.health - player.atk

    if enemyRemainingHealth > 0 then
        roguecore.map[xPos][yPos].health = enemyRemainingHealth
        -- Seems like the enemy can take a hit. Now it's the player's turn :(
        player:subtractHealth(enemy.atk)
        publisher.send(publisher.Types.LOG, { type = enemy.type, health = enemyRemainingHealth, atk = enemy.atk, xp = 0 })
    end

    if player.health <= 0 then
        publisher.send(publisher.Types.LOG, {})
        publisher.send(publisher.Types.DONE, {})
        return
    end

    if enemyRemainingHealth <= 0 then
        roguecore.map[xPos][yPos] = entitycore.createFloor()
        player:setPos { x = xPos, y = yPos }
        player:addXP(enemy.xp)
        publisher.send(publisher.Types.LOG, { type = enemy.type, health = 0, atk = 0, xp = enemy.xp })

        if enemy.type == entitycore.Types.BOSS then
            publisher.send(publisher.Types.LOG, {})
            publisher.send(publisher.Types.DONE, {})
            return
        end
        return
    end

end

function brawl.handleMessage(msg)
    if msg.key ~= brawl.Key then
        return
    end

    -- if the player is dead then do nothing
    if roguecore.currentPlayer.health <= 0 then
        return
    end

    local xPos = msg.value.xPos
    local yPos = msg.value.yPos
    local enemy = roguecore.map[xPos][yPos]

    battle(enemy, roguecore.currentPlayer, xPos, yPos)
end

return brawl
