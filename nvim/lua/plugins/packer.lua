vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use("nvim-treesitter/playground")
  use("mbbill/undotree")
  use("tpope/vim-fugitive")

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {
        -- Optional
        "williamboman/mason.nvim",
        run = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
    },
  })
  -- use("HiPhish/nvim-ts-rainbow2")
  use("HiPhish/rainbow-delimiters.nvim")
  use("Mofiqul/vscode.nvim")
  use("folke/zen-mode.nvim")
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
  })

  use("norcalli/nvim-colorizer.lua")
  use("terrortylor/nvim-comment")

  -- use("jose-elias-alvarez/null-ls.nvim")
  use("nvimtools/none-ls.nvim")
  use("MunifTanjim/prettier.nvim")
  use("lewis6991/gitsigns.nvim")
  use("feline-nvim/feline.nvim")
  use("akinsho/toggleterm.nvim")
  use("windwp/nvim-autopairs")
  use("lukas-reineke/indent-blankline.nvim")
  use({
    "kwkarlwang/bufresize.nvim",
    config = function()
      require("bufresize").setup()
    end,
  })
  use({
    "akinsho/bufferline.nvim",
    tag = "*",
    requires = "nvim-tree/nvim-web-devicons",
  })
  use("Issafalcon/lsp-overloads.nvim")
  use("windwp/nvim-ts-autotag")
  use("simrat39/rust-tools.nvim")
end)
