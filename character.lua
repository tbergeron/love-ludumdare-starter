local class = require 'libs.middleclass.middleclass'

local character_image
local character_grid
local character_animation

-- Character class (so we can instantiate many of them)
Character = class('Character')

function Character:initialize()
    -- coords and speed
    self.x = 270
    self.y = 200
    self.speed = 300
  
    -- sample anim8 animation
    character_image = love.graphics.newImage(globals.getPath('sprites/glitch_surprise.png'))
    character_grid = anim8.newGrid(72, 123, character_image:getWidth(), character_image:getHeight())
    character_animation = anim8.newAnimation(character_grid('1-21', 1), 0.1)
end

function Character:update(dt)
    -- moving character
    if love.keyboard.isDown("left") then
      self.x = self.x - (self.speed * dt)
    elseif love.keyboard.isDown("right") then
      self.x = self.x + (self.speed * dt)
    end
  
    character_animation:update(dt)
end

function Character:draw()
    character_animation:draw(character_image, self.x, self.y)
end