require("player")
local CharBody = {}
CharBody.__index = CharBody
function newCharBody(world, x, y, w, h)
    local a = {}
    a.body = love.physics.newBody(world, x, y, "dynamic")
    a.shape = love.physics.newRectangleShape(width,h)
    a.fixture = love.physics.newFixture(a.body, a.shape,1)
    return setmetatable(a, CharBody)
end

function CharBody:getX()
    return self.body:getX()
end
function CharBody:getY()
    return self.body:getY()
end 