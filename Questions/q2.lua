-- Fix or improve the implementation of the method below

function printSmallGuildNames(memberCount)
-- this method is supposed to print names of all guilds that have less than memberCount max members
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    if resultId then
        while result.next(resultId) do
            local guildName = result.getString(resultId, "name")
            print(guildName)
        end
    end
    result.free(resultId)
end