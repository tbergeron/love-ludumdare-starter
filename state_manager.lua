-- State Manager
state = {}
currentState = {}

-- Switching between states
-- .enter and .leave are called when switching
function state.switch(newState)
    if currentState then
        state.call('leave')
    end
    currentState = newState
    state.call('enter')
end

-- Call a function from the current State
function state.call(functionName, args)
    if currentState then
        -- if the function exists in state
        if currentState[functionName] then
            currentState[functionName](args)
        end
    end
end

function state.callFunctionFromState(functionName, state, args)
    if currentState then
        -- if the function exists in state
        if state[functionName] then
            return state[functionName](args)
        end
    end
end

function love.update(dt)
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