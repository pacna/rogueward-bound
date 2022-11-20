local Command = {}
Command.Type = {
    ["Text"] = 1,
    ["Rerender"] = 2
}

function Command:new(key, value)
    self.__index = self
    return setmetatable({
        key = key,
        value = value
    }, self)
end

return Command
