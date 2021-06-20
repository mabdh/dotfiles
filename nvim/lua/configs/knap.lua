local coreutils = require("core.utils")

coreutils.set_mappings({
    n = {
      ["<F5>"] = { function() require("knap").process_once() end, desc = "Process and Refresh" },
      ["<F6>"] = { function() require("knap").close_viewer() end, desc = "Close and Reset Settings" },
      ["<F7>"] = { function() require("knap").toggle_autopreviewing() end, desc = "Toggle Autopreview" },
    },
    i = {
      ["<F5>"] = { function() require("knap").process_once() end, desc = "Process and Refresh" },
      ["<F6>"] = { function() require("knap").close_viewer() end, desc = "Close and Reset Settings" },
      ["<F7>"] = { function() require("knap").toggle_autopreviewing() end, desc = "Toggle Autopreview" },
    },
    v = {
      ["<F5>"] = { function() require("knap").process_once() end, desc = "Process and Refresh" },
      ["<F6>"] = { function() require("knap").close_viewer() end, desc = "Close and Reset Settings" },
      ["<F7>"] = { function() require("knap").toggle_autopreviewing() end, desc = "Toggle Autopreview" },
    },
})
