require("free_fall")
require("util")
local Balls = {}
Balls.__index = Balls


function newBalls(numBalls)
 local a = {}
    a.numBalls = numBalls
    a.initNumBalls = numBalls
    a.rBall = 60
    a.balls = nil
    
    return setmetatable(a, Balls)
end
function Balls:initBall(index,numBall)
    self.balls[index] = newFreeFall(0.1,0.0,math.random(0 + self.rBall,800 - self.rBall),0.0,600.0,0.001,self.rBall)
    self.balls[index].image = love.graphics.newImage("imagem/balao.png") 

end
function Balls:initAllBalls()
    self.balls ={}
    for index = 1, self.numBalls do
        self.initBall(self, index,math.random(1,5))
    end
end
function Balls:updateBalls()
    local lose = false
        
        for index = 1, self.numBalls do
            self.balls[index]:update()
            if (self.balls[index]:isEnding()) then
                lose = true
            end
        end
   
    return lose
end

function Balls:checkClickBalls(x,y)
    local points = 0
    for index = 1, self.numBalls do
        if (checkMousePosIn(x, y, self.balls[index]:getX(), self.balls[index]:getY(), self.rBall)==true) then
            self.initBall(self, index,math.random(1,5))
            points = points + 1
        end
    end
    return points 
end

function Balls:IncNumBalls()
    self.numBalls = self.numBalls +1
    self.initBall(self, self.numBalls,math.random(1,5))
end
function Balls:reinit()
    self.numBalls = self.initNumBalls
    self. initAllBalls(self)
end
function Balls:drawBalls()
    for index = 1, self.numBalls do
       love.graphics.draw(self.balls[index].image,self.balls[index]:getX(), self.balls[index]:getY())
    end
    love.graphics.setColor(255,255,255)
end