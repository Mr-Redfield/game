require("personagem")
local lose = false
local nextLevel = 10
local points = 0
local balls = nil

function love.load()
    love.window.setTitle("Minha bola")
    math.randomseed(os.time())
    balls = newBalls(3,30)
    balls : initAllBalls()
    music = love.audio.newSource("sound/boss.mp3","stream")
    music:setLooping(true)
    love.audio.play(music)
    background = love.graphics.newImage("imagem/cenario.jpg")
end

function love.update()
    lose = balls:updateBalls()

end

function love.mousepressed(x, y, button, istouch)
    points = points + balls:checkClickBalls(x,y)
    if (points >= nextLevel) then
        balls:IncNumBalls()
        nextLevel = nextLevel + 10
    end
    if (lose==true) then
        balls:reinit()
        lose= false
        nextLevel = true
        points = 0
    end

end

function love.draw()
    love.graphics.draw(background)
    if(lose==false) then
        balls:drawBalls()
    else 
        love.graphics.print("perdeu vacilaum",250,250)
    end
    love.graphics.print("Pontos: ".. points, 50,50)
end
