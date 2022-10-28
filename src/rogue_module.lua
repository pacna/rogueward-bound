local entitymodule = require("entity_module")

local rogue = {}
rogue.playerPosition = {}
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
            if seed == entitymodule.Type.WALL then
                rogue.map[i][j] = entitymodule.createWall()
            else
                rogue.map[i][j] = entitymodule.createFloor()
            end
        end
    end
end

local function addEntitiesToMap(maxNumberOfEntities, entity, shouldSetPositionGlobally)
    for i = maxNumberOfEntities, 1, -1 do
        local row = math.random(1, rogue.ROW)
        for j = row, rogue.ROW do
            local column = math.random(1, rogue.COLUMN)
            if rogue.map[j][column].type == entitymodule.Type.FLOOR then
                rogue.map[j][column] = entity
                if shouldSetPositionGlobally then
                    rogue.playerPosition = entitymodule.PlayerPosition:new(j, column)
                end
                break
            end
        end
    end

end

local function loadEntities()
    addEntitiesToMap(5, entitymodule.createMinion(), false)
    addEntitiesToMap(5, entitymodule.createHealth(), false)
    addEntitiesToMap(5, entitymodule.createChest(), false)
    addEntitiesToMap(1, entitymodule.createBoss(), false) -- handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitymodule.createPlayer(), true) -- handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitymodule.createScroll(), false) -- handle edge case where entity can not be loaded b/c the row/col are filled
end

function rogue.loadWorld()
    loadMap()
    loadEntities()
end

return rogue
