local img = {}

local basePath = "assets/"

img.imgSwitch = {
    ["Boss"] = { basePath .. "boss.png" },
    ["Chest"] = { basePath .. "chest.png" },
    ["Minion"] = { basePath .. "minion.png" },
    ["Health"] = { basePath .. "heart.png" },
    ["Player"] = { basePath .. "pokeball.png" },
    ["Scroll"] = { basePath .. "scroll.png" }
}

function img.getBoss()
    return img.imgSwitch["Boss"]
end

function img.getChest()
    return img.imgSwitch["Chest"]
end

function img.getMinion()
    return img.imgSwitch["Minion"]
end

function img.getHealth()
    return img.imgSwitch["Health"]
end

function img.getPlayer()
    return img.imgSwitch["Player"]
end

function img.getScroll()
    return img.imgSwitch["Scroll"]
end

return img
