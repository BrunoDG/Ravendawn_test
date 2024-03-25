/*
    Assume all method calls work fine. 
    Fix the memory leak issue in below method.
*/

/*
    Changing Item* and Player* pointers to std::unique_ptr solves the memory leak in this function, because
    in exception or early return of function, it prevents wrong memory allocation.
*/

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
    Player* player = g_game.getPlayerByName(recipient);
    std::unique_ptr<Player> playerPtr;
    if (!player)
    {
        playerPtr.reset(new Player(nullptr));
        if (!IOLoginData::loadPlayerByName(player, recipient)) {
            return;
        }
        player = playerPtr.get();
    }

    std::unique_ptr<Item> item(Item::CreateItem(itemId));
    if (!item) {
        return;
    }

    g_game.internalAddItem(player->getInbox(), item.get(), INDEX_WHEREEVER, FLAG_NOLIMIT);

    if (player->isOffline()) {
        IOLoginData::savePlayer(player);
    }
}