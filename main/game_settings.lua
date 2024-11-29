local GAME_SETTINGS = {}

GAME_SETTINGS.LEVELS_COUNT_CELLS = {
    {x = 2, y = 2},
    {x = 3, y = 3},
    {x = 4, y = 4},
    {x = 5, y = 5},
    {x = 6, y = 6},
    {x = 7, y = 7},
    {x = 8, y = 8}}

GAME_SETTINGS.MAX_COUNT_RIGHT_CELLS = {
    2, 5, 7, 10,
    10, 10, 10
}

GAME_SETTINGS.PREPARE_TIMES = {
    2, 3, 4, 5,
    6, 7, 8
}

---@param state integer
---@return table
function GAME_SETTINGS:get_settings(state)
    return {
        level_count_cells = self.LEVELS_COUNT_CELLS[state],
        max_count_right_cells = self.MAX_COUNT_RIGHT_CELLS[state],
        prepare_time = self.PREPARE_TIMES[state]
    }
end

return GAME_SETTINGS