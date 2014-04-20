Game = {}

local background_image
local character_image
local character_grid
local character_animation

function Game.enter()
    -- background
    background_image = love.graphics.newImage(globals.getPath('sprites/background.png'))
    
    -- sample anim8 animation
    character_image = love.graphics.newImage(globals.getPath('sprites/glitch_surprise.png'))
    character_grid = anim8.newGrid(72, 123, character_image:getWidth(), character_image:getHeight())
    character_animation = anim8.newAnimation(character_grid('1-21', 1), 0.1)
end

function Game.update(dt)
    character_animation:update(dt)
end

  function Game.draw()
    love.graphics.draw(background_image, 0, 0)
    character_animation:draw(character_image, 270, 200)
end

function Game.keypressed(args)
    if args.key == "escape" then
        state.switch(Menu)
    end
end

function Game.leave()
    love.graphics.clear()
end