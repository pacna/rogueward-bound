local player = {}
-- Class
player.Player = {}

function player.Player:new(xPos, yPos, health, xp, atk, imgSrc)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    self.xPos = xPos
    self.yPos = yPos
    self.health = health
    self.xp = xp
    self.atk = atk
    self.imgSrc = imgSrc
    return instance
end

function player.Player:debugPrint()
    print("x: " .. self.xPos, "y: " .. self.yPos, "health: " .. self.health, "XP: " .. self.xp, "ATK: " .. self.atk)
end

function player.Player:setXPos(xPos)
    self.xPos = xPos or self.xPos
end

function player.Player:setYPos(yPos)
    self.yPos = yPos or self.yPos
end

return player
