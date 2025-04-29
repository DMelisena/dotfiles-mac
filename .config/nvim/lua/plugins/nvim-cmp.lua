return {
  {
    "hrsh7th/nvim-cmp", -- 🔹 this is the core completion plugin
    enabled = true,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source
      "hrsh7th/cmp-buffer", -- buffer source
      "hrsh7th/cmp-path", -- path source
      "L3MON4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- LuaSnip source
    },
    config = function()
      -- your nvim-cmp config goes here
    end,
  },
}
