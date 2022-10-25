local colormodule = require("color_module")
local roguemodule = require("rogue_module")
local entitymodule = require("entity_module")

local draw = {}

-- [[const]]
local TILE_SIZE = 48
-- [[const]]
local GRID_X_PADDING = 0
-- [[const]]
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
    love.graphics.rectangle("fill", nextXPos(xPos), nextYPos(yPos), TILE_SIZE, TILE_SIZE)
end

local function drawImage(imgPath, backgroundColorType, xPos, yPos)
    if imgPath == "" then
        return
    else
        local colorRGBA = colormodule.getColorRGBA(backgroundColorType)
        love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
        local img = love.graphics.newImage(imgPath)
        love.graphics.draw(img, nextXPos(xPos), nextYPos(yPos))
    end
end

local function drawText(text, fontSize, colorType, xPos, yPos)
    local font = love.graphics.newFont(fontSize)
    love.graphics.setFont(font)
    local colorRGBA = colormodule.getColorRGBA(colorType)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.print(text, nextXPos(xPos), nextYPos(yPos))
end

local function determineEntityColor(entity)
    if entity.type == entitymodule.Type.WALL
    then
        return colormodule.BLACK
    else
        return colormodule.BLUE
    end
end

local function drawBorders(colorType, xPos, yPos, width, height)
    local colorRGBA = colormodule.getColorRGBA(colorType)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.rectangle("line", nextXPos(xPos), nextYPos(yPos), width, height)
end

local function drawKeys()
    drawImage("assets/boss.png", colormodule.WHITE, 33, 2)
    drawText("Boss", 20, colormodule.WHITE, 34.5, 2.25)

    drawImage("assets/chest.png", colormodule.WHITE, 33, 3.5)
    drawText("Chest", 20, colormodule.WHITE, 34.5, 3.75)

    drawImage("assets/heart.png", colormodule.WHITE, 33, 5)
    drawText("Heart", 20, colormodule.WHITE, 34.5, 5.25)

    drawImage("assets/mini-boss.png", colormodule.WHITE, 33, 6.5)
    drawText("Minion", 20, colormodule.WHITE, 34.5, 6.75)

    drawImage("assets/pokeball.png", colormodule.WHITE, 33, 8)
    drawText("Player (You)", 20, colormodule.WHITE, 34.5, 8.25)

    drawImage("assets/scroll.png", colormodule.WHITE, 33, 9.5)
    drawText("Scroll", 20, colormodule.WHITE, 34.5, 9.75)
end

function draw.drawSidebar()
    drawBorders(colormodule.RED, 32, 1, 360 + TILE_SIZE, TILE_SIZE * roguemodule.COLUMN)
    drawKeys()

end

--- Draws the map.
-- @param map is a 2D array of entity (see entity_module.lua)
-- @return void
function draw.drawMap(map)
    drawBorders(colormodule.LIGHT_BLUE, 1, 1, TILE_SIZE * roguemodule.ROW, TILE_SIZE * roguemodule.COLUMN)
    for x = 1, #map do
        for y = 1, #map[x] do
            drawTile(x, y, determineEntityColor(map[x][y]))
            drawImage(map[x][y].imgSrc, colormodule.WHITE, x, y)
        end
    end
end

return draw
