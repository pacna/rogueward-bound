local gamewrappermodule = require("components.gamewrapper")

function love.load()
    gamewrappermodule.init()
end

function love.update(dt)
end

function love.keypressed(key)
    gamewrappermodule.move(key)
end

function love.draw()
    gamewrappermodule.draw()
end
