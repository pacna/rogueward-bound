local gamewrappermodule = require('gamewrapper_module')

function love.load()
    gamewrappermodule.init()
end

function love.update(dt)
end

function love.draw()
    gamewrappermodule.draw()
end
