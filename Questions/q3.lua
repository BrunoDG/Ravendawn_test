-- Fix or improve the name and the implementation of the method below

-- This method is for the player to leave the party, so:

--function do_sth_with_PlayerParty(playerId, membername)
function leavePlayerParty(playerId, membername)
    local player = Player(playerId)
    local party = player:getParty()

    for k,v in pairs(party:getMembers()) do 
        if v == Player(membername) then 
            --party:removeMember(Player(membername))
            party:removeMember(v) -- instead of removing the PlayerName, remove the key from the pair itself.
        end
    end
end