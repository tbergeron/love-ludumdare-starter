Game = {}

local character_image
local character_grid
local character_animation

function Game.enter()
    -- sample character
    character_image = love.graphics.newImage(globals.getPath('sprites/p1_walk.png'))
    character_grid = anim8.newGrid(66, 92, character_image:getWidth(), character_image:getHeight())
    character_animation = anim8.newAnimation(character_grid('1-3', 1, '1-3', 2, '1-3', 3, '1-2', 4), 0.1)
end

function Game.update(dt)
    character_animation:update(dt)
end

function Game.draw()
    character_animation:draw(character_image, 400, 300)
    love.graphics.print("GAME STATE, SO COOL!", 400, 300)
end

function Game.keypressed(args)
    if args.key == "escape" then
        state.switch(Menu)
    end
end

function Game.leave()
    love.graphics.clear()
end