-- core
local roguecore = require('core.rogue')

local stats = {}
stats.Key = "stats"

function stats.handleMessage(msg)
    if msg.key ~= stats.Key then
        return
    end

    if msg.value.atk ~= 0 then
        roguecore.currentPlayer:addAtkPower(msg.value.atk)
    end

    if msg.value.health ~= 0 then
        roguecore.currentPlayer:addHealth(msg.value.health)
    end
end

return stats
