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
      {
        "filename",
        path = 1,
      },
      "diff",
    },

    lualine_x = {
      component.lsp_clients,
      component.diagnostics,
      component.formatter,
      "%=",
      component.copilot,
      "%=",
    },

    lualine_y = {},
    lualine_z = {
      {
        "location",
        fmt = function()
          local current_line = vim.fn.line(".")
          local total_lines = vim.fn.line("$")
          local column = vim.fn.col(".")
          return string.format(
            "[%d:%d] | [%d]",
            current_line,
            total_lines,
            column
          )
        end,
      },
    },
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
