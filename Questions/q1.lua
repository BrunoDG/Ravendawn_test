-- Fix or improve the implementation of the below methods

local function releaseStorage(player)
    -- Since we're dealing with tables, I think that this should be one of player's functions.
    player:setStorageValue(1000, -1)
end

function OnLogout(player)
    if player:getStorageValue(1000) == 1 then
        AddEvent(releaseStorage, 1000, player)
    end
    return true
end