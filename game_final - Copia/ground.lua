local Ground = {}
Ground.__index = Ground

function newGround(world, xBody, yBody, width, height)
    local a = {}
    a.a = {}
    a.body = love.physics.newBody(world, xBody , yBody, "static") 
    a.shape = love.physics.newRectangleShape(width, height) 
    a.fixture = love.physics.newFixture(a.body, a.shape)
    --a.imagem = love.graphics.newImage("imagens/cenario.jpg")
    return setmetatable(a, Ground)
end

function Ground:draw()
    love.graphics.setColor(0.28, 0.63, 0.05) 
    love.graphics.polygon("fill", self.body:getWorldPoints(self.shape:getPoints()))
   -- love.graphics.draw(self.imagem,self.body:getWorldPoints(self.shape:getPoints()))
   love.graphics.setColor(255, 255, 255)
end
