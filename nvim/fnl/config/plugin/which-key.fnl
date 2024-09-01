(module config.plugin.which-key {autoload {which-key which-key}})

(which-key.register {:<leader> {:b {:name :Buffers
                                    :j [":BufferLinePick<cr>" :Jump]
                                    :f [":Telescope buffers previewer=false<cr>"
                                        :Find]
                                    :b [":BufferLineCyclePrev<cr>" :Previous]
                                    :n [":BufferLineCycleNext<cr>" :Next]
                                    :W [":noautocmd w<cr>"
                                        "Save without formatting (noautocmd)"]
                                    :e [":BufferLinePickClose<cr>"
                                        "Pick which buffer to close"]
                                    :h [":BufferLineCloseLeft<cr>"
                                        "Close all to the left"]
                                    :l [":BufferLineCloseRight<cr>"
                                        "Close all to the right"]
                                    :D [":BufferLineSortByDirectory<cr>"
                                        "Sort by directory"]
                                    :L [":BufferLineSortByExtension<cr>"
                                        "Sort by language"]}
                                :c {:name :Color-clipboard}
                                :d {:t {:b [":Telescope terraform_doc"
                                            "Terraform doc"]
                                        :t [":lua require'dap'.toggle_breakpoint()<cr>"
                                            "Toggle Breakpoint"]}
                                    :b [":lua require'dap'.step_back()<cr>"
                                        "Step Back"]
                                    :c [":lua require'dap'.continue()<cr>"
                                        :Continue]
                                    :C [":lua require'dap'.run_to_cursor()<cr>"
                                        "Run To Cursor"]
                                    :d [":lua require'dap'.disconnect()<cr>"
                                        :Disconnect]
                                    :g [":lua require'dap'.session()<cr>"
                                        "Get Session"]
                                    :i [":lua require'dap'.step_into()<cr>"
                                        "Step Into"]
                                    :o [":lua require'dap'.step_over()<cr>"
                                        "Step Over"]
                                    :u [":lua require'dap'.step_out()<cr>"
                                        "Step Out"]
                                    :p [":lua require'dap'.pause()<cr>" :Pause]
                                    :r [":lua require'dap'.repl.toggle()<cr>"
                                        "Toggle Repl"]
                                    :s [":lua require'dap'.continue()<cr>"
                                        :Start]
                                    :q [":lua require'dap'.close()<cr>" :Quit]
                                    :U [":lua require'dapui'.toggle({reset = true})<cr>"
                                        "Toggle UI"]}
                                :e {:name :Errors}
                                :f {:name :Files
                                    :e [":Telescope file_browser<cr>"
                                        :Explorer]
                                    :t [":NvimTreeToggle<cr>" "Tree toggle"]}
                                :g {:name "Git/Version Control"}
                                :h {:name :Help}
                                :i {:name :Insertion}
                                :j {:name :Jump}
                                :l {:name :LSP
                                    :a [":lua vim.lsp.buf.code_action()<cr>"
                                        "Code Action"]
                                    :d [":Telescope diagnostics bufnr=0 theme=get_ivy<cr>"
                                        "Buffer Diagnostics"]
                                    :w [":Telescope diagnostics<cr>"
                                        :Diagnostics]
                                    :f [vim.lsp.buf.format :Format]
                                    :i [:<cmd>LspInfo<cr> :Info]
                                    :I [":Mason<cr>" "Mason Info"]
                                    :j [vim.diagnostic.goto_next
                                        "Next Diagnostic"]
                                    :k [vim.diagnostic.goto_prev
                                        "Prev Diagnostic"]
                                    :l [vim.lsp.codelens.run "CodeLens Action"]
                                    :q [vim.diagnostic.setloclist :Quickfix]
                                    :r [vim.lsp.buf.rename :Rename]
                                    :s [":Telescope lsp_document_symbols<cr>"
                                        "Document Symbols"]
                                    :S [":Telescope lsp_dynamic_workspace_symbols<cr>"
                                        "Workspace Symbols"]
                                    :e [":Telescope quickfix<cr>"
                                        "Telescope Quickfix"]}
                                :n {:name :Narrow/Numbers}
                                :o {:name "User Bindings"}
                                :p {:name :Projects}
                                :q {:name :Quit}
                                :s {:name :Search
                                    :h [":Telescope help_tags<cr>" "Find Help"]
                                    :H [":Telescope highlights<cr>"
                                        "Find highlight groups"]
                                    :M [":Telescope man_pages<cr>" "Man Pages"]
                                    :r [":Telescope oldfiles<cr>"
                                        "Open Recent File"]
                                    :R [":Telescope registers<cr>" :Registers]
                                    :t [":Telescope live_grep<cr>" :Text]
                                    :k [":Telescope keymaps<cr>" :Keymaps]
                                    :C [":Telescope commands<cr>" :Commands]
                                    :p [":lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>"
                                        "Colorscheme with Preview"]}
                                :t {:name :Tabs}
                                :T {:name :Toggle}
                                :w {:name :Windows}}})

(which-key.setup {:plugins {;; show list of your marks on ' and `
                            :marks true
                            ;; shows registers with `"` NORMAL or `<C-r>` INSERT mode
                            :registers true
                            :spelling {;; `z=` to select spelling suggestions
                                       :enabled false
                                       ;; number of spelling suggestions to show
                                       :suggestions 20}
                            ;; presets plugin adds help for several default keybindings in Neovim
                            :presets {;; help for `d`, `y` operators and registers for motion / text object completion
                                      :operators true
                                      ;; help for motions
                                      :motions true
                                      ;; help for text objects triggered after entering an operator
                                      :text_objects true
                                      ;; default bindings on <c-w>
                                      :windows true
                                      ;; misc bindings to work with windows
                                      :nav true
                                      ;; bindings for folds, spelling and others prefixed with z
                                      :z true
                                      ;; bindings for prefixed with g
                                      :g true}}
                  ;; add operators that will trigger motion and text object completion
                  ;; to enable all native operators, set the preset / operators plugin above
                  :operators {:gc :Comments}
                  ;; override the label used to display specified key or sub-menu
                  ;; Use register() function to define menu key and group names
                  :key_labels {[:<cr>] :RET [:<space>] :SPC [:<tab>] :TAB}
                  :icons {;; symbol used in the command line area that shows your active key combo
                          :breadcrumb "»"
                          ;; symbol used between a key and it's label
                          :separator "➜"
                          ;; symbol prepended to a group
                          :group "+"}
                  :popup_mappings {;; binding to scroll down inside the popup
                                   :scroll_down :<c-d>
                                   ;; binding to scroll up inside the popup
                                   :scroll_up :<c-u>}
                  :window {;; none, single, double, shadow
                           :border :none
                           ;; bottom, top
                           :position :bottom
                           ;; extra window margin [top, right, bottom, left]
                           :margin [1 0 1 0]
                           ;; extra window padding [top, right, bottom, left]
                           :padding [2 2 2 2]
                           :winblend 0}
                  :layout {;; min and max height of the columns
                           :height {:min 4 :max 25}
                           ;; min and max width of the columns
                           :width {:min 20 :max 50}
                           ;; spacing between columns
                           :spacing 3
                           ;; align columns left, center or right
                           :align :left}
                  ;; enable this to hide mappings for which you didn't specify a label
                  :ignore_missing false
                  ;; hide mapping boilerplate
                  :hidden [:<silent> ":" ":" :<CR> :call :lua "^:" "^ "]
                  ;; show help message on the command line when the popup is visible
                  :show_help true
                  ;; automatically setup triggers
                  :triggers :auto
                  ;; triggers = {"<leader>"} -- or specify a list manually
                  :triggers_blacklist {;; list of mode / prefixes that should never be hooked by WhichKey
                                       ;; this is mostly relevant for key maps that start with a native binding
                                       ;; most people should not need to change this
                                       :i [:j :k]
                                       :v [:j :k]}})
