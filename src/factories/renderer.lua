local gridcomponent = require('components.grid')
local sidebarcomponent = require('components.sidebar')

local renderer = {}


local renders = {
    [gridcomponent.ID] = gridcomponent.render,
    [sidebarcomponent.ID] = sidebarcomponent.render,
}


function renderer.renders()
    for _, render in pairs(renders) do
        render()
    end
end

return renderer
