local Command = {}
Command.Type = {
    ["Text"] = 1,
    ["Rerender"] = 2
}

function Command:new(type, value)
    self.__index = self
    return setmetatable({
        type = type,
        value = value
    }, self)
end

return Command
