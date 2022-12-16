require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
        { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
        { key = "C", action = "cd" },
--        { key = "gtf", action = "telescope_find_files", action_cb = telescope_find_files },
--        { key = "gtg", action = "telescope_live_grep", action_cb = telescope_live_grep },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- function start_telescope(telescope_mode)
--   local node = require("nvim-tree.lib").get_node_at_cursor()
--   local abspath = node.link_to or node.absolute_path
--   local is_folder = node.open ~= nil
--   local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
--   require("telescope.builtin")[telescope_mode] {
--     cwd = basedir,
--   }
-- 
--   function telescope_find_files(_)
--     start_telescope "find_files"
--   end
-- 
--   function telescope_live_grep(_)
--     start_telescope "live_grep"
--   end


