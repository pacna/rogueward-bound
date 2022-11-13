local gridcomponent = require('components.grid')
local sidebarcomponent = require('components.sidebar')
local playercomponent = require('components.player')

local renderer = {}


local parentRenders = {
    [gridcomponent.ID] = gridcomponent.render,
    [sidebarcomponent.ID] = sidebarcomponent.render,
}

local childRenders = {
    [playercomponent.ID] = playercomponent.render,
}


function renderer.renders()
    for _, render in pairs(parentRenders) do
        render()
    end

    for _, render in pairs(childRenders) do
        render()
    end
end

function renderer.renderChild(id)
    childRenders[id]()
end

return renderer
