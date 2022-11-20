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
            if seed == entitycore.Type.WALL then
                rogue.map[i][j] = entitycore.createWall()
            else
                rogue.map[i][j] = entitycore.createFloor()
            end
        end
    end
end

local function addEntitiesToMap(maxNumberOfEntities, entity)
    for _ = maxNumberOfEntities, 1, -1 do
        local row = math.random(1, rogue.ROW)
        for j = row, rogue.ROW do
            local column = math.random(1, rogue.COLUMN)
            if rogue.map[j][column].type == entitycore.Type.FLOOR then
                rogue.map[j][column] = entity
                break;
            end
        end
    end

end

local function loadEntities()
    addEntitiesToMap(5, entitycore.createMinion())
    addEntitiesToMap(5, entitycore.createHealth())
    addEntitiesToMap(5, entitycore.createChest())
    -- TODO: handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitycore.createBoss())
    -- TODO: handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitycore.createScroll())
end

local function loadPlayer()
    local xPos = math.random(1, rogue.ROW)
    local yPos = math.random(1, rogue.COLUMN)
    -- TODO: handle edge case where player position might remove an existing entity on the map (specifically the boss)
    rogue.map[xPos][yPos] = entitycore.createFloor()
    local player = entitycore.createPlayer()
    rogue.currentPlayer = Player:new(xPos, yPos, player.health, player.xp, player.atk, player.imgSrc)
end

function rogue.loadWorld()
    loadMap()
    loadEntities()
    loadPlayer()
end

return rogue
