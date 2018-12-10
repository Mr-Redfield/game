require ("objeto")
require ("ground")
local larguradatela = love.graphics.getWidth()
local alturadatela = love.graphics.getHeight()
    --local char = newChar(4,99,97,"imagens/player_run1.png","imagens/player_run.png", love.graphics.getWidth(), love.graphics.getHeight() )
function love.load()
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 9.81 * 64, true)--dimensões do shap, (9.81*64) é a gravidade
    ball1 = newBall(world,380,1)
   -- ball2 = newBall(world,500,1)
    ground = newGround(world, 800/2, 600-50/2, 800, 50)
    ground2 = newGround(world,0 ,600/2 , 50, 600)
    --ground3 = newGround(world,800 ,600/2 , 50, 600)

    player1 = {}
    player1 = love.physics.newBody(world, 800/2, 600-50/2, "dynamic")
    player1 = love.physics.newRectangleShape(800/2,600-50/2)
    player1 = love.physics.newFixture(a.body, a.shape,1)
    a.fixture:setRestitution(0.9)

end

--[[function love.keypressed(key, scancode, isrepeat)
    char:keypressed(key, scancode, isrepeat)
end
function love.keypressed(key)
    char:keypressed(key)
end]]

local pplayer1 = 0
local pplayer2 = 0
function love.update(dt)
    world:update(dt)
    --char:update(dt)
    ball1:update()
    if ball1.newBall > larguradatela then
        pplayer1 = pplayer1 + 1
    end 
    --player:update()
end

function love.draw()
    --char:draw()
    ground:draw()
    ground2:draw()
    ground3:draw()
    ball1:draw()
   -- player.draw()
   -- ball2:draw()
end