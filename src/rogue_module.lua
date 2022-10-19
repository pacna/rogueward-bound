local rogue = {}
rogue.map = {}

rogue.entityType = {
    WALL = 1,
    FLOOR = 2,
    BOSS = 3,
    HEALTH = 4,
    WEAPON = 5,
    PLAYER = 6
}
--[[const]]
rogue.ROW = 30
--[[const]]
rogue.COLUMN = 25


function rogue.generateMap()
    math.randomseed(os.time())
    for i = 1, rogue.ROW do
        rogue.map[i] = {}
        for j = 1, rogue.COLUMN do
            rogue.map[i][j] = math.random(1, 5)
        end
    end
end

return rogue
