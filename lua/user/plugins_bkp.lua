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
require("lazy").setup({
  { "lewis6991/impatient.nvim" },
  {
    "lukas-reineke/headlines.nvim",
    config = function()
      require("headlines").setup()
    end,
  },
  { "ggandor/leap.nvim",       requires = "tpope/vim-repeat" },
  {
    "Wansmer/treesj",
    requires = { "nvim-treesitter" },
  },
  {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  },
  {"nvimtools/none-ls.nvim"},
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { "stsewd/isort.nvim",            run = ":UpdateRemotePlugins" },
  { "kylechui/nvim-surround" },
  { "folke/trouble.nvim" },
  { "simrat39/symbols-outline.nvim" },
  -- {"ThePrimeagen/harpoon"},
  -- use({
  -- 	"ThePrimeagen/refactoring.nvim",
  -- 	requires = {
  -- 		{ "nvim-lua/plenary.nvim" },
  -- 		{ "nvim-treesitter/nvim-treesitter" },
  -- 	},
  -- })
  { "ahmedkhalf/project.nvim" },
  {
    "kiyoon/jupynium.nvim",
    build = "pip3 install --user .",
    -- build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  },
  -- use 'bfredl/nvim-ipy'
  { "goerz/jupytext.vim" },
  -- {"untitled-ai/jupyter_ascending.vim"},
  { "wbthomason/packer.nvim" }, -- Have packer manage itself
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  -- {"nvim-lua/popup.nvim"} -- An implementation of the Popup API from vim in Neovim
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  { "rrethy/nvim-treesitter-textsubjects" },
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  { "numToStr/Comment.nvim" }, -- Easily comment stuff
  { "kyazdani42/nvim-web-devicons" },
  { "monkoose/matchparen.nvim" },
  { "kyazdani42/nvim-tree.lua" },
  { "akinsho/bufferline.nvim" },
  { "akinsho/toggleterm.nvim" },
  -- {"nanozuki/tabby.nvim"},
  { "mg979/vim-visual-multi" },
  { "rrethy/vim-illuminate" },
  { "alvarosevilla95/luatab.nvim",                 requires = "kyazdani42/nvim-web-devicons" },
  { "moll/vim-bbye" },
  -- Debugging
  -- use {
  --   'rmagatti/auto-session',
  --   config = function()
  --     require('auto-session').setup {
  --       log_level = 'info',
  --       auto_session_suppress_dirs = {'~/', '~/Projects'},
  --     },
  --   end
  -- },
  --
  -- use {
  --   'rmagatti/session-lens',
  --   requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  --   config = function()
  --     require('session-lens').setup({--[[your custom config--]]})
  --   end
  --   },
  --
  -- install without yarn or npm
  { "lukas-reineke/indent-blankline.nvim" },
  { "ncm2/ncm2" },
  { "roxma/nvim-yarp" },
  { "jalvesaq/Nvim-R" },
  { "gaalcaras/ncm-R" },
  --
  { "lervag/vimtex" },
  { "goolord/alpha-nvim" },
  -- {"antoinemadec/FixCursorHold.nvim"} -- This is needed to fix lsp doc highlight
  { "folke/which-key.nvim" },
  { "szw/vim-maximizer" },
  --
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "nvim-telescope/telescope-fzf-native.nvim",    run = "make" },
  -- use({ "airblade/vim-rooter" })
  { "junegunn/fzf" }, --- fzf should be installed in ubuntu
  { "junegunn/fzf.vim" },
  { "vigemus/iron.nvim" },
  { "kana/vim-textobj-user" },
  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  -- use  "rafi/awesome-vim-colorschemes"
  { "arcticicestudio/nord-vim" },
  -- {"vim-airline/vim-airline"},
  -- {"vim-airline/vim-airline-themes"},
  -- cmp plugins
  { "jalvesaq/cmp-nvim-r" },
  { "hrsh7th/nvim-cmp" },   -- The completion plugin
  { "onsails/lspkind-nvim" },
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" },   -- path completions
  { "hrsh7th/cmp-cmdline" }, -- cmdline completions
  { "hrsh7th/cmp-nvim-lsp" },
  -- snippets
  { "L3MON4D3/LuaSnip" },            --snippet engine
  { "rafamadriz/friendly-snippets" }, -- a bunch of snippets to use
  { "saadparwaiz1/cmp_luasnip" },    -- snippet completions

  { "mizlan/iswap.nvim" },
  -- {"prettier/vim-prettier"},
  --[[ {"williamboman/nvim-lsp-installer"} -- simple to use language server installer ]]
  { "tamago324/nlsp-settings.nvim" },   -- language server settings defined in json for
  { "jose-elias-alvarez/null-ls.nvim" }, -- for formatters and linters
  { "ray-x/lsp_signature.nvim" },
  { "ray-x/cmp-treesitter" },
  { "Pocco81/auto-save.nvim" },
  -- -- Telescope
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  { "JoosepAlviste/nvim-ts-context-commentstring" },

  { "Civitasv/cmake-tools.nvim" },
  { "skywind3000/asyncrun.vim" },
  { "p00f/clangd_extensions.nvim" },
  { "nvim-lualine/lualine.nvim" },
  -- Git
  { "lewis6991/gitsigns.nvim" },
  -- use({
  --   'python-rope/ropevim',
  --   ft = "python"
  -- })
})
