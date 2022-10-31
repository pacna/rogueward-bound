local entitymodule = require("components.entity")
local Player = require("entities.player")
local keyboardmodule = require("modules.keyboard")

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
            if seed == entitymodule.Type.WALL then
                rogue.map[i][j] = entitymodule.createWall()
            else
                rogue.map[i][j] = entitymodule.createFloor()
            end
        end
    end
end

local function addEntitiesToMap(maxNumberOfEntities, entity)
    for _ = maxNumberOfEntities, 1, -1 do
        local row = math.random(1, rogue.ROW)
        for j = row, rogue.ROW do
            local column = math.random(1, rogue.COLUMN)
            if rogue.map[j][column].type == entitymodule.Type.FLOOR then
                rogue.map[j][column] = entity
                break;
            end
        end
    end

end

local function loadEntities()
    addEntitiesToMap(5, entitymodule.createMinion())
    addEntitiesToMap(5, entitymodule.createHealth())
    addEntitiesToMap(5, entitymodule.createChest())
    -- TODO: handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitymodule.createBoss())
    -- TODO: handle edge case where entity can not be loaded b/c the row/col are filled
    addEntitiesToMap(1, entitymodule.createScroll())
end

local function loadPlayer()
    local xPos = math.random(1, rogue.ROW)
    local yPos = math.random(1, rogue.COLUMN)
    -- TODO: handle edge case where player position might remove an existing entity on the map (specifically the boss)
    rogue.map[xPos][yPos] = entitymodule.createFloor()
    local player = entitymodule.createPlayer()
    rogue.currentPlayer = Player:new(xPos, yPos, player.health, player.xp, player.atk, player.imgSrc)
end

local function isValidXPos(xPos)
    return xPos ~= 0 and xPos <= rogue.ROW
end

local function isValidYPos(yPos)
    return yPos ~= 0 and yPos <= rogue.COLUMN
end

local function isFloor(newXPos, newYPos)
    local xPos = newXPos or rogue.currentPlayer.xPos
    local yPos = newYPos or rogue.currentPlayer.yPos

    return rogue.map[xPos][yPos].type == entitymodule.Type.FLOOR
end

local function isWithinMap(newXPos, newYPos)
    local xPos = newXPos or rogue.currentPlayer.xPos
    local yPos = newYPos or rogue.currentPlayer.yPos

    return isValidXPos(xPos) and isValidYPos(yPos)
end

local function movePlayerUp()
    rogue.currentPlayer:setYPos(rogue.currentPlayer.yPos - 1)
end

local function movePlayerDown()
    rogue.currentPlayer:setYPos(rogue.currentPlayer.yPos + 1)
end

local function movePlayerLeft()
    rogue.currentPlayer:setXPos(rogue.currentPlayer.xPos - 1)
end

local function movePlayerRight()
    rogue.currentPlayer:setXPos(rogue.currentPlayer.xPos + 1)
end

function rogue.moveAndRenderPlayer(key, renderPlayerFn)
    local shouldUpdatePlayerPosition = false
    if keyboardmodule.isUpPressed(key) and isWithinMap(nil, rogue.currentPlayer.yPos - 1) and
        isFloor(nil, rogue.currentPlayer.yPos - 1) then
        movePlayerUp()
        shouldUpdatePlayerPosition = true
    elseif keyboardmodule.isDownPressed(key) and isWithinMap(nil, rogue.currentPlayer.yPos + 1) and
        isFloor(nil, rogue.currentPlayer.yPos + 1) then
        movePlayerDown()
        shouldUpdatePlayerPosition = true
    elseif keyboardmodule.isLeftPressed(key) and isWithinMap(rogue.currentPlayer.xPos - 1) and
        isFloor(rogue.currentPlayer.xPos - 1) then
        movePlayerLeft()
        shouldUpdatePlayerPosition = true
    elseif keyboardmodule.isRightPressed(key) and isWithinMap(rogue.currentPlayer.xPos + 1) and
        isFloor(rogue.currentPlayer.xPos + 1) then
        movePlayerRight()
        shouldUpdatePlayerPosition = true
    end

    if shouldUpdatePlayerPosition then
        renderPlayerFn()
    end

end

function rogue.loadWorld()
    loadMap()
    loadEntities()
    loadPlayer()
end

return rogue
