local Server = require("modules.server.Server")
local Client = require("modules.client.Client")
local Sprites = require("modules.sprite")
function love.load()
    Sprites:LoadSprites()
end

function love.update(dt)
    Server:Update(dt)
    Client:Update(dt)
end

function love.draw()

end

function love.keypressed(key) 
    if key == "v" and not Server.Server then
        Server:Start()
    end

    if key == "e" and not Client.client then 
        Client:Connect("localhost", 21114)
    end
end