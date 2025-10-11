return {
    ------------------------------------------------------------------------------
    -- Colorschemes
    ------------------------------------------------------------------------------

    -- Onedark
    {
        "navarasu/onedark.nvim",

        lazy = false,
    },

    -- Gruvbox colorscheme
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

    -- Fuzzy finder
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

    -- Switch betwwen marked project files
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

    -- Lsp config
    {
        "neovim/nvim-lspconfig",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.lsp")
        end,

        dependencies = {
            "williamboman/mason.nvim",
        },
    },

    -- Install lsp servers, dap servers, linters, and formatters
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
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
    },

    ------------------------------------------------------------------------------
    -- Formatting and linting
    ------------------------------------------------------------------------------

    -- Formatting
    {
        'stevearc/conform.nvim',

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.conform")
        end,
    },

    -- Linting
    {
        'mfussenegger/nvim-lint',

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.lint")
        end,
    },

    ------------------------------------------------------------------------------
    -- Autocompletion
    ------------------------------------------------------------------------------

    -- Atuocompletion
    {
        'saghen/blink.cmp',

        version = '1.*',

        event = {
            "InsertEnter",
            "CmdlineEnter",
        },

        config = function()
            require("plugins.config.blink")
        end,
    },

    -- Copilot
    {
        "github/copilot.vim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_no_tab_map = true
        end,
    },

    ------------------------------------------------------------------------------
    -- Comments
    ------------------------------------------------------------------------------

    -- Smart comments
    {
        "numToStr/Comment.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.comment")
        end,
    },

    -- Todo comments
    {
        "folke/todo-comments.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        cmd = "TodoTelescope",

        config = function()
            require("plugins.config.todo")
        end,
    },

    ------------------------------------------------------------------------------
    -- Git
    ------------------------------------------------------------------------------

    -- Git integration
    {
        "lewis6991/gitsigns.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.gitsigns")
        end,
    },

    ------------------------------------------------------------------------------
    -- Ui
    ------------------------------------------------------------------------------

    -- Indent guides
    {
        "lukas-reineke/indent-blankline.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.blankline")
        end,
    },

    ------------------------------------------------------------------------------
    -- Motion
    ------------------------------------------------------------------------------

    -- Jump to any location in the buffer
    {
        "ggandor/leap.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        opts = {},
    },

    -- Better f and t motions
    {
        "rhysd/clever-f.vim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            vim.g.clever_f_smart_case = 1
        end,
    },

    ------------------------------------------------------------------------------
    -- Brackets
    ------------------------------------------------------------------------------

    -- Surround
    {
        "kylechui/nvim-surround",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        opts = {},
    },

    -- Autopairs
    {
        "windwp/nvim-autopairs",

        event = "InsertEnter",
        opts = {},
    },

    ------------------------------------------------------------------------------
    -- Misc
    ------------------------------------------------------------------------------

    -- Improved syntax highlighting and text objects
    {
        "nvim-treesitter/nvim-treesitter",

        event = {
            "BufReadPre",
            "BufNewFile",
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

    -- Undo on steroids
    {
        "mbbill/undotree",

        cmd = "UndotreeToggle",

        config = function()
            vim.g.undotree_WindowLayout = 3
            vim.g.undotree_SetFocusWhenToggle = 1
            vim.g.undotree_ShortIndicators = 1
        end,
    },

    -- Tmux integration
    {
        "christoomey/vim-tmux-navigator",
        event = "VimEnter",
    },

    -- Better select
    {
        'nvim-telescope/telescope-ui-select.nvim',

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        dependencies = {
            "nvim-telescope/telescope.nvim",
        },
    },

    -- Better input
    {
        "folke/snacks.nvim",

        event = {
            "BufReadPre",
            "BufNewFile",
        },

        config = function()
            require("plugins.config.snacks")
        end,
    },
}
