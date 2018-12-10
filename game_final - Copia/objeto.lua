local Ball = {}
Ball.__index = Ball

function newBall(world, x ,y)
    local a = {}
    a.body = love.physics.newBody(world, x , y , "dynamic")--posição da bola no eixo x, y 
    a.shape = love.physics.newCircleShape(25)
    a.fixture = love.physics.newFixture(a.body, a.shape, 1)
    a.fixture:setRestitution(0.9)
    a.imagem = love.graphics.newImage("imagens/fireball.png")
    return setmetatable(a, Ball)
end

function Ball:update(dt)
    if love.keyboard.isDown("right") then
        self.body:applyForce(400,0)
    end
    if love.keyboard.isDown("left") then
        self.body:applyForce(-400,0)
    end
    if love.keyboard.isDown("space") then
        self.body:applyForce(0,-2000)
    end
end
function Ball:draw()
   -- love.graphics.circle("line", self.body:getX(), self.body:getY(), self.shape:getRadius())
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(self.imagem,self.body:getX()-25,self.body:getY()-50,0.3,0.3)
end