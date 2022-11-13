local colormodule = require('modules.color')
local drawmodule = require('modules.draw')
local entitymodule = require('components.entity')
local roguemodule = require('components.rogue')

local grid = {}
grid.ID = "grid"

local borderRGBA = colormodule.getColorRGBA(colormodule.LIGHT_BLUE)
local entityRGBA = colormodule.getColorRGBA(colormodule.WHITE)

local function determineEntityColor(entity)
    if entity.type == entitymodule.Type.WALL
    then
        return colormodule.BLACK
    else
        return colormodule.BLUE
    end
end

function grid.render()
    drawmodule.drawBorders(borderRGBA, 1, 1, drawmodule.getTileSize() * roguemodule.ROW,
        drawmodule.getTileSize() * roguemodule.COLUMN)

    for x = 1, #roguemodule.map do
        for y = 1, #roguemodule.map[x] do
            drawmodule.drawTile(colormodule.getColorRGBA(determineEntityColor(roguemodule.map[x][y])), x, y)
            drawmodule.drawImage(entityRGBA, roguemodule.map[x][y].imgSrc, x, y)
        end
    end
end

return grid
