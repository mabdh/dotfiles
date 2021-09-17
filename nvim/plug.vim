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
" Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
" Appearance
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'lukas-reineke/indent-blankline.nvim'

" LSP & Lang
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
ensure_installed = { "python", "go", "java"},     
  highlight = {
    enable = true              
  },
}
EOF

"" liuchengxu/vim-which-key
"nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
"nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
"let g:which_key_map = {}

" nvim-telescope/telescope
"let g:which_key_map.f = { 'name' : '+file' }
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"let g:which_key_map.f.f = { 'name' : 'find-files' }
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
"let g:which_key_map.f.g = { 'name' : 'live-grep' }
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
"let g:which_key_map.f.b = { 'name' : 'find-buffers' }
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
"let g:which_key_map.f.h = { 'name' : 'open-help-tags' }

" folke/tokyonight.nvim
lua << EOF
vim.g.tokyonight_style = "night"
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

" neovim/nvim-lspconfig
lua << EOF
require('lspconfig').pyright.setup{on_attach=require'completion'.on_attach}
require('lspconfig').gopls.setup{on_attach=require'completion'.on_attach}
EOF

" glepnir/lsp-saga
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent>gr :Lspsaga rename<CR>
nnoremap <silent> gd :Lspsaga preview_definition<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
" only show diagnostic if cursor is over the area
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
" float terminal
nnoremap <silent> <A-d> :Lspsaga open_floaterm<CR>
tnoremap <silent> <A-d> <C-\><C-n>:Lspsaga close_floaterm<CR>

" nvim-lua/completion-nvim
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
let g:completion_enable_snippet = 'vim-vsnip'

