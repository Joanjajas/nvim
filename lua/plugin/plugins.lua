return {
  -- colorscheme
  {
    "ellisonleao/gruvbox.nvim",

    lazy = false,

    config = function()
      require("plugin.config.colorscheme.gruvbox")
    end,
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",

    event = "VimEnter",

    config = function()
      require("plugin.config.nvimtree")
    end,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",

    event = "VimEnter",

    config = function()
      require("plugin.config.lualine")
    end,
  },

  -- tmux integration
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },

  -- indent guides
  {
    "lukas-reineke/indent-blankline.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugin.config.blankline")
    end,
  },

  -- git integration
  {
    "lewis6991/gitsigns.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugin.config.gitsigns")
    end,
  },

  -- improved syntax highlighting and text objects
  {
    "nvim-treesitter/nvim-treesitter",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    cmd = {
      "TSInstall",
      "TSUninstall",
      "TSUpdate",
    },

    config = function()
      require("plugin.config.treesitter.treesitter")
    end,

    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",

        config = function()
          require("plugin.config.treesitter.textobjects")
        end,
      },

      "nvim-treesitter/nvim-treesitter-context",
    },
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugin.config.lsp")
    end,

    dependencies = {
      "folke/neodev.nvim",
      "ray-x/lsp_signature.nvim",
      "nvimdev/lspsaga.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  -- copilot
  {
    "github/copilot.vim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },
  },

  -- manage code formatters
  {
    "jose-elias-alvarez/null-ls.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugin.config.null-ls")
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- smart comments
  {
    "numToStr/Comment.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugin.config.comment")
    end,
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    cmd = "TodoTelescope",

    config = function()
      require("plugin.config.todo")
    end,
  },

  -- colorizer
  {
    "norcalli/nvim-colorizer.lua",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugin.config.colorizer")
    end,
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",

    event = "InsertEnter",
    opts = {},
  },

  -- tabline
  {
    "alvarosevilla95/luatab.nvim",

    event = "TabNew",
    opts = {},
  },

  -- atuocompletion
  {
    "hrsh7th/nvim-cmp",

    event = {
      "InsertEnter",
      "CmdlineEnter",
    },

    config = function()
      require("plugin.config.cmp")
    end,

    dependencies = {
      -- snippet engine
      "L3MON4D3/LuaSnip",

      -- icons
      "onsails/lspkind.nvim",

      -- cmp sources
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },

  -- snippet engine
  {
    "L3MON4D3/LuaSnip",

    config = function()
      require("plugin.config.luasnip")
    end,

    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",

    cmd = "Telescope",

    config = function()
      require("plugin.config.telescope")
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },

  -- install lsp servers, dap servers, linters, and formatters
  {
    "williamboman/mason.nvim",

    cmd = {
      "MasonInstall",
      "MasonInstallAll",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "Mason",
    },

    config = function()
      require("plugin.config.mason")
    end,
  },
}
