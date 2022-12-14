local M = {}

M.join_paths = function(...)
    local result = table.concat({ ... }, path_sep)
    return result
end


return M