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