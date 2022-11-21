-- modules
local imgmodule = require("modules.img")

local entity = {}
entity.Types = {
    WALL = 1,
    FLOOR = 2,
    MINION = 3,
    BOSS = 4,
    HEALTH = 5,
    WEAPON = 6,
    PLAYER = 7,
    SCROLL = 8
}

function entity.createWall()
    return { type = entity.Types.WALL, health = 0, xp = 0, atk = 0, imgSrc = "" }
end

function entity.createFloor()
    return { type = entity.Types.FLOOR, health = 0, xp = 0, atk = 0, imgSrc = "" }
end

function entity.createMinion()
    return { type = entity.Types.MINION, health = 10, xp = 1, atk = 1, imgSrc = imgmodule.getMinion() }
end

function entity.createBoss()
    return { type = entity.Types.BOSS, health = 50, xp = 100, atk = 5, imgSrc = imgmodule.getBoss() }
end

function entity.createHealth()
    return { type = entity.Types.HEALTH, health = 10, xp = 0, atk = 0, imgSrc = imgmodule.getHealth() }
end

function entity.createChest()
    return { type = entity.Types.WEAPON, health = 0, xp = 0, atk = 10, imgSrc = imgmodule.getChest() }
end

function entity.createPlayer()
    return { type = entity.Types.PLAYER, health = 30, xp = 0, atk = 5, imgSrc = imgmodule.getPlayer() }
end

function entity.createScroll()
    return { type = entity.Types.SCROLL, health = 0, xp = 5, atk = 0, imgSrc = imgmodule.getScroll() }
end

return entity
