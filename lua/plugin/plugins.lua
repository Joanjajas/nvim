return {
  -- onedark colorscheme
  {
    "navarasu/onedark.nvim",

    lazy = false,

    config = function()
      require("plugin.config.colorscheme.onedark")
    end,
  },

  -- gruvbox colorscheme
  {
    "ellisonleao/gruvbox.nvim",

    lazy = false,

    config = function()
      require("plugin.config.colorscheme.gruvbox")
    end,
  },

  -- switch betwwen marked project files
  {
    "ThePrimeagen/harpoon",

    event = "VimEnter",

    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- tmux integration
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
      "BufLeave",
      "InsertEnter",
      "CursorMoved",
    },

    config = function()
      require("plugin.config.lualine")
    end,
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
      require("plugin.config.treesitter")
    end,

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
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

  -- surround
  {
    "kylechui/nvim-surround",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    opts = {},
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

  -- copilot
  {
    "github/copilot.vim",

    event = {
      "BufNewFile",
      "BufReadPost",
      "BufLeave",
    },

    config = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
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
      -- snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",

      -- icons
      "onsails/lspkind.nvim",

      -- cmp sources
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",

    cmd = "NvimTreeToggle",

    config = function()
      require("plugin.config.nvimtree")
    end,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- undo on steroids
  {
    "mbbill/undotree",

    cmd = "UndotreeToggle",

    config = function()
      vim.g.undotree_WindowLayout = 3
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_ShortIndicators = 1
    end,
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
