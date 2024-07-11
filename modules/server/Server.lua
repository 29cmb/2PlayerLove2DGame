local server = {}
local player = require("modules.player")
local sock = require("modules.server.sock")

function server:Start()
    self.Server = sock.newServer("*", 3415)
    self.World = love.physics.newWorld(0, 1000, true)

    self.Server:on("connect", function(data, client)
        player:newPlayer(client)
    end)

    self.Server:on("disconnect", function(data, client)
        player:removePlayer(client:getIndex())
    end)
end

function server:Update(dt)
    if not self.Server or not self.World then return end
    self.World:update(dt)
end

return server