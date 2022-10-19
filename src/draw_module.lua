local colormodule = require('color_module')
local roguemodule = require('rogue_module')

local draw = {}

--[[const]]
local TILE_SIZE = 48
--[[const]]
local GRID_X_PADDING = 0
--[[const]]
local GRID_Y_PADDING = 0


local function nextXPos(xPos)
    return GRID_X_PADDING + (xPos * TILE_SIZE)
end

local function nextYPos(yPos)
    return GRID_Y_PADDING + (yPos * TILE_SIZE)
end

local function drawTile(xPos, yPos, colorType)
    local colorRGBA = colormodule.getColorRGBA(colorType)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.rectangle('fill', nextXPos(xPos), nextYPos(yPos), TILE_SIZE, TILE_SIZE)
end

local function drawImage(imgPath, backgroundColorType, xPos, yPos)
    local colorRGBA = colormodule.getColorRGBA(backgroundColorType)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    local img = love.graphics.newImage(imgPath)
    love.graphics.draw(img, xPos, yPos)
end

local function drawBorders(colorType)
    local colorRGBA = colormodule.getColorRGBA(colorType)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.rectangle('line', nextXPos(1), nextYPos(1), TILE_SIZE * roguemodule.ROW, TILE_SIZE * roguemodule.COLUMN)
end

local function determineEntityColor(entityType)
    if entityType == roguemodule.entityType.WALL
    then
        return colormodule.BLACK
    else
        return colormodule.BLUE
    end
end

--- Draws the map.
-- @param map is a 2D array of number
-- @return void
function draw.drawMap(map)
    for x = 1, #map do
        for y = 1, #map[x] do
            drawTile(x, y, determineEntityColor(map[x][y]))
        end
    end

    drawImage('assets/pokeball.png', colormodule.WHITE, nextXPos(1), nextYPos(1))
    drawBorders(colormodule.LIGHT_BLUE)
end

return draw
