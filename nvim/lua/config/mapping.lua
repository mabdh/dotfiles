local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/mapping.fnl"
local _2amodule_name_2a = "config.mapping"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local nvim, util = autoload("aniseed.nvim"), autoload("config.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
nvim.set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
nvim.set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
nvim.set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
nvim.set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})
nvim.set_keymap("n", "<CR>", ":noh<CR><CR>", {noremap = true})
nvim.set_keymap("n", "<C-w>T", ":tab split<CR>", {noremap = true, silent = true})
nvim.set_keymap("i", "fd", "<ESC>", {noremap = true})
util.lnnoremap(".", "ToggleTerm")
util.lnnoremap("ch", "Telescope neoclip")
util.lnnoremap("tt", "Telescope tele_tabby list")
util.lnnoremap("td", "tabclose")
util.lnnoremap("tn", "tabnext")
util.lnnoremap("tp", "tabprevious")
util.lnnoremap("to", "tabonly")
util.lnnoremap("tm", "tab sp")
util.lnnoremap("wh", "wincmd h")
util.lnnoremap("wj", "wincmd j")
util.lnnoremap("wk", "wincmd k")
util.lnnoremap("wl", "wincmd l")
util.lnnoremap("wm", "only")
util.lnnoremap("ws", "split")
util.lnnoremap("wv", "vsplit")
util.lnnoremap("<tab>", "b#")
util.lnnoremap("ba", "ball")
util.lnnoremap("bd", "bdelete")
util.lnnoremap("f/", "Telescope live_grep")
util.lnnoremap("fb", "Telescope file_browser")
util.lnnoremap("ff", "Telescope find_files")
util.lnnoremap("fp", "Telescope find_files")
util.lnnoremap("fs", "write")
util.lnnoremap("fe", "NvimTreeToggle")
util.lnnoremap("pp", "Telescope project")
util.lnnoremap("pt", "TodoTelescope")
util.lnnoremap("hh", "Telescope help_tags")
util.lnnoremap("jh", "Telescope heading")
util.lnnoremap("cs", "Telescope colorscheme")
util.lnnoremap("Pl", "Telescope packer")
util.lnnoremap("Pi", "PackerInstall")
util.lnnoremap("Ps", "PackerSync")
util.lnnoremap("Pu", "PackerUpdate")
util.lnnoremap("Ptu", "TSUpdate")
util.lnnoremap("Pti", "TSInstallInfo")
util.lnnoremap("qa", "quitall")
util.lnnoremap("qq", "quit")
util.lnnoremap("qQ", "quit!")
util.lnnoremap("gd", "DiffviewOpen")
util.lnnoremap("gs", "Neogit")
util.lnnoremap("cc", "(i#_<ESC>")
util.lnnoremap("cu", "<Cmd>let s=@/<CR>l?\\v(#_)+<CR>dgn:let @/=s<CR>")
nvim.set_keymap("t", "<esc><esc>", "<c-\\><c-n>", {noremap = true})
util.nnoremap("<CR>", "noh<CR><CR>")
return _2amodule_2a