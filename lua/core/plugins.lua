--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'navarasu/onedark.nvim',
  'nvim-telescope/telescope.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-lualine/lualine.nvim',
  'akinsho/bufferline.nvim',
  'nvim-treesitter/nvim-treesitter',
  'vim-scripts/a.vim',
  'kyazdani42/nvim-web-devicons',
  'L3MON4D3/LuaSnip',
  'Nemausa/friendly-snippets', 
  'tpope/vim-fugitive',
  'sindrets/diffview.nvim',
  'lewis6991/gitsigns.nvim',
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-dap-python',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-neotest/nvim-nio',
  'neovim/nvim-lspconfig',
  {'neoclide/coc.nvim', branch = 'release'},
  -- 'folke/which-key.nvim',
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    config = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end
  },
  'akinsho/toggleterm.nvim',
  {
    'folke/noice.nvim',
    event = "VeryLazy",
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require("noice").setup()
    end
  }
})
