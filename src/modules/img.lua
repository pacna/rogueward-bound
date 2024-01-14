local img = {}

local basePath = "assets/"

img.imgSwitch = {
    BOSS = { basePath .. "boss.png" },
    CHEST = { basePath .. "chest.png" },
    MINION = { basePath .. "minion.png" },
    HEALTH = { basePath .. "heart.png" },
    PLAYER = { basePath .. "player.png" },
    SCROLL = { basePath .. "scroll.png" }
}

function img.getBoss()
    return img.imgSwitch.BOSS
end

function img.getChest()
    return img.imgSwitch.CHEST
end

function img.getMinion()
    return img.imgSwitch.MINION
end

function img.getHealth()
    return img.imgSwitch.HEALTH
end

function img.getPlayer()
    return img.imgSwitch.PLAYER
end

function img.getScroll()
    return img.imgSwitch.SCROLL
end

return img
