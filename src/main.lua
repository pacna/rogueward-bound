local colormodule = require('color_module')

function love.load()
    love.window.setMode(1100, 900)
    love.window.setTitle('Love Rogue')
    local backgroundColor = colormodule.getLoveRGBA(35, 35, 35)
    love.graphics.setBackgroundColor(backgroundColor.red, backgroundColor.green, backgroundColor.blue)
end

function love.update(dt)
end

function love.draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.line(0, 0, 50, 0)
    love.graphics.line(1, 1, 51, 1)

    -- love.graphics.setColor(255, 0, 0)
    -- love.graphics.rectangle('line', 0, 0, 50.5, 50.5)
end
