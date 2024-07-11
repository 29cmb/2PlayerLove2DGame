local Server = require("modules.server.Server")
local Sprites = require("modules.sprite")
function love.load()
    Sprites.LoadSprites()
end

function love.update(dt)
    Server:update(dt)
end

function love.draw()

end