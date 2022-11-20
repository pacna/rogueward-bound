-- handlers
local movementhandler = require('handlers.movement')
local keyboardhandler = require('handlers.keyboard')

-- self
local messagebus = require('factories.messagebus.bus')

local handler = {}

local handlers = {
    [keyboardhandler.Key] = keyboardhandler.handleMessage,
    [movementhandler.Key] = movementhandler.handleMessage
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
