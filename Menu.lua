Menu = {}

function Menu.enter()
end

function Menu.update(dt)
end

function Menu.draw()
    love.graphics.print("Menu, press ESC to jump to game state", 400, 300)
end

function Menu.keypressed(args)
    if args.key == "escape" then
        state.switch(Game)
    end
end

function Menu.leave()
    love.graphics.clear()
end