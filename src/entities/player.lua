local Player = {}

function Player:new(xPos, yPos, health, xp, atk, imgSrc)
    self.__index = self
    return setmetatable({
        xPos = xPos,
        yPos = yPos,
        health = health,
        xp = xp,
        atk = atk,
        imgSrc = imgSrc
    }, self)
end

function Player:debugPrint()
    print("x: " .. self.xPos, "y: " .. self.yPos, "health: " .. self.health, "XP: " .. self.xp, "ATK: " .. self.atk)
end

function Player:setXPos(xPos)
    self.xPos = xPos or self.xPos
end

function Player:setYPos(yPos)
    self.yPos = yPos or self.yPos
end

function Player:addHealth(health)
    self.health = self.health + health
end

function Player:subtractHealth(health)
    self.health = self.health - health
end

function Player:addXp(xp)
    self.xp = self.xp + xp
end

function Player:increaseAtkPower(atk)
    self.atk = self.atk + atk
end

return Player
