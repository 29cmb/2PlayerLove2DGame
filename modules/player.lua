local player = {}

player.clients = {}

local physicsInstance = require("modules.yan.instance.physics_instance")

function player:Init(world)
    self.world = world
end

function player:newPlayer(client)
    self.clients[client:getIndex()] = physicsInstance:New(
        nil,
        self.world,
        "dynamic",
        "rectangle",
        {X = 50, Y = 50},
        0,
        1
    )

    local player = self.clients[client:getIndex()]
    player.direction = 1
    player.onGround = true
    player.speed = 5000
    player.maxSpeed = 400
    player.jumpHeight = 1500

    return player
end

function player:removePlayer(index)
    self.clients[index] = nil
end

return player