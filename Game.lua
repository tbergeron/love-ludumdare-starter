Game = {}

function Game.enter()
end

function Game.update(dt)
end

function Game.draw()
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