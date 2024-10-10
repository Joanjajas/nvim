return {
  ------------------------------------------------------------------------------
  -- Colorschemes
  ------------------------------------------------------------------------------

  -- onedark
  {
    "navarasu/onedark.nvim",

    lazy = false,

    config = function()
      require("plugins.config.colorscheme.onedark")
    end,
  },

  -- gruvbox colorscheme
  {
    "ellisonleao/gruvbox.nvim",

    lazy = false,

    config = function()
      require("plugins.config.colorscheme.gruvbox")
    end,
  },

  ------------------------------------------------------------------------------
  -- File navigation
  ------------------------------------------------------------------------------

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",

    config = function()
      require("plugins.config.telescope")
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
  },

  -- file explorer
  {
    "nvim-tree/nvim-tree.lua",

    cmd = "NvimTreeToggle",

    config = function()
      require("plugins.config.nvimtree")
    end,

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- switch betwwen marked project files
  {
    "ThePrimeagen/harpoon",

    branch = "harpoon2",

    config = function()
      require("plugins.config.harpoon")
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  ------------------------------------------------------------------------------
  -- Lsp
  ------------------------------------------------------------------------------

  -- lsp config
  {
    "neovim/nvim-lspconfig",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugins.config.lsp")
    end,

    dependencies = {
      "folke/neodev.nvim",
      "ray-x/lsp_signature.nvim",
      "nvimtools/none-ls.nvim",
      "williamboman/mason.nvim",
    },
  },

  -- install lsp servers, dap servers, linters, and formatters
  {
    "williamboman/mason.nvim",

    cmd = {
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "Mason",
    },

    config = function()
      require("plugins.config.mason")
    end,

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "jay-babu/mason-null-ls.nvim",
    },
  },

  -- manage code formatters as lsp sources
  {
    "nvimtools/none-ls.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugins.config.null-ls")
    end,

    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  ------------------------------------------------------------------------------
  -- Autocompletion
  ------------------------------------------------------------------------------

  -- atuocompletion
  {
    "hrsh7th/nvim-cmp",

    event = {
      "InsertEnter",
      "CmdlineEnter",
    },

    config = function()
      require("plugins.config.cmp")
    end,

    dependencies = {
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

  ------------------------------------------------------------------------------
  -- Comments
  ------------------------------------------------------------------------------

  -- smart comments
  {
    "numToStr/Comment.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugins.config.comment")
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
      require("plugins.config.todo")
    end,
  },

  ------------------------------------------------------------------------------
  -- Git
  ------------------------------------------------------------------------------

  -- git integration
  {
    "lewis6991/gitsigns.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      require("plugins.config.gitsigns")
    end,
  },

  ------------------------------------------------------------------------------
  -- Ui
  ------------------------------------------------------------------------------

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
      require("plugins.config.lualine")
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
      require("plugins.config.blankline")
    end,
  },

  ------------------------------------------------------------------------------
  -- Motion
  ------------------------------------------------------------------------------

  -- jump to any location in the buffer
  {
    "ggandor/leap.nvim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    opts = {},
  },

  -- better f and t motions
  {
    "rhysd/clever-f.vim",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    config = function()
      vim.g.clever_f_smart_case = 1
    end,
  },

  ------------------------------------------------------------------------------
  -- Brackets
  ------------------------------------------------------------------------------

  -- surround
  {
    "kylechui/nvim-surround",

    event = {
      "BufNewFile",
      "BufReadPost",
    },

    opts = {},
  },

  -- autopairs
  {
    "windwp/nvim-autopairs",

    event = "InsertEnter",
    opts = {},
  },

  ------------------------------------------------------------------------------
  -- Misc
  ------------------------------------------------------------------------------

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
      require("plugins.config.treesitter")
    end,

    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
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

  -- tmux integration
  {
    "christoomey/vim-tmux-navigator",
    event = "VimEnter",
  },
}
