-- core
local gamewrappercore = require("core.gamewrapper")

function love.load()
    gamewrappercore.init()
end

function love.update(dt)
    gamewrappercore.update()
end

function love.keypressed(key)
    gamewrappercore.move(key)
end

function love.draw()
    gamewrappercore.draw()
end
