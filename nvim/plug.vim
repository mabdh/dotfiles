let g:mapleader = "\<Space>"
let g:maplocalleader = ','

if has("nvim")
	let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'liuchengxu/vim-which-key'

" Appearance
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()

" liuchengxu/vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {}

" nvim-telescope/telescope
let g:which_key_map.f = { 'name' : '+file' }
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
let g:which_key_map.f.f = { 'name' : 'find-files' }
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
let g:which_key_map.f.g = { 'name' : 'live-grep' }
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
let g:which_key_map.f.b = { 'name' : 'find-buffers' }
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
let g:which_key_map.f.h = { 'name' : 'open-help-tags' }

" folke/tokyonight.nvim
lua << EOF
require('lualine').setup{
	options = {
		theme = 'tokyonight'
	}
}
EOF

" lukas-reineke/indent-blankline.nvim
lua << EOF
require("indent_blankline").setup {
	char = "|",
	buftype_exclude = {"terminal"}
}
EOF
