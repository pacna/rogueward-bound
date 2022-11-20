-- entities
local Command = require('entities.command')

-- self
local messagebus = require('factories.messagebus.bus')

local publisher = {}

function publisher.send(key, value)
    local msg = Command:new(key, value)
    messagebus.add(msg)
end

return publisher
