local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_null_ls = require("mason-null-ls")

local mason_config = {
  PATH = "skip",
}

local mason_lspconfig_config = {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "pyright",
    "bashls",
    "dockerls",
    "docker_compose_language_service",
  },
}

local mason_null_ls_config = {
  ensure_installed = {
    "stylua",
    "shfmt",
  },
}

mason.setup(mason_config)
mason_lspconfig.setup(mason_lspconfig_config)
mason_null_ls.setup(mason_null_ls_config)
