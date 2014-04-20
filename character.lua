local class = require 'libs.middleclass.middleclass'

-- sample anim8 animation
local character_idle_image
local character_idle_grid
local character_idle

local character_base_image
local character_move_grid
local character_move

-- Character class (so we can instantiate many of them)
Character = class('Character')

function Character:initialize()
    -- coords and speed
    self.x = 270
    self.y = 200
    self.speed = 300
    
    -- idle animation
    character_idle_image = love.graphics.newImage(globals.getPath('sprites/glitch_surprise.png'))
    character_idle_grid = anim8.newGrid(72, 123, character_idle_image:getWidth(), character_idle_image:getHeight())
    character_idle = anim8.newAnimation(character_idle_grid('1-21', 1), 0.1)
    
    -- move right & left animations
    character_base_image = love.graphics.newImage(globals.getPath('sprites/glitch_base.png'))
    character_move_grid = anim8.newGrid(130, 123,character_base_image:getWidth(), character_base_image:getHeight())
    character_move = anim8.newAnimation(character_move_grid('1-12', 1), 0.1)

    character_base_reversed_image = love.graphics.newImage(globals.getPath('sprites/glitch_base_reversed.png'))
    character_move_left_grid = anim8.newGrid(130, 123, character_base_reversed_image:getWidth(), character_base_reversed_image:getHeight())
    character_move_left = anim8.newAnimation(character_move_left_grid('4-15', 1), 0.1)

    self:switchAnimation(character_idle, character_idle_image)
end

function Character:update(dt)
    -- moving character
    if love.keyboard.isDown("left") then
      -- switching to movement animation
      self:switchAnimation(character_move_left, character_base_reversed_image)
      -- moving sprite
      self.x = self.x - (self.speed * dt)
    elseif love.keyboard.isDown("right") then
      -- switching to movement animation
      self:switchAnimation(character_move, character_base_image)
      -- moving sprite
      self.x = self.x + (self.speed * dt)
    else
      -- switching back to idle animation
      self:switchAnimation(character_idle, character_idle_image)
    end
  
    self.currentAnimation:update(dt)
end

function Character:draw()
    self.currentAnimation:draw(self.currentImage, self.x, self.y)
end

-- switching current animation/image
function Character:switchAnimation(animation, image)
  self.currentAnimation = animation
  self.currentImage = image
end