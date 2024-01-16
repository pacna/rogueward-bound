-- modules
local colormodule = require('modules.color')
local drawmodule = require('modules.draw')

-- core
local entitycore = require('core.entity')
local roguecore = require('core.rogue')

-- components
local playercomponent = require('components.player')

local dungeon = {
    ID = "dungeon"
}

local shouldShowFullView = false
local neighborsPos = {
    SELF = { x = 0, y = 0 },
    LEFT = { x = -1, y = 0 },
    RIGHT = { x = 1, y = 0 },
    TOP = { x = 0, y = -1 },
    DOWN = { x = 0, y = 1 },
    TOP_LEFT = { x = -1, y = -1 },
    TOP_RIGHT = { x = 1, y = -1 },
    DOWN_LEFT = { x = -1, y = 1 },
    DOWN_RIGHT = { x = 1, y = 1 }
}

local entityRGBA = colormodule.getColorRGBA(colormodule.Types.WHITE)

local function determineEntityColor(entity)
    if entity.type == entitycore.Types.WALL then
        return colormodule.Types.BLACK
    end

    return colormodule.Types.BLUE
end

function dungeon.enableFullView()
    shouldShowFullView = true
end

local function drawNarrowView(map)
    for _, pos in pairs(neighborsPos) do
        local xPos = roguecore.currentPlayer.xPos + pos.x
        local yPos = roguecore.currentPlayer.yPos + pos.y
        if roguecore.isWithinMap(xPos, yPos) then
            drawmodule.drawTile(colormodule.getColorRGBA(determineEntityColor(map[xPos][yPos])), xPos, yPos)
            drawmodule.drawImage {
                colorRGBA = entityRGBA,
                imgPath = map[xPos][yPos].imgSrc,
                xPos = xPos,
                yPos = yPos
            }
        end
    end
end

local function drawFullView(map)
    for x = 1, #map do
        for y = 1, #map[x] do
            drawmodule.drawTile(colormodule.getColorRGBA(determineEntityColor(map[x][y])), x, y)
            drawmodule.drawImage {
                colorRGBA = entityRGBA,
                imgPath = map[x][y].imgSrc,
                xPos = x,
                yPos = y
            }
        end
    end
end

function dungeon.render()
    drawmodule.drawBorders {
        colorRGBA = colormodule.getColorRGBA(colormodule.Types.LIGHT_BLUE),
        xPos = 1,
        yPos = 1,
        width = drawmodule.getTileSize() * roguecore.getRow(),
        height = drawmodule.getTileSize() * roguecore.getColumn()
    }

    if shouldShowFullView then
        drawFullView(roguecore.map)
    else
        drawNarrowView(roguecore.map)
    end

    playercomponent.render()
end

return dungeon
