local server = {}
local player = require("modules.player")
local sock = require("modules.server.sock")

function server:Start()
    print("[SERVER] Server Started!")
    self.Server = sock.newServer("*", 21114)
    self.World = love.physics.newWorld(0, 1000, true)
    player:Init(self.World)

    self.Server:on("connect", function(data, client)
        print("[SERVER] Got a new client with index", client:getIndex())
        player:newPlayer(client)
    end)

    self.Server:on("disconnect", function(data, client)
        print("[SERVER] Player disconnected with an index of", client:getIndex())
        player:removePlayer(client:getIndex())
    end)
end

local timeSinceLastPing = 0

function server:Update(dt)
    if not self.Server or not self.World then return end
    self.Server:update()
    self.World:update(dt)

    timeSinceLastPing = timeSinceLastPing + dt
    if timeSinceLastPing >= 5 then 
        self.Server:sendToAll("ping")
        timeSinceLastPing = 0
    end
end

return server