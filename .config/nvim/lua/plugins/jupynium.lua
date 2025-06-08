return {
  {
    "kiyoon/jupynium.nvim",
    build = "/Users/elisena/coretools-venv/bin/pip install .",
    config = function()
      local opts = { noremap = true, silent = true }

      -- Setup jupynium
      require("jupynium").setup({
        use_default_keybindings = false,
        textobjects = {
          use_default_keybindings = false,
        },
        python_host = "/Users/elisena/coretools-venv/bin/python",
        default_notebook_URL = "http://localhost:8888/nbclassic",
        auto_start_server = { enable = true, file_pattern = { "*.ju.*" } },
        auto_attach_to_server = { enable = true, file_pattern = { "*.ju.*", "*.md" } },
        auto_start_sync = { enable = true, file_pattern = { "*.ju.*", "*.md" } },
      })

      -- Use Jupynium commands instead of direct function calls
      vim.keymap.set("n", "<leader>je", "<cmd>JupyniumExecuteSelectedCells<CR>", opts)
      vim.keymap.set("n", "<leader>jc", "<cmd>JupyniumClearSelectedCellsOutputs<CR>", opts)
      vim.keymap.set("n", "<leader>jp", "<cmd>JupyniumScrollUp<CR>", opts)
      vim.keymap.set("n", "<leader>jn", "<cmd>JupyniumScrollDown<CR>", opts)
      vim.keymap.set("n", "<leader>js", "<cmd>JupyniumScrollToCell<CR>", opts)
      vim.keymap.set("n", "<leader>jh", "<cmd>JupyniumKernelHover<CR>", opts)
      vim.keymap.set("n", "<leader>jt", "<cmd>JupyniumToggleSelectedCellsOutputsScroll<CR>", opts)

      -- Additional useful commands
      vim.keymap.set("n", "<leader>jk", "<cmd>JupyniumKernelSelect<CR>", opts)
      vim.keymap.set("n", "<leader>jr", "<cmd>JupyniumKernelRestart<CR>", opts)
      vim.keymap.set("n", "<leader>jo", "<cmd>JupyniumStartAndAttachToServer<CR>", opts)
      vim.keymap.set("n", "<leader>jq", "<cmd>JupyniumStopServer<CR>", opts)

      -- Textobject navigation
      local textobj = require("jupynium.textobj")
      vim.keymap.set("n", "[j", textobj.goto_previous_cell_separator, opts)
      vim.keymap.set("n", "]j", textobj.goto_next_cell_separator, opts)
      vim.keymap.set("n", "<leader>jj", textobj.goto_current_cell_separator, opts)

      -- Optional: Set up textobjects for cell selection
      vim.keymap.set("x", "aj", textobj.select_cell, opts)
      vim.keymap.set("x", "ij", textobj.select_cell_content, opts)
      vim.keymap.set("o", "aj", textobj.select_cell, opts)
      vim.keymap.set("o", "ij", textobj.select_cell_content, opts)
    end,
  },
  "rcarriga/nvim-notify",
  "stevearc/dressing.nvim",
}
