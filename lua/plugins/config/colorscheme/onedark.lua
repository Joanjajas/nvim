local onedark = require("onedark")

local config = {
  style = "deep",
  transparent = true,

  diagnostics = {
    background = false,
    darker = true,
  },

  highlights = {
    Tabline = { bg = "none" },
    TablineFill = { bg = "none" },
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
    TablineSel = { bg = "none", fg = "#61afef" },
    DiagnosticUnnecessary = { fg = "none" },
  },
}

onedark.setup(config)
