-- components
local logcomponent = require('components.log')

-- core
local roguecore = require('core.rogue')
local entitycore = require('core.entity')

local log = {}
log.Key = "log"

function log.handleMessage(msg)
    if msg.key ~= log.Key then
        return
    end

    local currentPlayer = roguecore.currentPlayer
    if not next(msg.value) then
        if currentPlayer.health > 0 then
            logcomponent.updateLog("You won!")
        else
            logcomponent.updateLog("Game over")
        end

        return
    end

    local logContent = msg.value

    if logContent.type == entitycore.Types.SCROLL then
        logcomponent.updateLog("You found the secret scroll!")
        return
    end

    if logContent.type == entitycore.Types.HEALTH then
        logcomponent.updateLog(string.format("You gain +%d health", logContent.health))
        return
    end

    if logContent.type == entitycore.Types.WEAPON then
        logcomponent.updateLog(string.format("You gain +%d atk", logContent.atk))
        return
    end
end

return log
