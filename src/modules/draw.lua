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

function draw.getTileSize()
    return TILE_SIZE
end

function draw.drawText(colorRGBA, text, fontSize, xPos, yPos)
    local font = love.graphics.newFont(fontSize)
    love.graphics.setFont(font)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.print(text, nextXPos(xPos), nextYPos(yPos))
end

function draw.drawImage(colorRGBA, imgPath, xPos, yPos)
    if imgPath == "" then
        return
    else
        love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
        local img = love.graphics.newImage(imgPath)
        love.graphics.draw(img, nextXPos(xPos), nextYPos(yPos))
    end
end

function draw.drawTile(colorRGBA, xPos, yPos)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.rectangle("fill", nextXPos(xPos), nextYPos(yPos), TILE_SIZE, TILE_SIZE)
end

function draw.drawBorders(colorRGBA, xPos, yPos, width, height)
    love.graphics.setColor(colorRGBA.red, colorRGBA.green, colorRGBA.blue)
    love.graphics.rectangle("line", nextXPos(xPos), nextYPos(yPos), width, height)
end

return draw
