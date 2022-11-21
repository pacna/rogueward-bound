-- handlers
local positionhandler = require('handlers.position')
local keyboardhandler = require('handlers.keyboard')
local loghandler = require('handlers.log')

-- self
local messagebus = require('factories.messagebus.bus')

local handler = {}

local handlers = {
    [keyboardhandler.Key] = keyboardhandler.handleMessage,
    [positionhandler.Key] = positionhandler.handleMessage,
    [loghandler.Key] = loghandler.handleMessage
}


function handler.run()
    if messagebus.isEmpty() then
        return
    end

    for _, handleMessage in pairs(handlers) do
        handleMessage(messagebus.peek())
    end

    messagebus.remove()

end

return handler
