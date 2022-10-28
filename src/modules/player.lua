local player = {}

-- Class
local Player = { x = -1, y = -1 }

function Player:print()
    print("x: " .. Player.x, "y: " .. Player.y)
end

function player.new(xPos, yPos)
    local self = {}
    self.x = xPos
    self.y = yPos
    setmetatable(self, { __index = Player })
    return self
end

return player
