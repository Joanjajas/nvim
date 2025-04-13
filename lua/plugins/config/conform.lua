local conform = require("conform")

local config = {
    format_on_save = {
        lsp_format = "fallback",
    },

    formatters_by_ft = {
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        sh = { "shfmt" },
    },
}

conform.setup(config)
