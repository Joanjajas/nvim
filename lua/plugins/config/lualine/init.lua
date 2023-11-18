local lualine = require("lualine")

local component = require("plugins.config.lualine.component")

local config = {
  options = {
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
      component.mode,
      component.branch,
      "filename",
      "diff",
    },

    lualine_x = {
      component.lsp_clients,
      component.formatter,
      component.diagnostics,
      "%=",
      component.copilot,
      "%=",
      "location",
      "filetype",
      component.encoding,
      component.fileformat,
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
