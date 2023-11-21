local lualine = require("lualine")
local component = require("plugins.config.lualine.component")
local theme = require("plugins.config.lualine.theme")

local config = {
  options = {
    theme = theme,
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },

    refresh = {
      statusline = 150,
    },
  },

  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      component.branch,
      "filename",
      "diff",
    },

    lualine_x = {
      component.lsp_clients,
      component.diagnostics,
      component.formatter,
      "%=",
      component.copilot,
      "%=",
      "location",
    },

    lualine_y = {},
    lualine_z = {},
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

lualine.setup(config)
