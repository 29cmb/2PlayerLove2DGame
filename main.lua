local Server = require("modules.server.Server")
local Sprites = require("modules.sprite")
function love.load()
    Sprites:LoadSprites()
end

function love.update(dt)
    Server:Update(dt)
end

function love.draw()

end

function love.keypressed(key) 
    if key == "v" and not Server.Server then
        print("Server Started!")
        Server:Start()
    end
end