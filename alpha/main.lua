bump = require "bump"

--angulo	= 0
tam=1/2
origem = 56

fisica = {}--tabela fisica
player = {
	x = 100,
	y = 100,
	speed = 100
} --cria o corpo "player"

pedra = {
	x = 400,
	y = 400,
	w = 50,
	h = 50
}--Cria o corpo pedra

background = {
	x = 0,
	y = 0
}--Define o background da imagem.

function love.load()
	fisica.world = bump.newWorld(32)
	background.imagem = love.graphics.newImage("art/background.jpeg")--coloca o elmento "imagem" na tabela "background"
	player.imagem = love.graphics.newImage("art/personagem.png")--coloca o elemento "imagem" na tabela "player"
	-- getWidth() retorna a largura da imagem
	player.width = player.imagem:getWidth()--encontra a largura da imagem
	-- getHeight() retorna a altura da mm
	player.height = player.imagem:getHeight()--encontra a altura da imagem

	fisica.world:add(player, player.x, player.y, player.width, player.height)--adiciona os parametros para a função retornada pelo Bump
	fisica.world:add(pedra, pedra.x, pedra.y, pedra.w, pedra.y)--A mesma coisa da linha anterior, mas para outro objeto
	
	love.mouse.setVisible(false)
end

function love.update(dt)	
-- 	if love.keyboard.isDown("left") then
-- 		posX = posX - 200 * dt
-- 		--angulo = angulo - dt * 1.5
-- 	end
-- 	if love.keyboard.isDown("right") then
-- 		posX = posX + 200 * dt
-- 		--angulo = angulo + dt * 1.5
-- 	end
-- 	if love.keyboard.isDown("up") then
-- 		posY = posY - 200 * dt
-- 		--angulo = angulo + dt * 1.5
-- 	end
-- 	if love.keyboard.isDown("down") then
-- 		posY = posY + 200 * dt
-- 		--angulo = angulo - dt * 1.5
-- 	end

	if (love.keyboard.isDown("up")) then
		player.x, player.y = fisica.world:move(player, player.x, player.y - player.speed * dt)--chama a função move
	elseif (love.keyboard.isDown("down")) then
		player.x, player.y = fisica.world:move(player, player.x, player.y + player.speed * dt)
	elseif (love.keyboard.isDown("left")) then
		player.x, player.y = fisica.world:move(player, player.x - player.speed * dt, player.y)
	elseif (love.keyboard.isDown("right")) then
		background.x = background.x - 100 * dt
		if (background.x < -background.imagem:getWidth()) then
			background.x = 0
		end
		player.x, player.y = fisica.world:move(player, player.x + player.speed * dt, player.y)
	end
end

function love.draw()
	love.graphics.draw(background.imagem, background.x, background.y)
	love.graphics.draw(background.imagem, background.x + background.imagem:getWidth(), background.y)
	love.graphics.draw(player.imagem, player.x, player.y)
	love.graphics.rectangle("fill", pedra.x, pedra.y, pedra.w, pedra.h)	
end