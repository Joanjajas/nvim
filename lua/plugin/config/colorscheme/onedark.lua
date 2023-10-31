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

  -- TODO: fix tabline colors
  highlights = {
    NormalFloat = { bg = "none" },
    FloatBorder = { bg = "none" },
  },
}

onedark.setup(options)
