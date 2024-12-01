local gruvbox = require("gruvbox")

local config = {
  overrides = {
    Tabline = { bg = "none" },
    TablineFill = { bg = "none" },
    SignColumn = { bg = "none" },
    TablineSel = { bg = "none" },
    DiagnosticUnnecessary = { bg = "none" },
    DiagnosticSignError = { bg = "none", fg = "#fb4934" },
    DiagnosticSignWarn = { bg = "none", fg = "#fabd2f" },
    DiagnosticSignInfo = { bg = "none", fg = "#83a598" },
    DiagnosticSignHint = { bg = "none", fg = "#8ec07c" },
  },
}

gruvbox.setup(config)
