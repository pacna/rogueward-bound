local entity = {}
entity.Type = {
    WALL = 1,
    FLOOR = 2,
    MINION = 3,
    BOSS = 4,
    HEALTH = 5,
    WEAPON = 6,
    PLAYER = 7,
    SCROLL = 8
}

local basePath = "assets/"

function entity.createWall()
    return { type = entity.Type.WALL, health = 0, xp = 0, atk = 0, imgSrc = "" }
end

function entity.createFloor()
    return { type = entity.Type.FLOOR, health = 0, xp = 0, atk = 0, imgSrc = "" }
end

function entity.createMinion()
    return { type = entity.Type.MINION, health = 10, xp = 1, atk = 1, imgSrc = basePath .. "mini-boss.png" }
end

function entity.createBoss()
    return { type = entity.Type.BOSS, health = 50, xp = 100, atk = 5, imgSrc = basePath .. "boss.png" }
end

function entity.createHealth()
    return { type = entity.Type.HEALTH, health = 10, xp = 0, atk = 0, imgSrc = basePath .. "heart.png" }
end

function entity.createWeapon()
    return { type = entity.Type.WEAPON, health = 0, xp = 10, atk = 0, imgSrc = basePath .. "chest.png" }
end

function entity.createPlayer()
    return { type = entity.Type.PLAYER, health = 20, xp = 0, atk = 5, imgSrc = basePath .. "pokeball.png" }
end

function entity.createScroll()
    return { type = entity.Type.SCROLL, health = 0, xp = 5, atk = 0, imgSrc = basePath .. "scroll.png" }
end

return entity
