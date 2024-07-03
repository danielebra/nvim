require("toggleterm").setup{
  shadeTerminals = false  -- Disable shading feature as it janks out on transparent backgrounds
}

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    count=5,
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      -- vim.cmd("startinsert!")
      -- vim.api.nvim_buf_del_keymap(term.bufnr, "n", "<tab>")
      -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<tab>", "<tab>", {noremap = true, silent = true})
      -- vim.api.nvim_buf_set_keymap(term.bufnr, "i", "<esc>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
      -- WIP: Escape to toggle lazygit and maintain it's session
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
      -- vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
    end,
    -- function to run on closing the terminal
    -- on_close = function(term)
    --   vim.cmd("Closing terminal")
    -- end,
  })

  function _lazygit_toggle()
    lazygit:toggle()
  end

local lazydocker = Terminal:new({
    cmd = "lazydocker",
    dir = "git_dir",
    count=5,
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
      vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>lua _lazydocker_toggle()<CR>", {noremap = true, silent = true})
    end,
  })

  function _lazydocker_toggle()
    lazydocker:toggle()
  end
