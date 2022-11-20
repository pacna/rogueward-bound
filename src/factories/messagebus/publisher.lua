-- self
local messagebus = require('factories.messagebus.bus')

local publisher = {}

function publisher.sendMessage(msg)
    messagebus.add(msg)
end

return publisher
