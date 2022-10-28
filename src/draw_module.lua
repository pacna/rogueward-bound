local colormodule = require("color_module")
local roguemodule = require("rogue_module")
local entitymodule = require("entity_module")
local imgmodule = require("img_module")

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

local function drawPlayerStats()
    drawText("Player Stats", 28, colormodule.WHITE, 33, 13)
    drawText("HP: " .. roguemodule.map[roguemodule.playerPosition.x][roguemodule.playerPosition.y].health, 20,
        colormodule.WHITE
        , 33, 14.5)
    drawText("XP: " .. roguemodule.map[roguemodule.playerPosition.x][roguemodule.playerPosition.y].xp, 20,
        colormodule.WHITE, 33, 15.5)
    drawText("Atk: " .. roguemodule.map[roguemodule.playerPosition.x][roguemodule.playerPosition.y].atk, 20,
        colormodule.WHITE, 33, 16.5)
end

local function drawGameLog()
    drawText("Game log", 28, colormodule.WHITE, 33, 18)
    drawText("Blah", 20, colormodule.WHITE, 33, 19.5)
end

local function drawKeys()
    local imgXPosition = roguemodule.ROW + 3
    local textXPosition = roguemodule.ROW + 4.5

    local imgYInitPosition = 3
    local textYInitPosition = 3.25

    drawText("Key", 28, colormodule.WHITE, imgXPosition, 1.5)

    for key, value in pairs(imgmodule.imgSwitch) do
        drawImage(value, colormodule.WHITE, imgXPosition, imgYInitPosition)
        drawText(key, 20, colormodule.WHITE, textXPosition, textYInitPosition)

        imgYInitPosition = imgYInitPosition + 1.5
        textYInitPosition = textYInitPosition + 1.5
    end
end

function draw.drawSidebar()
    drawBorders(colormodule.RED, 32, 1, 360 + TILE_SIZE, TILE_SIZE * roguemodule.COLUMN)
    drawKeys()
    drawPlayerStats()
    drawGameLog()
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
