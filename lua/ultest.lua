-- vim.g.ultest_running_sign = "羽"
-- TODO: notifications
require("neotest").setup({
  icons = {
      child_indent = "│",
      child_prefix = "├",
      collapsed = "─",
      expanded = "╮",
      failed = "✖",
      final_child_indent = " ",
      final_child_prefix = "╰",
      non_collapsible = "─",
      passed = "✔",
      running = "羽",
      running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
      skipped = "-",
      unknown = "?"
    },
    quickfix = {
      enabled = false
    },
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
      args = { "--reuse-db", "--disable-pytest-warnings" },
    }),
  },
})
