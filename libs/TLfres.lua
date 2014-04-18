-- TLfres v1.03, the world's easiest way to give a game resolution-independence
-- by Taehl (SelfMadeSpirit@gmail.com)

TLfres = {} -- namespace
local lg, trans, scale, color, rect = love.graphics, love.graphics.translate, love.graphics.scale, love.graphics.setColor, love.graphics.rectangle

-- Sets up TLfres and sets the screen mode. Default parameters should work fine in most cases.
function TLfres.setScreen(m, extent, centered, stretch)
    m,extent = m or {}, extent or 800
    m.w,m.h,m.aa = m.w or 800, m.h or 600, m.aa or 0
    local v = love.mouse.isVisible()    -- Fixes Love forgetting if mouse is visible upon changing res
    lg.setMode(m.w,m.h, m.full, m.vsync, m.aa)
    love.mouse.setVisible(v)
    
    TLfres.w, TLfres.h = m.w>0 and m.w or lg.getWidth(), m.h>0 and m.h or lg.getHeight()
    TLfres.c, TLfres.e = centered, extent/2
    TLfres.ws,TLfres.hs = TLfres.w/extent, TLfres.h/extent
    if centered then TLfres.wt,TLfres.ht = TLfres.w/2, TLfres.w/2-(TLfres.w-TLfres.h)/2
    else TLfres.wt,TLfres.ht = 0,0
    end
    TLfres.stretch = stretch
end

-- Transforms screen geometry. Call this at the beginning of love.draw().
function TLfres.transform()
    trans(TLfres.wt, TLfres.ht)
    scale(TLfres.ws, TLfres.stretch and TLfres.hs or TLfres.ws)
end

-- Draws rectangles at the top and bottom of the screen to ensure proper aspect ratio. Call this at the end of love.draw() if you're not using stretch mode.
function TLfres.letterbox(w,h, c)
    w,h,c = w or 4, h or 3, c or {0,0,0, 255}
    color(c)
    
    local tall,de = TLfres.e/w*h, TLfres.e*2
    if TLfres.c then
        rect("fill", -TLfres.e,-TLfres.e, de,TLfres.e-tall)
        rect("fill", -TLfres.e,TLfres.e,  de,tall-TLfres.e)
    else
        local o = (TLfres.ws - TLfres.hs) / (TLfres.ws) * (TLfres.e-1)
        rect("fill", 0,-o,   de,TLfres.e-tall)
        rect("fill", 0,de-o, de,tall-TLfres.e)
    end
end