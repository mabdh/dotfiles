(module config.plugin.bufferline
  {autoload {nvim aniseed.nvim
             icons config.icons
             bufferline bufferline}})


(fn is-ft [b ft]
  (= (. (. vim.bo b) :filetype) ft))	

(bufferline.setup 
  {:options {:mode :buffers
             :numbers :none
             :close_command (fn [bufnr]
                              (M.buf_kill :bd bufnr false))
             :right_mouse_command "vert sbuffer %d"
             :left_mouse_command "buffer %d"
             :middle_mouse_command nil
             :indicator {:icon icons.ui.BoldLineLeft :style :icon}
             :buffer_close_icon icons.ui.Close
             :modified_icon icons.ui.Circle
             :close_icon icons.ui.BoldClose
             :left_trunc_marker icons.ui.ArrowCircleLeft
             :right_trunc_marker icons.ui.ArrowCircleRight
             :name_formatter (fn [buf]
                               (when (buf.name:match "%.md")
                                 (vim.fn.fnamemodify buf.name ":t:r")))
             :max_name_length 18
             :max_prefix_length 15
             :truncate_names true
             :tab_size 18
             :diagnostics :nvim_lsp
             :diagnostics_update_in_insert false
             :diagnostics_indicator (fn diagnostics-indicator [num _ diagnostics _]
  (var result {})
  (local symbols {:error icons.diagnostics.Error
                  :warning icons.diagnostics.Warning
                  :info icons.diagnostics.Information})
  (each [name count (pairs diagnostics)]
    (when (and (. symbols name) (> count 0))
      (table.insert result (.. (. symbols name) " " count))))
  (set result (table.concat result " "))
  (or (and (> (length result) 0) result) ""))
             :custom_filter (fn custom-filter [buf buf-nums]
  (let [logs (vim.tbl_filter (fn [b]
                               (is-ft b :log))
                             (or buf-nums {}))]
    (when (vim.tbl_isempty logs)
      (lua "return true"))
    (local tab-num (vim.fn.tabpagenr))
    (local last-tab (vim.fn.tabpagenr "$"))
    (local is-log (is-ft buf :log))
    (when (= last-tab 1)
      (lua "return true"))
    (or (and (= tab-num last-tab) is-log)
        (and (not= tab-num last-tab) (not is-log)))))
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
             :hover {:enabled false :delay 200 :reveal [:close]}
             :sort_by :id}
 :highlights {:background {:italic true} :buffer_selected {:bold true}}})
