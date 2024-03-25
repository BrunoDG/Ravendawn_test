-- Fix or improve the implementation of the below methods

local STORAGE_VALUE = 1000

local function releaseStorage(player)
    local RESET_VALUE = -1
    
    player:setStorageValue(STORAGE_VALUE, RESET_VALUE)
end

function OnLogout(player)
    if player:getStorageValue(STORAGE_VALUE) == 1 then
        AddEvent(releaseStorage, STORAGE_VALUE, player)
    end
    return true
end