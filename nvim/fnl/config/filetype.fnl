(module config.filetype
{autoload {nvim aniseed.nvim
           util config.util}})

;; --------------------
;; Filetype configuration

;; Set Conjure and other filetype line comments to ;;
(vim.api.nvim_create_autocmd
        :FileType {:group (vim.api.nvim_create_augroup :commentary_config {:clear true})
                   :pattern  [:lisp :clojure :racket :fennel]
                   :callback (fn [] (set vim.opt_local.commentstring ";; %s") nil)})

;; set filetypes filename extensions for Clojure
;; autocmd BufNewFile,BufRead .edn,clj,.cljstyle set filetype=clojure
(nvim.ex.autocmd "BufNewFile,BufRead" ".edn,.clj,.cljstyle" "set filetype=clojure")

;; Set go filetype
(vim.api.nvim_create_autocmd :BufWritePre
                             {:pattern :*.go
                              :callback (fn []
                                          ((. (require :go.format) :goimport)))
                              :group (vim.api.nvim_create_augroup :GoFormat {})})

