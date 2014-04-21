Game = {}

local background_image
local character

-- called when switching to that state
function Game.enter()
    -- background
    background_image = love.graphics.newImage(globals.getPath('sprites/background.png'))
    
    -- creating new character
    character = Character:new()
end

function Game.update(dt)
    -- updating character
    character:update(dt)
end

function Game.draw()
    -- drawing background image
    love.graphics.draw(background_image, 0, 0)
    
    -- drawing character
    character:draw()
end

function Game.keypressed(args)
    -- pressing escape switches to the menu state
    if args.key == "escape" then
        state.switch(Menu)
    end    
end

-- called when leaving this state
function Game.leave()
    -- clearing the screen before switching
    love.graphics.clear()
end
