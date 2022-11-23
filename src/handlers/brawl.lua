-- core
local entitycore = require("core.entity")
local roguecore = require('core.rogue')

local brawl = {}
brawl.Key = "brawl"

local function battle(enemy, player, xPos, yPos)
    local enemyRemainingHealth = enemy.health - player.atk
    local playerRemainingHealth = player.health - enemy.atk

    -- if the player is dead then do nothing
    if player.health < 0 then
        return
    end

    if enemyRemainingHealth > 0 then
        roguecore.map[xPos][yPos].health = enemyRemainingHealth
        -- Seems like the enemy can take a hit. Now it's the player's turn :)
        player:subtractHealth(enemy.atk)
    end

    if enemyRemainingHealth <= 0 then
        roguecore.map[xPos][yPos] = entitycore.createFloor()
        player:setPos { x = xPos, y = yPos }
        player:addXP(enemy.xp)
        return
    end

    if playerRemainingHealth <= 0 then
        return
    end

end

function brawl.handleMessage(msg)
    if msg.key ~= brawl.Key then
        return
    end

    local xPos = msg.value.xPos
    local yPos = msg.value.yPos
    local enemy = roguecore.map[xPos][yPos]

    battle(enemy, roguecore.currentPlayer, xPos, yPos)
end

return brawl
