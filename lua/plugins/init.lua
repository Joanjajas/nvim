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
            "BufNewFile",
            "BufReadPost",
        },

        config = function()
            require("plugins.config.lsp")
        end,

        dependencies = {
            "ray-x/lsp_signature.nvim",
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
            "BufNewFile",
            "BufReadPost",
        },

        config = function()
            require("plugins.config.conform")
        end,
    },

    -- Linting
    {
        'mfussenegger/nvim-lint',

        event = {
            "BufNewFile",
            "BufReadPost",
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
        "hrsh7th/nvim-cmp",

        event = {
            "InsertEnter",
            "CmdlineEnter",
        },

        config = function()
            require("plugins.config.cmp")
        end,

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
        },
    },

    -- Copilot
    {
        "github/copilot.vim",

        event = {
            "BufNewFile",
            "BufReadPost",
            "BufEnter",
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
            "BufNewFile",
            "BufReadPost",
        },

        config = function()
            require("plugins.config.comment")
        end,
    },

    -- Todo comments
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

    -- Git integration
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

    -- Indent guides
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

    -- Jump to any location in the buffer
    {
        "ggandor/leap.nvim",

        event = {
            "BufNewFile",
            "BufReadPost",
        },

        opts = {},
    },

    -- Better f and t motions
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

    -- Surround
    {
        "kylechui/nvim-surround",

        event = {
            "BufNewFile",
            "BufReadPost",
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
    },

    -- Better input
    {
        "folke/snacks.nvim",

        event = {
            "BufNewFile",
            "BufReadPost",
        },

        config = function()
            require("plugins.config.snacks")
        end,
    },
}
