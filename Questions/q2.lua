function printSmallGuildNames(memberCount)
    
    local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
    local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
    
    if resultId then
        while result.next(resultId) do
            local guildName = result.getString(resultId, "name")
            print(guildName)
        end
        result.free(resultId)
    end
end