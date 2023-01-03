-- vim.g.ultest_running_sign = "羽"
-- TODO: Icons, notifications
require("neotest").setup({
  adapters = {
    require("neotest-python")({
      dap = { justMyCode = false },
    }),
  },
})
