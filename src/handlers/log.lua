-- components
local logcomponent = require('components.log')

-- core
local entitycore = require('core.entity')

local log = {}
log.Key = "log"

function log.handleMessage(msg)
    if msg.key ~= log.Key then
        return
    end

    if msg.value.type == entitycore.Types.SCROLL then
        logcomponent.updateLog("You found the secret scroll!")
        return
    end

    if msg.value.type == entitycore.Types.HEALTH then
        logcomponent.updateLog(string.format("You gain +%d health", msg.value.health))
        return
    end

    if msg.value.type == entitycore.Types.WEAPON then
        logcomponent.updateLog(string.format("You gain +%d atk", msg.value.atk))
        return
    end
end

return log
