(module config.mapping {autoload {nvim aniseed.nvim util config.util}})

;; --------------------
;; Key bindings (mappings)

;; generic mapping leaders configuration
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

;; better window movement
(nvim.set_keymap :n :<C-h> :<C-w>h {:noremap true})
(nvim.set_keymap :n :<C-j> :<C-w>j {:noremap true})
(nvim.set_keymap :n :<C-k> :<C-w>k {:noremap true})
(nvim.set_keymap :n :<C-l> :<C-w>l {:noremap true})

;clear highlighting on enter in normal mode
(nvim.set_keymap :n :<CR> ":noh<CR><CR>" {:noremap true})

;duplicate currents panel in a new tab
(nvim.set_keymap :n :<C-w>T ":tab split<CR>" {:noremap true :silent true})

;; Insert mode: fd as Escape short cut
(nvim.set_keymap :i :fd :<ESC> {:noremap true})

;; leader normal mapping
;; terminal
(util.lnnoremap "." :ToggleTerm)

;; killring / registers
;; clipboard history
(util.lnnoremap :ch "Telescope neoclip")

;; Tabs
(util.lnnoremap :tt "Telescope tele_tabby list")

;; Visual tab switch
(util.lnnoremap :td :tabclose)
(util.lnnoremap :tn :tabnext)
(util.lnnoremap :tp :tabprevious)
(util.lnnoremap :to :tabonly)

;; Only show active tab
(util.lnnoremap :tm "tab sp")

;; Creates a new split as a tab ??

;;;; Windows
;; Move cursor between windows
(util.lnnoremap :wh "wincmd h")
(util.lnnoremap :wj "wincmd j")
(util.lnnoremap :wk "wincmd k")
(util.lnnoremap :wl "wincmd l")
;; Maximise window (or is this tab?)
(util.lnnoremap :wm :only)
(util.lnnoremap :ws :split)

;; Horizontal window split
(util.lnnoremap :wv :vsplit)

;; Vertical window split

;; Buffers
;; Toggle between current and last active buffer
(util.lnnoremap :<tab> "b#")
(util.lnnoremap :ba :ball)
;; (util.lnnoremap :bb "Telescope buffers")
(util.lnnoremap :bd :bdelete)
;; (util.lnnoremap :bn "bnext")
;; (util.lnnoremap :bp "bprevious")
;;
;; Projects and files
;; Find files in a project
(util.lnnoremap :f/ "Telescope live_grep")
(util.lnnoremap :fb "Telescope file_browser")
(util.lnnoremap :ff "Telescope find_files")

;; Added for Convienience
(util.lnnoremap :fp "Telescope find_files")
(util.lnnoremap :fs :write)
;; (util.lnnoremap :fc "saveas")  ;; requires an argument before carrage return
(util.lnnoremap :fe :NvimTreeToggle)

(util.lnnoremap :pp "Telescope project")
(util.lnnoremap :pt :TodoTelescope)

;; Help and documentation
(util.lnnoremap :hh "Telescope help_tags")
(util.lnnoremap :jh "Telescope heading")

;; (util.lnnoremap :dtb "Telescope terraform_doc")

;; Colors and themes
(util.lnnoremap :cs "Telescope colorscheme")

;; Package Manager
;; list packages
(util.lnnoremap :Pl "Telescope packer")
(util.lnnoremap :Pi :PackerInstall)
(util.lnnoremap :Ps :PackerSync)
(util.lnnoremap :Pu :PackerUpdate)

;; Treesitter parsers update
(util.lnnoremap :Ptu :TSUpdate)
;; Treesitter parsers install status
(util.lnnoremap :Pti :TSInstallInfo)

;; Quit
(util.lnnoremap :qa :quitall)
(util.lnnoremap :qq :quit)
(util.lnnoremap :qQ :quit!)

;; Git Version control
(util.lnnoremap :gd :DiffviewOpen)
(util.lnnoremap :gs :Neogit)

;; ;; GitHub - requires `gh auth login`
;;
;; (util.lnnoremap :gga "Octo actions")
;; (util.lnnoremap :gggl "Octo gist list")
;;
;; (util.lnnoremap :ggib "Octo issue browser")
;; (util.lnnoremap :ggic "Octo issue create")
;; (util.lnnoremap :ggil "Octo issue list")
;; (util.lnnoremap :ggis "Octo issue search")
;; (util.lnnoremap :ggiu "Octo issue url")
;;
;; (util.lnnoremap :ggpb "Octo pr browser")
;; (util.lnnoremap :ggpc "Octo pr create")
;; (util.lnnoremap :ggpl "Octo pr list")
;; (util.lnnoremap :ggps "Octo pr search")
;; (util.lnnoremap :ggpu "Octo pr url")
;;
;; (util.lnnoremap :ggrb "Octo repo browse")
;; (util.lnnoremap :ggrf "Octo repo fork")
;; (util.lnnoremap :ggrl "Octo repo list")
;; (util.lnnoremap :ggru "Octo repo url")
;;
;; Clojure Reader macro
(util.lnnoremap :cc "(i#_<ESC>")
(util.lnnoremap :cu "<Cmd>let s=@/<CR>l?\\v(#_)+<CR>dgn:let @/=s<CR>")

;; escape from terminal normal mode
(nvim.set_keymap :t :<esc><esc> "<c-\\><c-n>" {:noremap true})

;; clear symbol highlighting on enter in normal mode
(util.nnoremap :<CR> :noh<CR><CR>)
