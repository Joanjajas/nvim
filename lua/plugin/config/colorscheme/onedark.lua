local onedark = require("onedark")

local options = {
  style = "deep",
  transparent = true,

  lualine = {
    transparent = true,
  },

  diagnostics = {
    background = false,
    darker = false,
  },

  highlights = {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    TablineFill = { bg = "none" },
    TablineSel = { bg = "none", fg = "#61afef" },
    Tabline = { bg = "none" },
  },
}

onedark.setup(options)
