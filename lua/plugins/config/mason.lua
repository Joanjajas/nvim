local mason = require("mason")
local mason_tool_installer = require("mason-tool-installer")

local mason_config = {
    PATH = "skip",
}

local mason_tool_installer_config = {
    ensure_installed = {
        "lua-language-server",
        "rust-analyzer",
        "pyright",
        "bash-language-server",
        "ruff",
        "dockerfile-language-server",
        "shellcheck",
        "mypy",
        "shfmt",
        "ruff",
        "docker-compose-language-service",
    },

    auto_update = true,
}

mason.setup(mason_config)
mason_tool_installer.setup(mason_tool_installer_config)
