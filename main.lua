-- main game components
require("globals")
require("state_manager")
require("character")

-- states
require("Menu")
require("Game")

-- 3rd parties

package.path = "libs/?/?.lua;libs/?.lua;" .. package.path
lovebird = require("lovebird")
anim8 = require("anim8")
lurker = require("lurker")

-- game starts
function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    
    -- creating game instance
    Instance = {}

    -- switching to menu state immediately
    state.switch(Menu)
end

function love.update(dt)
    lurker.update()
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
