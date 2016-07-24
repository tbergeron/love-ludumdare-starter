Menu = {}

function Menu.enter()
end

function Menu.update(dt)
end

function Menu.draw()
    local text = "Menu, press escape to jump to game state."

    -- get font, text width, to center text.
    local font = love.graphics.getFont()
    local textWidth = font:getWidth(text)
    local x = (love.graphics.getWidth() / 2) - (textWidth / 2)

    love.graphics.print("Menu, press ESC to jump to game state", x, 290)
end

function Menu.keypressed(args)
    if args.key == "escape" then
        state.switch(Game)
    end
end

function Menu.leave()
    love.graphics.clear()
end
