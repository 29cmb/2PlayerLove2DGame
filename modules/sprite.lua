local sprite = {
    
}

function sprite:LoadSprites()
    for name,spr in pairs(self) do 
        if type(spr) == "string" then 
            self[name] = love.graphics.newImage(spr)
        end
    end
end

return sprite