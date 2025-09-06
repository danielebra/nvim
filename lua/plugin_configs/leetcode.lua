require("leetcode").setup{
  picker = "telescope",
  lang = "python3",
  hooks = {
    ["enter"] = {
      function()
        local opts = { silent = true, noremap = true }
        vim.keymap.set("n", "<leader>p", "<cmd>Leet list<cr>", opts)
        vim.keymap.set("n", "<leader>P", "<cmd>Leet list difficulty=easy status=todo<cr>", opts)
      end,
    },
    ["question_enter"] = {
      function(q)
        local opts = { buffer = q.bufnr, silent = true, noremap = true }
        vim.keymap.set("n", "<leader>T", "<cmd>Leet test<cr>", opts)
        vim.keymap.set("n", "<leader>S", "<cmd>Leet submit<cr>", opts)
        vim.keymap.set("n", "<leader>p", "<cmd>Leet list<cr>", opts)
        vim.keymap.set("n", "<leader>P", "<cmd>Leet list difficulty=easy status=todo<cr>", opts)
      end,
    }
  }
}
