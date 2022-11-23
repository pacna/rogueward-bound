-- core
local entitycore = require("core.entity")

-- entities
local Player = require("entities.player")

local rogue = {}
rogue.currentPlayer = {}
rogue.map = {}

--[[const]]
rogue.ROW = 30
--[[const]]
rogue.COLUMN = 25

local function loadMap()
    for i = 1, rogue.ROW do
        rogue.map[i] = {}
        for j = 1, rogue.COLUMN do
            local seed = math.random(1, 5)
            if seed == entitycore.Types.WALL then
                rogue.map[i][j] = entitycore.createWall()
            else
                rogue.map[i][j] = entitycore.createFloor()
            end
        end
    end
end

local function createEntitiesByType(type)
    if type == entitycore.Types.MINION then
        return entitycore.createMinion()
    end

    if type == entitycore.Types.HEALTH then
        return entitycore.createHealth()
    end

    if type == entitycore.Types.WEAPON then
        return entitycore.createChest()
    end

    if type == entitycore.Types.BOSS then
        return entitycore.createBoss()
    end

    if type == entitycore.Types.SCROLL then
        return entitycore.createScroll()
    end
end

local function addEntitiesToMap(maxNumberOfEntities, entityType)
    for _ = maxNumberOfEntities, 1, -1 do
        local row = math.random(1, rogue.ROW)
        for j = row, rogue.ROW do
            local column = math.random(1, rogue.COLUMN)
            if rogue.map[j][column].type == entitycore.Types.FLOOR then
                rogue.map[j][column] = createEntitiesByType(entityType)
                break;
            end
        end
    end

end

local function loadEntities()
    addEntitiesToMap(5, entitycore.Types.MINION)
    addEntitiesToMap(5, entitycore.Types.HEALTH)
    addEntitiesToMap(5, entitycore.Types.WEAPON)
    -- TODO: handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitycore.Types.BOSS)
    -- TODO: handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitycore.Types.SCROLL)
end

local function loadPlayer()
    local xPos = math.random(1, rogue.ROW)
    local yPos = math.random(1, rogue.COLUMN)
    -- TODO: handle edge case where player position might remove an existing entity on the map (specifically the boss)
    rogue.map[xPos][yPos] = entitycore.createFloor()
    local player = entitycore.createPlayer()
    rogue.currentPlayer = Player:new {
        xPos = xPos,
        yPos = yPos,
        health = player.health,
        xp = player.xp,
        atk = player.atk,
        imgSrc = player.imgSrc
    }
end

function rogue.loadWorld()
    loadMap()
    loadEntities()
    loadPlayer()
end

return rogue
