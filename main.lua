-- main game components
require("globals")
require("state_manager")

-- states
require("Menu")
require("Game")

-- 3rd parties
lovebird = require("libs.lovebird.lovebird")
anim8 = require("libs.anim8.anim8")

-- game starts
function love.load()
    -- creating game instance
    Instance = {}

    -- switching to menu state immediately
    state.switch(Menu)
end

function love.update(dt)
    lovebird.update()
    
    if currentState then
        state.call('update', dt)
    end
end

function love.draw()
    if currentState then
        state.call('draw')
    end
end

function love.keypressed(key, code)
    if currentState then
        state.call('keypressed', { key = key, code = code })
    end
end

function love.keyreleased(key, code)
    if currentState then
        state.call('keyreleased', { key = key, code = code })
    end
end

function love.mousepressed(x, y, button)
    if currentState then
        state.call('mousepressed', { x = x, y = y, button = button })
    end
end

function love.mousereleased(x, y, button)
    if currentState then
        state.call('mousereleased', { x = x, y = y, button = button })
    end
end