local onedark = require("onedark")

local options = {
  style = "deep",
  transparent = true,

  lualine = {
    transparent = true,
  },

  diagnostics = {
    background = false,
    darker = true,
  },

  highlights = {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    StatusLine = { bg = "none" },
    StatusLineNC = { bg = "none" },
    TablineFill = { bg = "none" },
    TablineSel = { bg = "none", fg = "#61afef" },
    Tabline = { bg = "none" },
    ColorColumn = { bg = "#111111 " },
  },
}

onedark.setup(options)
