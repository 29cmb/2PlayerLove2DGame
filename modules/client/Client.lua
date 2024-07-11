local Client = {}
local sock = require("modules.server.sock")

function Client:Connect(ip, port)
    print("[CLIENT] Connecting the client!")
    self.client = sock.newClient(ip, port)

    local success, err = pcall(function() 
        self.client:connect()
    end)

    if success == true then 
        print("[CLIENT] Successfully connected!")
        self.client:on("ping", function(data)
            print("[CLIENT] Server pinged the client")
        end)
        -- do server stuff
    else
        print("[CLIENT] Error connecting to server: " .. err)
    end
end

function Client:Update(dt)
    if self.client then 
        self.client:update()
    end
end

return Client