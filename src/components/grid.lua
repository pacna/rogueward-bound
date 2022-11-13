-- modules
local colormodule = require('modules.color')
local drawmodule = require('modules.draw')

-- core
local entitycore = require('core.entity')
local roguecore = require('core.rogue')

-- components
local playercomponent = require('components.player')

local grid = {}
grid.ID = "grid"

local borderRGBA = colormodule.getColorRGBA(colormodule.LIGHT_BLUE)
local entityRGBA = colormodule.getColorRGBA(colormodule.WHITE)

local function determineEntityColor(entity)
    if entity.type == entitycore.Type.WALL
    then
        return colormodule.BLACK
    else
        return colormodule.BLUE
    end
end

function grid.render()
    drawmodule.drawBorders(borderRGBA, 1, 1, drawmodule.getTileSize() * roguecore.ROW,
        drawmodule.getTileSize() * roguecore.COLUMN)

    for x = 1, #roguecore.map do
        for y = 1, #roguecore.map[x] do
            drawmodule.drawTile(colormodule.getColorRGBA(determineEntityColor(roguecore.map[x][y])), x, y)
            drawmodule.drawImage(entityRGBA, roguecore.map[x][y].imgSrc, x, y)
        end
    end

    playercomponent.render()
end

return grid
