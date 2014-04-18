-- main game components
require("state_manager")

-- states
require("Menu")
require("Game")

-- 3rd parties
lovebird = require("libs.lovebird.lovebird")

-- game starts
function love.load()
    -- creating game instance
    Instance = {}

    -- switching to menu state immediately
    state.switch(Menu)
end

function love.update()
    lovebird.update()
end

-- function love.draw()
-- end

-- function love.keypressed(key, code)
-- end

-- function love.keyreleased(key, code)
-- end

-- function love.mousepressed(x, y, button)
-- end

-- function love.mousereleased(x, y, button)
-- end