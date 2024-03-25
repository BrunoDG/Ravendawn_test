-- Fix or improve the name and the implementation of the method below

-- This method is for the player to leave the party, so:

--function do_sth_with_PlayerParty(playerId, membername)
function leavePlayerParty(playerId, membername)
    local player = Player(playerId)
    local party = player:getParty()

    party:removeMember(Player(membername))
    -- If player is inside hte party, remove it without the need to use that for loop.
end