local onedark = require("onedark")

local config = {
  style = "deep",
  transparent = true,

  diagnostics = {
    background = false,
    darker = true,
  },

  highlights = {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    TablineFill = { bg = "none" },
    TablineSel = { bg = "none", fg = "#61afef" },
    ColorColumn = { bg = "#161616" },
    Tabline = { bg = "none" },
  },
}

onedark.setup(config)
