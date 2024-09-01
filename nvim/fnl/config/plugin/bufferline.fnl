(module config.plugin.bufferline
        {autoload {nvim aniseed.nvim icons config.icons bufferline bufferline}})

(fn is-ft [b ft]
  (= (. (. vim.bo b) :filetype) ft))

(fn buf_kill [kill-command bufnr]
  (set-forcibly! kill-command (or kill-command :bd))
  (when (or (= bufnr 0) (= bufnr nil))
    (set-forcibly! bufnr (vim.api.nvim_get_current_buf)))
  (local bufname (vim.api.nvim_buf_get_name bufnr))
  (var warning nil)
  (if (. (. vim.bo bufnr) :modified)
      (set warning
           (string.format "No write since last change for (%s)"
                          (vim.fn.fnamemodify bufname ":t")))
      (= (vim.api.nvim_buf_get_option bufnr :buftype) :terminal)
      (set warning (string.format "Terminal %s will be killed" bufname)))
  (when warning
    (vim.ui.input {:prompt (string.format "%s. Close it anyway? [y]es or [n]o (default: no): "
                                          warning)}
                  (fn [choice]
                    (when (and (not= choice nil) (choice:match :ye?s?))
                      (buf-force-kill kill-command bufnr))))
    (lua "return "))
  (local windows (vim.tbl_filter (fn [win]
                                   (= (vim.api.nvim_win_get_buf win) bufnr))
                                 (vim.api.nvim_list_wins)))
  (local buffers (vim.tbl_filter (fn [buf]
                                   (and (vim.api.nvim_buf_is_valid buf)
                                        (. (. vim.bo buf) :buflisted)))
                                 (vim.api.nvim_list_bufs)))
  (when (and (> (length buffers) 1) (> (length windows) 0))
    (each [i v (ipairs buffers)]
      (when (= v bufnr)
        (local prev-buf-idx (or (and (= i 1) (length buffers)) (- i 1)))
        (local prev-buffer (. buffers prev-buf-idx))
        (each [_ win (ipairs windows)]
          (vim.api.nvim_win_set_buf win prev-buffer)))))
  (when (and (vim.api.nvim_buf_is_valid bufnr) (. (. vim.bo bufnr) :buflisted))
    (vim.cmd (string.format "%s %d" kill-command bufnr))))

(fn buf-force-kill [kill-command bufnr]
  (set-forcibly! kill-command (or kill-command :bd))
  (when (or (= bufnr 0) (= bufnr nil))
    (set-forcibly! bufnr (vim.api.nvim_get_current_buf)))
  (local bufname (vim.api.nvim_buf_get_name bufnr))
  (local windows (vim.tbl_filter (fn [win]
                                   (= (vim.api.nvim_win_get_buf win) bufnr))
                                 (vim.api.nvim_list_wins)))
  (set-forcibly! kill-command (.. kill-command "!"))
  (local buffers (vim.tbl_filter (fn [buf]
                                   (and (vim.api.nvim_buf_is_valid buf)
                                        (. (. vim.bo buf) :buflisted)))
                                 (vim.api.nvim_list_bufs)))
  (when (and (> (length buffers) 1) (> (length windows) 0))
    (each [i v (ipairs buffers)]
      (when (= v bufnr)
        (local prev-buf-idx (or (and (= i 1) (length buffers)) (- i 1)))
        (local prev-buffer (. buffers prev-buf-idx))
        (each [_ win (ipairs windows)]
          (vim.api.nvim_win_set_buf win prev-buffer)))))
  (when (and (vim.api.nvim_buf_is_valid bufnr) (. (. vim.bo bufnr) :buflisted))
    (vim.cmd (string.format "%s %d" kill-command bufnr))))

(bufferline.setup {:options {:mode :buffers
                             :numbers :none
                             :close_command (fn [bufnr]
                                              (buf_kill :bd bufnr false))
                             :right_mouse_command "vert sbuffer %d"
                             :left_mouse_command "buffer %d"
                             :middle_mouse_command nil
                             :indicator {:icon icons.ui.BoldLineLeft
                                         :style :icon}
                             :buffer_close_icon icons.ui.Close
                             :modified_icon icons.ui.Circle
                             :close_icon icons.ui.BoldClose
                             :left_trunc_marker icons.ui.ArrowCircleLeft
                             :right_trunc_marker icons.ui.ArrowCircleRight
                             :name_formatter (fn [buf]
                                               (when (buf.name:match "%.md")
                                                 (vim.fn.fnamemodify buf.name
                                                                     ":t:r")))
                             :max_name_length 18
                             :max_prefix_length 15
                             :truncate_names true
                             :tab_size 18
                             :diagnostics :nvim_lsp
                             :diagnostics_update_in_insert false
                             :diagnostics_indicator (fn diagnostics-indicator [num
                                                                               _
                                                                               diagnostics
                                                                               _]
                                                      (var result {})
                                                      (local symbols
                                                             {:error icons.diagnostics.Error
                                                              :warning icons.diagnostics.Warning
                                                              :info icons.diagnostics.Information})
                                                      (each [name count (pairs diagnostics)]
                                                        (when (and (. symbols
                                                                      name)
                                                                   (> count 0))
                                                          (table.insert result
                                                                        (.. (. symbols
                                                                               name)
                                                                            " "
                                                                            count))))
                                                      (set result
                                                           (table.concat result
                                                                         " "))
                                                      (or (and (> (length result)
                                                                  0)
                                                               result)
                                                          ""))
                             :custom_filter (fn custom-filter [buf buf-nums]
                                              (let [logs (vim.tbl_filter (fn [b]
                                                                           (is-ft b
                                                                                  :log))
                                                                         (or buf-nums
                                                                             {}))]
                                                (when (vim.tbl_isempty logs)
                                                  (lua "return true"))
                                                (local tab-num
                                                       (vim.fn.tabpagenr))
                                                (local last-tab
                                                       (vim.fn.tabpagenr "$"))
                                                (local is-log (is-ft buf :log))
                                                (when (= last-tab 1)
                                                  (lua "return true"))
                                                (or (and (= tab-num last-tab)
                                                         is-log)
                                                    (and (not= tab-num last-tab)
                                                         (not is-log)))))
                             :offsets [{:filetype :undotree
                                        :text :Undotree
                                        :highlight :PanelHeading
                                        :padding 1}
                                       {:filetype :NvimTree
                                        :text :Explorer
                                        :highlight :PanelHeading
                                        :padding 1}
                                       {:filetype :DiffviewFiles
                                        :text "Diff View"
                                        :highlight :PanelHeading
                                        :padding 1}
                                       {:filetype :flutterToolsOutline
                                        :text "Flutter Outline"
                                        :highlight :PanelHeading}
                                       {:filetype :lazy
                                        :text :Lazy
                                        :highlight :PanelHeading
                                        :padding 1}]
                             :color_icons true
                             :show_buffer_icons true
                             :show_buffer_close_icons true
                             :show_close_icon false
                             :show_tab_indicators true
                             :persist_buffer_sort true
                             :separator_style :thin
                             :enforce_regular_tabs false
                             :always_show_bufferline false
                             :hover {:enabled false
                                     :delay 200
                                     :reveal [:close]}
                             :sort_by :id}
                   :highlights {:background {:italic true}
                                :buffer_selected {:bold true}}})
